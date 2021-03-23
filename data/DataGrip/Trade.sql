CREATE OR REPLACE PROCEDURE CreateTrade(
    IN Pair             CHAR(6),
    IN EntryPrice       DECIMAL(13, 4),
    IN EntryTime        DATETIME,
    IN ExitPrice        DECIMAL(13, 4),
    IN ExitTime         DATETIME,
    IN Direction        TINYINT(1),
    IN InitialStopPrice DECIMAL(13, 4),
    IN PositionSize     INT,
    IN FundSize         DECIMAL(13, 4),
    IN Profit           DECIMAL(13, 4),
    OUT Id INT
)
BEGIN
    INSERT INTO Trade (Pair, EntryPrice, EntryTime, ExitPrice, ExitTime, Direction, InitialStopPrice, PositionSize, FundSize, Profit)
    VALUES (Pair, EntryPrice, EntryTime, ExitPrice, ExitTime, Direction, InitialStopPrice, PositionSize, FundSize, Profit);
    SET Id = LAST_INSERT_ID();
END;