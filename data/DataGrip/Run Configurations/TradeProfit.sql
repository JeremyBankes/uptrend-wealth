CREATE OR REPLACE PROCEDURE GetTradeProfit(
    IN UserID INT,
    IN StartDate DATETIME,
    IN EndDate DATETIME
) BEGIN
    SELECT SUM(Profit * Ownership) AS Profit FROM Trade
    INNER JOIN Claim ON Trade.Id = Claim.TradeId
    INNER JOIN Account ON Claim.AccountId = Account.Id
    INNER JOIN User ON User.Id = Account.Id
    WHERE ExitTime > StartDate AND ExitTime < EndDate AND User.Id = UserID
    GROUP BY Account.Id;
END;

CALL GetTradeProfit();

SELECT * FROM User;