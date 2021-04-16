CREATE OR REPLACE PROCEDURE CreateTrade(
    IN Pair CHAR(6),
    IN EntryPrice DECIMAL(13, 4),
    IN EntryTime DATETIME,
    IN ExitPrice DECIMAL(13, 4),
    IN ExitTime DATETIME,
    IN Direction TINYINT(1),
    IN InitialStopPrice DECIMAL(13, 4),
    IN PositionSize INT,
    IN FundSize DECIMAL(13, 4),
    IN Profit DECIMAL(13, 4)
)
BEGIN
    INSERT INTO Trade (Pair, EntryPrice, EntryTime, ExitPrice, ExitTime, Direction, InitialStopPrice, PositionSize,
                       FundSize, Profit)
    VALUES (Pair, EntryPrice, EntryTime, ExitPrice, ExitTime, Direction, InitialStopPrice, PositionSize, FundSize,
            Profit);
    SELECT LAST_INSERT_ID() AS Id;
END;

CREATE OR REPLACE PROCEDURE AssignClaim(
    IN UserId INT,
    IN TradeId INT,
    IN Ownership DECIMAL(5, 4)
)
BEGIN
    SELECT @AccountId := User.AccountId FROM User WHERE User.Id = UserId;
    INSERT INTO Claim (AccountId, TradeId, Ownership)
    VALUES (@AccountId, TradeId, Ownership);
    SELECT LAST_INSERT_ID() AS Id;
END;

CREATE OR REPLACE PROCEDURE ReadTrades(
    IN UserId INT
)
BEGIN
    IF UserId > 0 THEN
        SELECT Trade.Id,
               Trade.EntryTime,
               Trade.Pair,
               Trade.Direction,
               Trade.EntryPrice,
               Trade.ExitPrice,
               Trade.ExitTime,
               IF(Trade.Direction,
                  Trade.ExitPrice - Trade.EntryPrice,
                  Trade.EntryPrice - Trade.ExitPrice) *
               Trade.PositionSize AS Profit
        FROM Trade
                 INNER JOIN Claim ON Trade.Id = Claim.TradeId
                 INNER JOIN Account ON Claim.AccountId = Account.Id
                 INNER JOIN User ON Account.Id = User.AccountId
        WHERE User.Id = UserId
        ORDER BY ExitTime;
    ELSE
        SELECT Trade.Id,
               Trade.EntryTime,
               Trade.Pair,
               Trade.Direction,
               Trade.EntryPrice,
               Trade.ExitPrice,
               Trade.ExitTime,
               IF(Trade.Direction,
                  Trade.ExitPrice - Trade.EntryPrice,
                  Trade.EntryPrice - Trade.ExitPrice) *
               Trade.PositionSize AS Profit
        FROM Trade
        ORDER BY ExitTime;
    END IF;
END;