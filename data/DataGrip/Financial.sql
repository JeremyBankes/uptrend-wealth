CREATE OR REPLACE PROCEDURE CreateAccount(
    IN CloseDate DATETIME,
    OUT Id INT
)
BEGIN
    INSERT INTO Account (CloseDate)
    VALUES (CloseDate);
    SET Id = LAST_INSERT_ID();
END;

CREATE OR REPLACE PROCEDURE AssignAccount(
    IN UpdatedAccountId INT,
    IN UserId INT
)
BEGIN
    UPDATE User SET AccountId = UpdatedAccountId WHERE User.Id = UserId;
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
    IN Ownership DECIMAL(5,4)
)
BEGIN
    INSERT INTO Claim (AccountId, TradeId, Ownership)
    VALUES (AccountId, TradeId, Ownership);
END;