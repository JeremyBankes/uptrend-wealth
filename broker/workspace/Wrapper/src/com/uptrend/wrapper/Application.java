package com.uptrend.wrapper;

import java.io.IOException;
import java.net.InetSocketAddress;

import com.sun.net.httpserver.HttpExchange;
import com.sun.net.httpserver.HttpServer;

public abstract class Application {

	private HttpServer server;

	public Application(int port) throws IOException {
		server = HttpServer.create(new InetSocketAddress(port), 0);
		server.createContext("/accountSize", this::onRequestAccountBalance);
	}

	protected abstract void connect();
	
	protected abstract void disconnect();
	
	protected abstract void onRequestAccountBalance(HttpExchange exchange);

	public void start() {
		System.out.println("Starting application...");
		connect();
		server.start();
	}

	public void stop() {
		System.out.println("Stopping application...");
		disconnect();
		server.stop(30);
	}

}
