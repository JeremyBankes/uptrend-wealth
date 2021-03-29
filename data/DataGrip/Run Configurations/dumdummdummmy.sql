-- Deleting information

DELETE FROM User;
DELETE FROM Claim;
DELETE FROM Account;
DELETE FROM Address;
DELETE FROM Trade;



-- creating a user, address, and account then assigning the user to an account
CALL CreateAddress('123 ABCDEFG Drive', 'Nova Scotia', 'Dartmouth', 'B4R 3Z1', 33, @AddressId);
CALL CreateUser('Jeremiah', 'Bankes', 'bullfrogBankes@msn.com', '77777777777', '902 654 7895', NOW(), @AddressId, @UserId);
CALL CreateAccount(NOW(), @AccountId);
CALL AssignAccount(@AccountId, @UserId);


-- Creating a trade
CALL CreateTrade('EURUSD', 1.2, '2019-03-10 02:55:05', 2.1, '2020-03-10 02:55:05', 1, 0.8, 20000, 60000, 2000, @TradeId1);
CALL CreateTrade('EURUSD', 1.2, '2019-03-10 02:55:05', 2.1, '2020-03-10 02:55:05', 1, 0.8, 20000, 60000, 5000, @TradeId2);

-- Creating a claim
CALL CreateClaim(@AccountId, @TradeId1, 0.25);
CALL CreateClaim(@AccountId, @TradeId2, 0.50);

-- Get Trade Profit
CALL GetTradeProfit(@UserId, '2018-03-10 02:55:05', '2021-03-10 02:55:05');

CALL GetTradeProfit(9, '2018-03-10 02:55:05', '2021-03-10 02:55:05');

-- checking

SELECT * FROM User;
SELECT * FROM Address;
SELECT * FROM Account;
SELECT * FROM Trade;
SELECT * FROM Claim;

-- Get Transfer
CALL GetTransfer(@UserId, '2018-07-10 02:55:05', '2020-03-10 02:55:05', 1);

CALL CreateTransfer(2000, 10, CURDATE(), @TransferId);
CALL CreateTransfer(100, 10, CURDATE(), @TransferId);
CALL CreateTransfer(500, 10, CURDATE(), @TransferId);

# CALL Balance()
