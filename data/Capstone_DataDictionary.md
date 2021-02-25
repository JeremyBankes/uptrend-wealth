## Uptrend Wealth Database
#### Data Dictionary

Uptrend Wealth is a Forex hedge fund. 
Essentially allowing for clients to make investments towards a fund that will be used 
for trading on the Forex (Foreign Exchange) Market.

The Uptrend Wealth Web Environment project purely aims to develop the technical environment
to facilitate this fund. This will include tasks such as the registration,
making of secure payments and access to a portal for the observation of investments.
This process will include the design and development of a database, front-facing website,
and backend service to link the two together.

#### User Table
A user describes a person who may have signed up on the website, but hasn't necessarily (but could have) made a contribution to the fund (an investment).

|Key     |Name              |Type      |Size  |NULL/NOT NULL|Default       |Description                                           |Sample                              |
|:------:|:----------------:|:--------:|:----:|:-----------:|:------------:|:----------------------------------------------------:|:----------------------------------:|
|**PK**  |UserID            |INT       |      |NOT NULL     |IDENTITY      |_A unique sequential number_                          |`1002`                              |
|**DF**  |FirstName         |VARCHAR   |64    |NOT NULL     |              |stores the user's first name                          |Jane                                |
|        |LastName          |VARCHAR   |64    |NOT NULL     |              |stores the user's last name                           |Doe                                 |
|**CK**  |PhoneNumber       |VARCHAR   |32    |NOT NULL     |              |stores the user's contact number                      |`19021234567`                       |
|        |EmailAddress      |VARCHAR   |255   |NOT NULL     |              |stores the user's email address                       |janedoe@gmail.com                   |
|        |RegistrationDate  |DATETIME  |      |NOT NULL     |              |stores the date and time of when the user registered  |`2021-11-14 23:59:59`               |
|        |UnregistrationDate|DATETIME  |      |NULL         |NULL          |stores the date and time of when the user unregistered|`2023-04-04 15:45:03`               |
|        |Hash              |BLOB      |      |NULL         |              |stores the user's hashed password                     |`$2y$12$95aGTH/mFyc0a/Cpetjp16bXcUO`|

#### Role Table
Represents a collection of permissions allowing a user to take certain actions on the web interface. Roles can be given to or taken from users.

|Key     |Name          |Type    |Size  |NULL/NOT NULL|Default       |Description                     |Sample                                  |
|:------:|:------------:|:------:|:----:|:-----------:|:------------:|:------------------------------:|:--------------------------------------:|
|**PK**  |RoleID        |INT     |      |NOT NULL     |IDENTITY      |_A unique sequential number_    |`04`                                     |
|-       |RoleName      |VARCHAR |32    |NOT NULL     |              |stores the name of role         |admin, moderator, developer, owner, etc.|

#### User_Role Table
Composite table to join the User and Role tables

|Key           |Name   |Type |Size |NULL/NOT NULL|Default   |Description                            |Sample        |
|:------------:|:-----:|:---:|:---:|:-----------:|:--------:|:-------------------------------------:|:------------:|
|**PK** **FK** |UserID |INT  |     |NOT NULL     |          |references which user has the role     |`101`     |
|**PK** **FK** |RoleID |INT  |     |NOT NULL     |          |references what role the user has      |`04`     |

#### Permission Table
Contains data on the different categories of tickets

|Key     |Name           |Type    |Size  |NULL/NOT NULL|Default    |Description                     |Sample                |
|:------:|:-------------:|:------:|:----:|:-----------:|:---------:|:------------------------------:|:--------------------:|
|**PK**  |PermissionID   |INT     |11    |NOT NULL     |IDENTITY   |_A unique sequential number_    |`1234567`             |
|-       |PermissionName |VARCHAR |32    |NOT NULL     |           |stores the name of permission   |website.user.delete   |

#### Role_Permission Table
Composite table to join the Permission and Role tables

|Key          |Name        |Type    |Size  |NULL/NOT NULL|Default   |Description                                                      |Sample               |
|:-----------:|:----------:|:------:|:----:|:-----------:|:--------:|:---------------------------------------------------------------:|:-------------------:|
|**PK** **FK**|RoleID      |INT     |11    |NOT NULL     |          |_A unique sequential number_ that references the role table      |`04`            |
|**PK** **FK**|PermissionID|INT     |11    |NOT NULL     |          |_A unique sequential number_ that references the permission table|`1234567`            |

#### Address Table
Represents an address

|Key     |Name            |Type    |Size  |NULL/NOT NULL|Default    |Description                                  |Sample               |
|:------:|:-------------:|:------:|:----:|:-----------:|:---------:|:--------------------------------------------:|:-------------------:|
|**PK**  |AddressID      |INT     |11    |NOT NULL     |IDENTITY   |_A unique sequential number_                  |`1234567`            |
|-       |StreetAddress  |VARCHAR |64    |NOT NULL     |           |stores the information on the street address  |123 Heavenly Lane    |
|-       |StateProvince  |VARCHAR |32    |NOT NULL     |           |stores the name of the state or province      |Nova Scotia          |
|-       |City           |VARCHAR |255   |NOT NULL     |           |stores the name of the city, town or village  |Halifax              |
|-       |Zipcode        |VARCHAR |32    |NOT NULL     |           |stores the zipcode or postal code             |B2Z 1G3              |
|**FK**  |UserID         |INT     |      |NOT NULL     |           |references the User table                     |`105`                |
|**FK**  |CountryID      |INT     |      |NOT NULL     |           |references Country table                      |`202`                |

#### Country
Represents a country

|Key     |Name               |Type    |Size  |NULL/NOT NULL|Default      |Description                               |Sample          |
|:------:|:-----------------:|:------:|:----:|:-----------:|:-----------:|:----------------------------------------:|:--------------:|
|**PK**  |CountryID          |INT     |11    |NOT NULL     |IDENTITY     |_A unique sequential number_              |`1234567`       |
|-       |CountryName        |VARCHAR |128   |NOT NULL     |             |stores the name of the country            |Canada          |


#### Account
An account describes a user who has registered to be an investor.

|Key     |Name               |Type     |Size  |NULL/NOT NULL|Default      |Description                                         |Sample                           |
|:------:|:-----------------:|:-------:|:----:|:-----------:|:-----------:|:--------------------------------------------------:|:-------------------------------:|
|**PK**  |AccountID          |INT      |11    |NOT NULL     |IDENTITY     |_A unique sequential number_                        |`1234567`                        |
|-       |AccountCloseDate   |DATETIME |      |NOT NULL     |             |represents the date and time of the account closing |`2023-04-04 15:45:03`            |
|        |BalanceCALC        |DECIMAL  |      |NOT NULL     |             |                                                    |                                 |
|-       |FundOwnershipCALC  |DECIMAL  |      |NOT NULL     |             |                                                    |`2019-07-11 04:27:07`            |
|**FK**  |UserID             |INT      |11    |NULL         |             |used to reference and identify the User             |`1234567`                        |

#### Trade
Represent a trade (A entering and exiting a position on the Forex market).

|Key     |Name                |Type      |Size  |NULL/NOT NULL|Default    |Description                                                    |Sample                           |
|:------:|:------------------:|:--------:|:----:|:-----------:|:---------:|:-------------------------------------------------------------:|:-------------------------------:|
|**PK**  |TradeID             |INT       |11    |NOT NULL     |IDENTITY   |_A unique sequential number_                                   |`1234567`                        |
|-       |CurrencyPair        |VARCHAR   |6     |NOT NULL     |           |stores the currency pair the trade is using                    |USDCAD                           |
|-       |EntryPrice          |DECIMAL   |13,4  |NOT NULL     |           |describes the price at which a trade is entered                |`43.4424`                        |
|-       |EntryDateTime       |DATETIME  |      |NOT NULL     |           |represents the time at which a trade is entered                |`2023-04-04 15:45:03`            |
|        |ExitPrice           |DECIMAL   |13,4  |NULL         |NULL       |represents the price at which a trade is exited                |`43.5523`                        |      
|-       |ExitDateTime        |DATETIME  |      |NULL         |NULL       |represents the date and time at which a trade is exited        |`2023-04-05 11:35:05`            |
|-       |TradeDirection      |BIT       |      |NOT NULL     |           |represents the direction a trade is meant to go                |true (for long, false for short) |
|-       |InitialStopPrice    |DECIMAL   |13,4  |NOT NULL     |           |describes the initial price at which the stop loss is placed   |`40.3443`                        |
|        |PositionSize        |INT       |11    |NOT NULL     |           |describes the size of a trade (units purchased)                |`123000`                         |      
|-       |FundSize            |DECIMAL   |13,4  |NOT NULL     |           |represents the total size of the fund at the time of the trade |`75454.4364`                     |
|-       |Profit              |DECIMAL   |13,4  |NULL         |NULL       |represents the total profit or loss made on this trade         |`-435.4343`                      |
|-       |Return              |FLOAT     |      |NOT NULL     |           |                                                               |                                 |


#### Account_Trade
Composite table to join together the Account and Trade tables

|Key            |Name               |Type      |Size  |NULL/NOT NULL|Default   |Description                                                   |Sample                             |
|:-------------:|:-----------------:|:--------:|:----:|:-----------:|:--------:|:------------------------------------------------------------:|:---------------------------------:|
|**PK** **FK**  |AccountID          |INT       |11    |NOT NULL     |          |_A unique sequential number_ that references the account table|`1234567`                          |
|**PK** **FK**  |TradeID            |INT       |11    |NOT NULL     |          |_A unique sequential number_ that references the trade table  |`1234567`                          |
|               |TradeContribution  |FLOAT     |      |NOT NULL     |          |                                                              |`1234567`                          |

#### Transfer
References the many to many relationship between Ticket and Hardware

|Key    |Name            |Type      |Size  |NULL/NOT NULL|Default   |Description                                                                                |Sample                                      |
|:-----:|:--------------:|:--------:|:----:|:-----------:|:--------:|:-----------------------------------------------------------------------------------------:|:------------------------------------------:|
|**PK** |TransferID      |INT       |11    |NOT NULL     |          |_A unique sequential number_ that references the ID of the transfer                        |`1134`                                      |
|       |Amount          |DECIMAL   |13,4  |NOT NULL     |          |references the amount of money being transferred                                           |$5000 ((+) for deposits, (-) for withdraws) |
|       |TransferDateTime|DATETIME  |      |NOT NULL     |          |refers to the date and time of the transfer                                                |`2023-04-05 11:35:05                        |
|**FK** |AccountID       |INT       |11    |NOT NULL     |          |_A unique sequential number_ that references the ID of the account prompting the transfer  |`1005`                                      |
