package com.jeremy.ibwrapper;

import java.io.IOException;
import java.io.OutputStream;

import org.json.simple.JSONObject;

import com.ib.client.EClientSocket;
import com.ib.client.EJavaSignal;
import com.ib.client.EReader;
import com.sun.net.httpserver.HttpExchange;
import com.uptrend.wrapper.Application;

public class IBWrapperApplication extends Application {

	private int nextRequestId;

	private String host;
	private int port;

	private IBWrapper wrapper = new IBWrapper();
	private EJavaSignal signal = new EJavaSignal();
	private EClientSocket clientSocket;

	public IBWrapperApplication(String ibHost, int ibPort, int webServerPort) throws IOException {
		super(webServerPort);
		this.host = ibHost;
		this.port = ibPort;
		clientSocket = new EClientSocket(wrapper, signal);
	}

	@Override
	protected void connect() {
		clientSocket.eConnect(host, port, 1);
		new Thread(this::processMessages).start();
		makeAPIRequests();
	}

	@Override
	protected void disconnect() {
		clientSocket.eDisconnect();
	}

	private void processMessages() {
		EReader reader = new EReader(clientSocket, signal);
		reader.start();
		while (clientSocket.isConnected()) {
			try {
				signal.waitForSignal();
				reader.processMsgs();
			} catch (Exception exception) {
				exception.printStackTrace();
			}
		}
	}

	@Override
	protected void onRequestAccountBalance(HttpExchange exchange) {		
		JSONObject body = new JSONObject();
		body.put("accountSize", wrapper.accountTotalCashValue);
		byte[] data = body.toJSONString().getBytes();
		try {
			exchange.sendResponseHeaders(200, data.length);
			exchange.getResponseHeaders().set("Content-Type", "application/json");
			OutputStream outputStream = exchange.getResponseBody();
			outputStream.write(data);
			outputStream.close();
		} catch (IOException exception) {
			exception.printStackTrace();
		}
	}

	private void makeAPIRequests() {
		clientSocket.reqAccountSummary(getRequestId(), "All", "AccountType,TotalCashValue");
	}

	private int getRequestId() {
		return nextRequestId++;
	}

}
