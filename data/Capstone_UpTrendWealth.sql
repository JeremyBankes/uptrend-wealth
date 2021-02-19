DROP DATABASE IF EXISTS Uptrend_Wealth;
CREATE DATABASE Uptrend_Wealth;

USE Uptrend_Wealth;

DROP TABLE IF EXISTS Account;
CREATE TABLE Account (
    AccountID int(11) NOT NULL AUTO_INCREMENT,
    AccountCloseDate timestamp NOT NULL,
    BalanceCALC decimal(19, 0) NOT NULL,
    FundOwnershipCALC decimal(19, 0) NOT NULL,
    UserID int(11), PRIMARY KEY (AccountID)
);

DROP TABLE IF EXISTS Account_Trade;
CREATE TABLE Account_Trade (
    AccountAccountID int(11) NOT NULL,
    TradeTradeID int(11) NOT NULL,
    TradeContribution float NOT NULL,
    PRIMARY KEY (AccountAccountID, TradeTradeID)
);

DROP TABLE IF EXISTS Address;
CREATE TABLE Address (
    AddressID int(11) NOT NULL AUTO_INCREMENT,
    State varchar(64) NOT NULL,
    City varchar(64) NOT NULL,
    Zipcode varchar(10) NOT NULL,
    UserID int(11) NOT NULL,
    CountryCountryID int(11),
    PRIMARY KEY (AddressID)
);

DROP TABLE IF EXISTS Country;
CREATE TABLE Country (
    CountryID int(11) NOT NULL AUTO_INCREMENT,
    Name varchar(255) NOT NULL,
    PRIMARY KEY (CountryID)
);

DROP TABLE IF EXISTS Permission;
CREATE TABLE Permission (
    PermissionID int(11) NOT NULL AUTO_INCREMENT,
    PermissionName varchar(32) NOT NULL,
    PRIMARY KEY (PermissionID)
);

DROP TABLE IF EXISTS Role;
CREATE TABLE Role (
    RoleID int(11) NOT NULL AUTO_INCREMENT,
    RoleName varchar(32) NOT NULL,
    PRIMARY KEY (RoleID)
);

DROP TABLE IF EXISTS Role_Permission;
CREATE TABLE Role_Permission (
    RoleRoleID int(11) NOT NULL,
    PermissionPermissionID int(11) NOT NULL,
    PRIMARY KEY (RoleRoleID, PermissionPermissionID)
);

DROP TABLE IF EXISTS Trade;
CREATE TABLE Trade (
    TradeID int(11) NOT NULL AUTO_INCREMENT,
    CurrencyPair varchar(6) NOT NULL,
    EntryPrice decimal(19, 0) NOT NULL,
    EntryDateTime timestamp NOT NULL,
    ExitPrice int(11) NOT NULL,
    ExitDateTime timestamp NOT NULL,
    TradeDirection tinyint(1) NOT NULL,
    InitialStopPrice decimal(19, 0) NOT NULL,
    PositionSize int(11) NOT NULL,
    FundSize decimal(19, 0) NOT NULL,
    Profit decimal(19, 0) NOT NULL,
    `Return` float NOT NULL,
    PRIMARY KEY (TradeID)
);

DROP TABLE IF EXISTS Transfer;
CREATE TABLE Transfer (
    TransferID int(11) NOT NULL AUTO_INCREMENT,
    Amount decimal(19, 0) NOT NULL,
    TransferDateTime timestamp NOT NULL,
    AccountAccountID int(11) NOT NULL,
    PRIMARY KEY (TransferID)
);

DROP TABLE IF EXISTS `User`;
CREATE TABLE `User` (
    UserID int(11) NOT NULL AUTO_INCREMENT,
    FirstName varchar(64) NOT NULL,
    LastName varchar(64) NOT NULL,
    Address varchar(255) NOT NULL,
    PhoneNumber varchar(64) NOT NULL,
    EmailAddress varchar(255) NOT NULL,
    RegistrationDate timestamp NOT NULL,
    UnregistrationDate timestamp NOT NULL,
    Hash blob,
    PRIMARY KEY (UserID)
);

DROP TABLE IF EXISTS User_Role;
CREATE TABLE User_Role (
    UserUserID int(11) NOT NULL,
    RoleRoleID int(11) NOT NULL,
    PRIMARY KEY (UserUserID, RoleRoleID)
);

ALTER TABLE Account
    ADD CONSTRAINT FK_Account_UserID
        FOREIGN KEY (UserID)
            REFERENCES `User` (UserID);
ALTER TABLE User_Role
    ADD CONSTRAINT FK_User_Role_UserUserID
        FOREIGN KEY (UserUserID)
            REFERENCES `User` (UserID);
ALTER TABLE User_Role
    ADD CONSTRAINT FK_User_Role_RoleRoleID
        FOREIGN KEY (RoleRoleID)
            REFERENCES Role (RoleID);
ALTER TABLE Role_Permission
    ADD CONSTRAINT FK_Role_Permission_RoleRoleID
        FOREIGN KEY (RoleRoleID)
            REFERENCES Role (RoleID);
ALTER TABLE Role_Permission
    ADD CONSTRAINT FK_Role_Permission_PermissionPermissionID
        FOREIGN KEY (PermissionPermissionID)
            REFERENCES Permission (PermissionID);
ALTER TABLE Transfer
    ADD CONSTRAINT FK_Transfer_AccountAccountID
        FOREIGN KEY (AccountAccountID)
            REFERENCES Account (AccountID);
ALTER TABLE Account_Trade
    ADD CONSTRAINT FK_Account_Trade_AccountAccountID
        FOREIGN KEY (AccountAccountID)
            REFERENCES Account (AccountID);
ALTER TABLE Account_Trade
    ADD CONSTRAINT FK_Account_Trade_TradeTradeID
        FOREIGN KEY (TradeTradeID)
            REFERENCES Trade (TradeID);
ALTER TABLE Address
    ADD CONSTRAINT FK_Address_CountryCountryID
        FOREIGN KEY (CountryCountryID)
            REFERENCES Country (CountryID);
ALTER TABLE Address
    ADD CONSTRAINT FK_Address_UserID
        FOREIGN KEY (UserID)
            REFERENCES `User` (UserID);

