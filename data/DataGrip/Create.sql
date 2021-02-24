DROP DATABASE IF EXISTS Uptrend;
CREATE DATABASE Uptrend;
USE Uptrend;

CREATE TABLE Account
(
    Id        int(10)  NOT NULL AUTO_INCREMENT,
    CloseDate datetime NULL,
    PRIMARY KEY (Id)
);

CREATE TABLE Address
(
    StreetAddress varchar(256) NOT NULL,
    Subdivision   varchar(256) NOT NULL,
    Id            int(10)      NOT NULL AUTO_INCREMENT,
    City          varchar(256) NOT NULL,
    ZipCode       varchar(10)  NOT NULL,
    CountryId     int(10)      NOT NULL,
    PRIMARY KEY (Id)
);

CREATE TABLE Claim
(
    AccountId int(10)       NOT NULL,
    TradeId   int(10)       NOT NULL,
    Ownership decimal(5, 4) NOT NULL,
    PRIMARY KEY (AccountId, TradeId)
);

CREATE TABLE Country
(
    Id   int(10)     NOT NULL AUTO_INCREMENT,
    Name varchar(64) NOT NULL,
    PRIMARY KEY (Id)
);

CREATE TABLE Permission
(
    Id   int(10)     NOT NULL AUTO_INCREMENT,
    Name varchar(64) NOT NULL,
    PRIMARY KEY (Id)
);

CREATE TABLE Role
(
    Id   int(10)     NOT NULL AUTO_INCREMENT,
    Name varchar(64) NOT NULL,
    PRIMARY KEY (Id)
);

CREATE TABLE RolePermissions
(
    PermissionId int(10) NOT NULL,
    RoleId       int(10) NOT NULL,
    PRIMARY KEY (PermissionId, RoleId)
);

CREATE TABLE Trade
(
    Id               int(10)        NOT NULL AUTO_INCREMENT,
    Pair             char(6)        NOT NULL,
    EntryPrice       decimal(13, 4) NOT NULL,
    EntryTime        datetime       NOT NULL,
    ExitPrice        decimal(13, 4),
    ExitTime         datetime       NULL,
    Direction        tinyint(1)     NOT NULL,
    InitialStopPrice decimal(13, 4) NOT NULL,
    PositionSize     int(10)        NOT NULL,
    FundSize         decimal(13, 4) NOT NULL,
    Profit           decimal(13, 4),
    PRIMARY KEY (Id)
);

CREATE TABLE Transfer
(
    Id        int(10)        NOT NULL AUTO_INCREMENT,
    Amount    decimal(13, 4) NOT NULL,
    AccountId int(10)        NOT NULL,
    Time      datetime       NOT NULL,
    PRIMARY KEY (Id)
);

CREATE TABLE `User`
(
    Id             int(10)      NOT NULL AUTO_INCREMENT,
    FirstName      varchar(128) NOT NULL,
    LastName       varchar(128) NOT NULL,
    Email          varchar(256) NOT NULL,
    Hash           binary(72)   NOT NULL,
    Phone          varchar(64)  NOT NULL,
    Registration   datetime     NOT NULL,
    Unregistration datetime     NULL,
    AccountId      int(10),
    AddressId      int(10)      NOT NULL,
    PRIMARY KEY (Id)
);

CREATE TABLE UserRole
(
    UserId int(10) NOT NULL,
    RoleId int(10) NOT NULL,
    PRIMARY KEY (UserId, RoleId)
);

ALTER TABLE Address
    ADD CONSTRAINT FK_Address_Country FOREIGN KEY (CountryId) REFERENCES Country (Id);

ALTER TABLE RolePermissions
    ADD CONSTRAINT FK_RolePermissions_Permission FOREIGN KEY (PermissionId) REFERENCES Permission (Id);

ALTER TABLE RolePermissions
    ADD CONSTRAINT FK_RolePermissions_Role FOREIGN KEY (RoleId) REFERENCES Role (Id);

ALTER TABLE Transfer
    ADD CONSTRAINT FK_Transfer_Account FOREIGN KEY (AccountId) REFERENCES Account (Id);

ALTER TABLE Claim
    ADD CONSTRAINT FK_Claim_Account FOREIGN KEY (AccountId) REFERENCES Account (Id);

ALTER TABLE Claim
    ADD CONSTRAINT FK_Claim_Trade FOREIGN KEY (TradeId) REFERENCES Trade (Id);

ALTER TABLE `User`
    ADD CONSTRAINT FK_User_Account FOREIGN KEY (AccountId) REFERENCES Account (Id);

ALTER TABLE `User`
    ADD CONSTRAINT FK_User_Address FOREIGN KEY (AddressId) REFERENCES Address (Id);

ALTER TABLE UserRole
    ADD CONSTRAINT FK_UserRole_User FOREIGN KEY (UserId) REFERENCES `User` (Id);

ALTER TABLE UserRole
    ADD CONSTRAINT FK_UserRole_Role FOREIGN KEY (RoleId) REFERENCES Role (Id);
