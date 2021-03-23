CREATE OR REPLACE PROCEDURE CreateAccount(
    IN CloseDate DATETIME,
    OUT Id INT
)
BEGIN
    INSERT INTO Account (CloseDate)
    VALUES (CloseDate);
    SET Id = LAST_INSERT_ID();
END;

CREATE OR REPLACE PROCEDURE CreateTransfer(
    IN Amount    DECIMAL(13, 4),
    IN AccountId INT,
    IN Time      DATETIME,
    OUT Id INT
)
BEGIN
    INSERT INTO Transfer (Amount, AccountId, Time)
    VALUES (Amount, AccountId, Time);
    SET Id = LAST_INSERT_ID();
END;

CREATE OR REPLACE PROCEDURE CreateClaim(
    IN AccountId INT,
    IN TradeId INT,
    IN Time DATETIME,
    OUT Id INT
)
BEGIN
    INSERT INTO Transfer (Amount, AccountId, Time)
    VALUES (Amount, AccountId, Time);
    SET Id = LAST_INSERT_ID();
END;
