package com.jeremy.ibwrapper;

import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import com.ib.client.Bar;
import com.ib.client.CommissionReport;
import com.ib.client.Contract;
import com.ib.client.ContractDescription;
import com.ib.client.ContractDetails;
import com.ib.client.DeltaNeutralContract;
import com.ib.client.DepthMktDataDescription;
import com.ib.client.EWrapper;
import com.ib.client.Execution;
import com.ib.client.FamilyCode;
import com.ib.client.HistogramEntry;
import com.ib.client.HistoricalTick;
import com.ib.client.HistoricalTickBidAsk;
import com.ib.client.HistoricalTickLast;
import com.ib.client.NewsProvider;
import com.ib.client.Order;
import com.ib.client.OrderState;
import com.ib.client.PriceIncrement;
import com.ib.client.SoftDollarTier;
import com.ib.client.TickAttrib;
import com.ib.client.TickAttribBidAsk;
import com.ib.client.TickAttribLast;
import com.ib.controller.AccountSummaryTag;

public class IBWrapper implements EWrapper {
	
	public double accountTotalCashValue = 0.0;
	
	@Override
	public void tickPrice(int tickerId, int field, double price, TickAttrib attrib) {
		System.out.println("tickPrice");
	}

	@Override
	public void tickSize(int tickerId, int field, int size) {
		System.out.println("tickSize");
	}

	@Override
	public void tickOptionComputation(int tickerId, int field, double impliedVol, double delta, double optPrice,
			double pvDividend, double gamma, double vega, double theta, double undPrice) {
		System.out.println("tickOptionComputation");
	}

	@Override
	public void tickGeneric(int tickerId, int tickType, double value) {
		System.out.println("tickGeneric");
	}

	@Override
	public void tickString(int tickerId, int tickType, String value) {
		System.out.println("tickString");
	}

	@Override
	public void tickEFP(int tickerId, int tickType, double basisPoints, String formattedBasisPoints,
			double impliedFuture, int holdDays, String futureLastTradeDate, double dividendImpact,
			double dividendsToLastTradeDate) {
		System.out.println("tickEFP");
	}

	@Override
	public void orderStatus(int orderId, String status, double filled, double remaining, double avgFillPrice,
			int permId, int parentId, double lastFillPrice, int clientId, String whyHeld, double mktCapPrice) {
		System.out.println("orderStatus");
	}

	@Override
	public void openOrder(int orderId, Contract contract, Order order, OrderState orderState) {
		System.out.println("openOrder");
	}

	@Override
	public void openOrderEnd() {
		System.out.println("openOrderEnd");
	}

	@Override
	public void updateAccountValue(String key, String value, String currency, String accountName) {
		System.out.println("updateAccountValue");
	}

	@Override
	public void updatePortfolio(Contract contract, double position, double marketPrice, double marketValue,
			double averageCost, double unrealizedPNL, double realizedPNL, String accountName) {
		System.out.println("updatePortfolio");
	}

	@Override
	public void updateAccountTime(String timeStamp) {
		System.out.println("updateAccountTime");
	}

	@Override
	public void accountDownloadEnd(String accountName) {
		System.out.println("accountDownloadEnd");
	}

	@Override
	public void nextValidId(int orderId) {
		System.out.println("nextValidId");
	}

	@Override
	public void contractDetails(int reqId, ContractDetails contractDetails) {
		System.out.println("contractDetails");
	}

	@Override
	public void bondContractDetails(int reqId, ContractDetails contractDetails) {
		System.out.println("bondContractDetails");
	}

	@Override
	public void contractDetailsEnd(int reqId) {
		System.out.println("contractDetailsEnd");
	}

	@Override
	public void execDetails(int reqId, Contract contract, Execution execution) {
		System.out.println("execDetails");
	}

	@Override
	public void execDetailsEnd(int reqId) {
		System.out.println("execDetailsEnd");
	}

	@Override
	public void updateMktDepth(int tickerId, int position, int operation, int side, double price, int size) {
		System.out.println("updateMktDepth");
	}

	@Override
	public void updateMktDepthL2(int tickerId, int position, String marketMaker, int operation, int side, double price,
			int size, boolean isSmartDepth) {
		System.out.println("updateMktDepthL2");
	}

	@Override
	public void updateNewsBulletin(int msgId, int msgType, String message, String origExchange) {
		System.out.println("updateNewsBulletin");
	}

	@Override
	public void managedAccounts(String accountsList) {
		System.out.println("managedAccounts");
	}

	@Override
	public void receiveFA(int faDataType, String xml) {
		System.out.println("receiveFA");
	}

	@Override
	public void historicalData(int reqId, Bar bar) {
		System.out.println("historicalData");
	}

	@Override
	public void scannerParameters(String xml) {
		System.out.println("scannerParameters");
	}

	@Override
	public void scannerData(int reqId, int rank, ContractDetails contractDetails, String distance, String benchmark,
			String projection, String legsStr) {
		System.out.println("scannerData");
	}

	@Override
	public void scannerDataEnd(int reqId) {
		System.out.println("scannerDataEnd");
	}

	@Override
	public void realtimeBar(int reqId, long time, double open, double high, double low, double close, long volume,
			double wap, int count) {
		System.out.println("realtimeBar");
	}

	@Override
	public void currentTime(long time) {
		System.out.println("currentTime");
	}

	@Override
	public void fundamentalData(int reqId, String data) {
		System.out.println("fundamentalData");
	}

	@Override
	public void deltaNeutralValidation(int reqId, DeltaNeutralContract deltaNeutralContract) {
		System.out.println("deltaNeutralValidation");
	}

	@Override
	public void tickSnapshotEnd(int reqId) {
		System.out.println("tickSnapshotEnd");
	}

	@Override
	public void marketDataType(int reqId, int marketDataType) {
		System.out.println("marketDataType");
	}

	@Override
	public void commissionReport(CommissionReport commissionReport) {
		System.out.println("commissionReport");
	}

	@Override
	public void position(String account, Contract contract, double pos, double avgCost) {
		System.out.println("position");
	}

	@Override
	public void positionEnd() {
		System.out.println("positionEnd");
	}

	@Override
	public void accountSummary(int reqId, String account, String tag, String value, String currency) {
		System.out.printf("accountSummary: %d, %s, %s, %s, %s%n", reqId, account, tag, value, currency);
		if (tag.equals(AccountSummaryTag.TotalCashValue.name())) {
			accountTotalCashValue = Double.parseDouble(value);
		}
	}

	@Override
	public void accountSummaryEnd(int reqId) {
		System.out.printf("accountSummaryEnd: %d%n", reqId);
	}

	@Override
	public void verifyMessageAPI(String apiData) {
		System.out.println("verifyMessageAPI");
	}

	@Override
	public void verifyCompleted(boolean isSuccessful, String errorText) {
		System.out.println("verifyCompleted");
	}

	@Override
	public void verifyAndAuthMessageAPI(String apiData, String xyzChallenge) {
		System.out.println("verifyAndAuthMessageAPI");
	}

	@Override
	public void verifyAndAuthCompleted(boolean isSuccessful, String errorText) {
		System.out.println("verifyAndAuthCompleted");
	}

	@Override
	public void displayGroupList(int reqId, String groups) {
		System.out.println("displayGroupList");
	}

	@Override
	public void displayGroupUpdated(int reqId, String contractInfo) {
		System.out.println("displayGroupUpdated");
	}

	@Override
	public void error(Exception e) {
		System.out.println("error");
	}

	@Override
	public void error(String str) {
		System.out.println("error");
	}

	@Override
	public void error(int id, int errorCode, String errorMsg) {
		System.out.println("error");
	}

	@Override
	public void connectionClosed() {
		System.out.println("connectionClosed");
	}

	@Override
	public void connectAck() {
		System.out.println("connectAck");
	}

	@Override
	public void positionMulti(int reqId, String account, String modelCode, Contract contract, double pos,
			double avgCost) {
		System.out.println("positionMulti");
	}

	@Override
	public void positionMultiEnd(int reqId) {
		System.out.println("positionMultiEnd");
	}

	@Override
	public void accountUpdateMulti(int reqId, String account, String modelCode, String key, String value,
			String currency) {
		System.out.println("accountUpdateMulti");
	}

	@Override
	public void accountUpdateMultiEnd(int reqId) {
		System.out.println("accountUpdateMultiEnd");
	}

	@Override
	public void securityDefinitionOptionalParameter(int reqId, String exchange, int underlyingConId,
			String tradingClass, String multiplier, Set<String> expirations, Set<Double> strikes) {
		System.out.println("securityDefinitionOptionalParameter");
	}

	@Override
	public void securityDefinitionOptionalParameterEnd(int reqId) {
		System.out.println("securityDefinitionOptionalParameterEnd");
	}

	@Override
	public void softDollarTiers(int reqId, SoftDollarTier[] tiers) {
		System.out.println("softDollarTiers");
	}

	@Override
	public void familyCodes(FamilyCode[] familyCodes) {
		System.out.println("familyCodes");
	}

	@Override
	public void symbolSamples(int reqId, ContractDescription[] contractDescriptions) {
		System.out.println("symbolSamples");
	}

	@Override
	public void historicalDataEnd(int reqId, String startDateStr, String endDateStr) {
		System.out.println("historicalDataEnd");
	}

	@Override
	public void mktDepthExchanges(DepthMktDataDescription[] depthMktDataDescriptions) {
		System.out.println("mktDepthExchanges");
	}

	@Override
	public void tickNews(int tickerId, long timeStamp, String providerCode, String articleId, String headline,
			String extraData) {
		System.out.println("tickNews");
	}

	@Override
	public void smartComponents(int reqId, Map<Integer, Entry<String, Character>> theMap) {
		System.out.println("smartComponents");
	}

	@Override
	public void tickReqParams(int tickerId, double minTick, String bboExchange, int snapshotPermissions) {
		System.out.println("tickReqParams");
	}

	@Override
	public void newsProviders(NewsProvider[] newsProviders) {
		System.out.println("newsProviders");
	}

	@Override
	public void newsArticle(int requestId, int articleType, String articleText) {
		System.out.println("newsArticle");
	}

	@Override
	public void historicalNews(int requestId, String time, String providerCode, String articleId, String headline) {
		System.out.println("historicalNews");
	}

	@Override
	public void historicalNewsEnd(int requestId, boolean hasMore) {
		System.out.println("historicalNewsEnd");
	}

	@Override
	public void headTimestamp(int reqId, String headTimestamp) {
		System.out.println("headTimestamp");
	}

	@Override
	public void histogramData(int reqId, List<HistogramEntry> items) {
		System.out.println("histogramData");
	}

	@Override
	public void historicalDataUpdate(int reqId, Bar bar) {
		System.out.println("historicalDataUpdate");
	}

	@Override
	public void rerouteMktDataReq(int reqId, int conId, String exchange) {
		System.out.println("rerouteMktDataReq");
	}

	@Override
	public void rerouteMktDepthReq(int reqId, int conId, String exchange) {
		System.out.println("rerouteMktDepthReq");
	}

	@Override
	public void marketRule(int marketRuleId, PriceIncrement[] priceIncrements) {
		System.out.println("marketRule");
	}

	@Override
	public void pnl(int reqId, double dailyPnL, double unrealizedPnL, double realizedPnL) {
		System.out.println("pnl");
	}

	@Override
	public void pnlSingle(int reqId, int pos, double dailyPnL, double unrealizedPnL, double realizedPnL, double value) {
		System.out.println("pnlSingle");
	}

	@Override
	public void historicalTicks(int reqId, List<HistoricalTick> ticks, boolean done) {
		System.out.println("historicalTicks");
	}

	@Override
	public void historicalTicksBidAsk(int reqId, List<HistoricalTickBidAsk> ticks, boolean done) {
		System.out.println("historicalTicksBidAsk");
	}

	@Override
	public void historicalTicksLast(int reqId, List<HistoricalTickLast> ticks, boolean done) {
		System.out.println("historicalTicksLast");
	}

	@Override
	public void tickByTickAllLast(int reqId, int tickType, long time, double price, int size,
			TickAttribLast tickAttribLast, String exchange, String specialConditions) {
		System.out.println("tickByTickAllLast");
	}

	@Override
	public void tickByTickBidAsk(int reqId, long time, double bidPrice, double askPrice, int bidSize, int askSize,
			TickAttribBidAsk tickAttribBidAsk) {
		System.out.println("tickByTickBidAsk");
	}

	@Override
	public void tickByTickMidPoint(int reqId, long time, double midPoint) {
		System.out.println("tickByTickMidPoint");
	}

	@Override
	public void orderBound(long orderId, int apiClientId, int apiOrderId) {
		System.out.println("orderBound");
	}

	@Override
	public void completedOrder(Contract contract, Order order, OrderState orderState) {
		System.out.println("completedOrder");
	}

	@Override
	public void completedOrdersEnd() {
		System.out.println("completedOrdersEnd");
	}

}
