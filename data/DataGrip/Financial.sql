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
    OUT TransferId INT
)
BEGIN
    INSERT INTO Transfer (Amount, AccountId, Time)
    VALUES (Amount, AccountId, Time);
    SET TransferId = LAST_INSERT_ID();
END;

CREATE OR REPLACE PROCEDURE CreateClaim(
    IN AccountId INT,
    IN TradeId INT,
    IN Ownership DECIMAL(5,4),
    OUT ClaimId INT
)
BEGIN
    INSERT INTO Claim (AccountId, TradeId, Ownership)
    VALUES (AccountId, TradeId, Ownership);
    SET ClaimId = LAST_INSERT_ID();
END;

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

CREATE OR REPLACE PROCEDURE GetTransfer(
    IN UserId INT,
    IN StartDate DATETIME,
    IN EndDate DATETIME,
    IN IsContribution BIT
)
BEGIN
IF IsContribution = 1 THEN
    SELECT Transfer.Id AS TransferId, Amount, Time FROM Transfer
    INNER JOIN Account ON Transfer.AccountId = Account.Id
    INNER JOIN User ON Account.Id = User.AccountId
    WHERE User.Id = 1 AND Time > StartDate AND Time < EndDate AND Amount > 0;
ELSE
    SELECT Transfer.Id AS TransferId, Amount, Time FROM Transfer
    INNER JOIN Account ON Transfer.AccountId = Account.Id
    INNER JOIN User ON Account.Id = User.AccountId
    WHERE User.Id = 1 AND Time > StartDate AND Time < EndDate AND Amount < 0;
END IF;
END;

CREATE OR REPLACE PROCEDURE Balance(
    IN UserId INT
)
BEGIN
    SELECT (SELECT SUM (Ownership * Profit) AS TradeProfit FROM User
        INNER JOIN Account ON User.AccountId = Account.Id
        INNER JOIN Claim ON Account.Id = Claim.AccountId
        INNER JOIN Trade ON Claim.TradeId = Trade.Id
        WHERE User.Id = UserId
        GROUP BY Account.Id) + (SELECT SUM(Amount) AS Contribution FROM User
        INNER JOIN Account ON User.AccountId = Account.Id
        INNER JOIN Transfer ON Account.Id = Transfer.AccountId
        WHERE User.Id = UserId
        GROUP BY Account.Id);
END;

CREATE OR REPLACE PROCEDURE GetTrades(
    IN UserId INT,
    IN StartDate DATETIME,
    IN EndDate DATETIME
)
BEGIN

END;

CREATE OR REPLACE PROCEDURE UserInformation(
    IN UserId INT,
    IN StartDate DATETIME,
    IN EndDate DATETIME
)
