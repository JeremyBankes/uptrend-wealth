CREATE OR REPLACE PROCEDURE CreateAccount()
BEGIN
    INSERT INTO Account () VALUES ();
    SELECT LAST_INSERT_ID() AS Id;
END;

CREATE OR REPLACE PROCEDURE AssignAccount(
    IN UserId INT,
    IN AccountId INT
)
BEGIN
    UPDATE User SET User.AccountId = AccountId WHERE User.Id = UserId;
END;

CREATE OR REPLACE PROCEDURE CreateTransfer(
    IN UserId INT,
    IN Amount DECIMAL(13, 4),
    IN Time DATETIME
)
BEGIN
    SELECT @AccountId := User.AccountId FROM User WHERE User.Id = 3;
    INSERT INTO Transfer (Amount, AccountId, Time)
    VALUES (Amount, @AccountId, Time);
    SELECT LAST_INSERT_ID() AS Id;
END;

CREATE OR REPLACE PROCEDURE CreateClaim(
    IN AccountId INT,
    IN TradeId INT,
    IN Ownership DECIMAL(5, 4),
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
)
BEGIN
    SELECT SUM(Profit * Ownership) AS Profit
    FROM Trade
             INNER JOIN Claim ON Trade.Id = Claim.TradeId
             INNER JOIN Account ON Claim.AccountId = Account.Id
             INNER JOIN User ON User.Id = Account.Id
    WHERE ExitTime > StartDate
      AND ExitTime < EndDate
      AND User.Id = UserID
    GROUP BY Account.Id;
END;

SELECT *
FROM User;

CREATE OR REPLACE PROCEDURE ReadTransfers(
    IN UserId INT,
    IN StartDate DATETIME,
    IN EndDate DATETIME,
    IN IsContribution BIT
)
BEGIN
    IF IsContribution THEN
        SELECT Transfer.Id AS TransferId, Amount, Time
        FROM Transfer
                 INNER JOIN Account ON Transfer.AccountId = Account.Id
                 INNER JOIN User ON Account.Id = User.AccountId
        WHERE User.Id = UserId
          AND Time > StartDate
          AND Time < EndDate
          AND Amount > 0;
    ELSE
        SELECT Transfer.Id AS TransferId, Amount, Time
        FROM Transfer
                 INNER JOIN Account ON Transfer.AccountId = Account.Id
                 INNER JOIN User ON Account.Id = User.AccountId
        WHERE User.Id = UserId
          AND Time > StartDate
          AND Time < EndDate
          AND Amount < 0;
    END IF;
END;

CREATE OR REPLACE PROCEDURE Balance(
    IN UserId INT
)
BEGIN
    SELECT (SELECT SUM(Ownership * Profit) AS TradeProfit
            FROM User
                     INNER JOIN Account ON User.AccountId = Account.Id
                     INNER JOIN Claim ON Account.Id = Claim.AccountId
                     INNER JOIN Trade ON Claim.TradeId = Trade.Id
            WHERE User.Id = UserId
            GROUP BY Account.Id) + (SELECT SUM(Amount) AS Contribution
                                    FROM User
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
#
# CREATE OR REPLACE PROCEDURE UserInformation(
#     IN UserId INT,
#     IN StartDate DATETIME,
#     IN EndDate DATETIME
# )
