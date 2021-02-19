USE master;
GO

DROP DATABASE IF EXISTS UptrendWealth;
CREATE DATABASE UptrendWealth;

CREATE TABLE Account (
    AccountID int(11) NOT NULL AUTO_INCREMENT,
    AccountCloseDate timestamp NOT NULL,
    BalanceCALC decimal(19, 0) NOT NULL,
    UserID int(11),
    PRIMARY KEY (AccountID)
);

CREATE TABLE Account_Trade (
    AccountAccountID int(11) NOT NULL,
    TradeTradeID int(11) NOT NULL,
    TradeContribution float NOT NULL,
    PRIMARY KEY (AccountAccountID, TradeTradeID)
);

CREATE TABLE Permission (
    PermissionID int(11) NOT NULL AUTO_INCREMENT,
    PermissionName varchar(32) NOT NULL,
    PRIMARY KEY (PermissionID)
);

CREATE TABLE Role (
    RoleID int(11) NOT NULL AUTO_INCREMENT,
    RoleName varchar(32) NOT NULL,
    PRIMARY KEY (RoleID)
);

CREATE TABLE Role_Permission (
    RoleRoleID int(11) NOT NULL,
    PermissionPermissionID int(11) NOT NULL,
    PRIMARY KEY (RoleRoleID, PermissionPermissionID)
);

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

CREATE TABLE Transfer (
    TransferID int(11) NOT NULL AUTO_INCREMENT,
    Amount decimal(19, 0) NOT NULL,
    TransferDateTime timestamp NOT NULL,
    AccountAccountID int(11) NOT NULL,
    PRIMARY KEY (TransferID)
);

CREATE TABLE `User` (
    UserID int(11) NOT NULL AUTO_INCREMENT,
    FirstName varchar(64) NOT NULL,
    LastName varchar(64) NOT NULL,
    Address varchar(255) NOT NULL,
    PhoneNumber varchar(32) NOT NULL,
    RegistrationDate timestamp NOT NULL,
    UnregistrationDate timestamp NULL,
    PRIMARY KEY (UserID)
);

CREATE TABLE User_Role (
    UserUserID int(11) NOT NULL,
    RoleRoleID int(11) NOT NULL,
    PRIMARY KEY (UserUserID, RoleRoleID)
);

ALTER TABLE Account
    ADD CONSTRAINT FKAccount621444
    FOREIGN KEY (UserID) REFERENCES `User` (UserID);
ALTER TABLE User_Role ADD CONSTRAINT FKUser_Role448688 FOREIGN KEY (UserUserID) REFERENCES `User` (UserID);
ALTER TABLE User_Role ADD CONSTRAINT FKUser_Role764707 FOREIGN KEY (RoleRoleID) REFERENCES Role (RoleID);
ALTER TABLE Role_Permission ADD CONSTRAINT FKRole_Permi338895 FOREIGN KEY (RoleRoleID) REFERENCES Role (RoleID);
ALTER TABLE Role_Permission ADD CONSTRAINT FKRole_Permi603637 FOREIGN KEY (PermissionPermissionID) REFERENCES Permission (PermissionID);
ALTER TABLE Transfer ADD CONSTRAINT FKTransfer763027 FOREIGN KEY (AccountAccountID) REFERENCES Account (AccountID);
ALTER TABLE Account_Trade ADD CONSTRAINT FKAccount_Tr358925 FOREIGN KEY (AccountAccountID) REFERENCES Account (AccountID);
ALTER TABLE Account_Trade ADD CONSTRAINT FKAccount_Tr801316 FOREIGN KEY (TradeTradeID) REFERENCES Trade (TradeID);
