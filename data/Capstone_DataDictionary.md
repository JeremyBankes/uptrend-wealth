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
Contains data about the user

|Key     |Name              |Type      |Size  |NULL/NOT NULL|Default       |Description                                           |Sample            |
|:------:|:----------------:|:--------:|:----:|:-----------:|:------------:|:----------------------------------------------------:|:----------------:|
|**PK**  |UserID            |INT       |      |NOT NULL     |IDENTITY      |_A unique sequential number_                          |`1234567`         |
|**DF**  |FirstName         |VARCHAR   |64    |NOT NULL     |              |stores the user's first name                          |Jane              |
|-       |LastName          |VARCHAR   |64    |NOT NULL     |              |stores the user's last name                           |Doe               |
|**CK**  |PhoneNumber       |VARCHAR   |32    |NOT NULL     |              |stores the user's contact number                      |`19021234567`     |
|        |EmailAddress      |VARCHAR   |255   |NOT NULL     |              |stores the user's email address                       |janedoe@gmail.com |
|        |RegistrationDate  |TIMESTAMP |      |NOT NULL     |              |stores the date and time of when the user registered  |`19021234567`     |
|        |UnregistrationDate|TIMESTAMP |      |NULL         |              |stores the date and time of when the user unregistered|`19021234567`     |
|        |Hash              |BLOB      |      |NULL         |              |stores the user's password                            |                  |

#### Role Table
Contains data about the staff

|Key     |Name          |Type    |Size  |NULL/NOT NULL|Default       |Description                     |Sample          |
|:------:|:------------:|:------:|:----:|:-----------:|:------------:|:------------------------------:|:--------------:|
|**PK**  |RoleID        |INT     |      |NOT NULL     |IDENTITY      |_A unique sequential number_    |`1234567`       |
|-       |RoleName      |VARCHAR |32    |NOT NULL     |              |stores the name of role         |Admin           |

#### User_Role Table
Contains data about the tickets generated

|Key           |Name       |Type |Size |NULL/NOT NULL|Default   |Description                            |Sample        |
|:------------:|:---------:|:---:|:---:|:-----------:|:--------:|:-------------------------------------:|:------------:|
|**PK** **FK** |UserUserID |INT  |     |NOT NULL     |          |references which user has the role     |`1234567`     |
|**PK** **FK** |RoleRoleID |INT  |     |NOT NULL     |          |references what role the user has      |`1234567`     |

#### Permission Table
Contains data on the different categories of tickets

|Key     |Name           |Type    |Size  |NULL/NOT NULL|Default    |Description                     |Sample                |
|:------:|:-------------:|:------:|:----:|:-----------:|:---------:|:------------------------------:|:--------------------:|
|**PK**  |PermissionID   |INT     |11    |NOT NULL     |IDENTITY   |_A unique sequential number_    |`1234567`             |
|-       |PermissionName |VARCHAR |32    |NOT NULL     |           |stores the name of permission   |website.user.delete   |

#### Role_Permission Table
Contains data about the tickets generated

|Key          |Name                  |Type    |Size  |NULL/NOT NULL|Default   |Description                                                      |Sample               |
|:-----------:|:--------------------:|:------:|:----:|:-----------:|:--------:|:---------------------------------------------------------------:|:-------------------:|
|**PK** **FK**|RoleRoleID            |INT     |11    |NOT NULL     |          |_A unique sequential number_ that references the role table      |`1234567`            |
|**PK** **FK**|PermissionPermissionID|INT     |11    |NOT NULL     |          |_A unique sequential number_ that references the permission table|`1234567`            |

#### Address Table
Contains data on the different categories of tickets

|Key     |Name            |Type    |Size  |NULL/NOT NULL|Default    |Description                                   |Sample                   |
|:------:|:--------------:|:------:|:----:|:-----------:|:---------:|:--------------------------------------------:|:-----------------------:|
|**PK**  |AddressID       |INT     |11    |NOT NULL     |IDENTITY   |_A unique sequential number_                  |`1234567`                |
|-       |StreetAddress   |VARCHAR |64    |NOT NULL     |           |stores the information on the street address  |123 Heavenly Lane        |
|-       |State           |VARCHAR |32    |NOT NULL     |           |stores the name of the state                  |Nova Scotia              |
|-       |City            |VARCHAR |255   |NOT NULL     |           |stores the name of the city                   |Halifax                  |
|-       |Zipcode         |VARCHAR |32    |NOT NULL     |           |stores the zipcode                            |B2Z 1G3                  |
|**FK**  |UserID          |INT     |      |NOT NULL     |           |references the User table                     |problem with the physical aspects|
|**FK**  |CountryCountryID|INT     |      |NOT NULL     |           |references Country table                      |Hardware Issue                   |

#### Country
Contains the thread between the user and the staff member, if any.

|Key     |Name               |Type    |Size  |NULL/NOT NULL|Default      |Description                               |Sample                                      |
|:------:|:-----------------:|:------:|:----:|:-----------:|:-----------:|:----------------------------------------:|:------------------------------------------:|
|**PK**  |CountryID          |INT     |11    |NOT NULL     |IDENTITY     |_A unique sequential number_              |`1234567`                                   |
|-       |CountryName        |VARCHAR |128   |NOT NULL     |             |stores the name of the country            |Canada                         |


#### Account
Contains what task needs to be done to resolve the ticket

|Key     |Name               |Type     |Size  |NULL/NOT NULL|Default      |Description                                     |Sample                                      |
|:------:|:-----------------:|:-------:|:----:|:-----------:|:-----------:|:----------------------------------------------:|:------------------------------------------:|
|**PK**  |AccountID          |INT      |11    |NOT NULL     |IDENTITY     |_A unique sequential number_                    |`1234567`                                   |
|-       |AccountCloseDate   |TIMESTAMP|      |NOT NULL     |             |stores the name of the task                     |Warranty Repair                             |
|        |BalanceCALC        |DECIMAL  |      |NOT NULL     |             |describes the task that has to be done          |replace monitor and install it              |
|-       |FundOwnershipCALC  |DECIMAL  |      |NOT NULL     |             |the date the comment entry is made              |`2019-07-11 04:27:07`                       |
|**FK**  |UserID             |INT      |11    |NULL         |             |references which ticket the task belongs to         |`1234567`                               |

#### Trade
Contains the information on a specific hardware that can be used to resolve a ticket

|Key     |Name                |Type      |Size  |NULL/NOT NULL|Default    |Description                                |Sample             |
|:------:|:------------------:|:--------:|:----:|:-----------:|:---------:|:-----------------------------------------:|:-----------------:|
|**PK**  |TradeID             |INT       |11    |NOT NULL     |IDENTITY   |_A unique sequential number_               |`1234567`          |
|-       |CurrencyPair        |VARCHAR   |6     |NOT NULL     |           |stores the name of the item                |monitor            |
|-       |EntryPrice          |DECIMAL   |19,0  |NOT NULL     |           |a short description of the item            |19in x 34in screen |
|-       |EntryDateTime       |TIMESTAMP |      |NOT NULL     |           |stores the date the hardware was purchased |`50.25`            |
|        |ExitPrice           |VARCHAR   |19,0  |NOT NULL     |           |stores the hardware's serial number        |AK07115477WQD      |      
|-       |ExitDateTime        |TIMESTAMP |      |NOT NULL     |           |stores the name of the item                |monitor            |
|-       |TradeDirection      |BIT       |      |NOT NULL     |           |a short description of the item            |19in x 34in screen |
|-       |InitialStopPrice    |DECIMAL   |19,0  |NOT NULL     |           |stores the date the hardware was purchased |`50.25`            |
|        |PositionSize        |INT       |11    |NOT NULL     |           |stores the hardware's serial number        |AK07115477WQD      |      
|-       |FundSize            |DECIMAL   |      |NOT NULL     |           |a short description of the item            |19in x 34in screen |
|-       |Profit              |DECIMAL   |19,0  |NOT NULL     |           |stores the date the hardware was purchased |`50.25`            |
|        |Return              |FLOAT     |      |NOT NULL     |           |stores the hardware's serial number        |AK07115477WQD      |


#### Account_Trade
References the many to many relationship between Ticket and Hardware

|Key            |Name               |Type      |Size  |NULL/NOT NULL|Default   |Description                                                   |Sample                             |
|:-------------:|:-----------------:|:--------:|:----:|:-----------:|:--------:|:------------------------------------------------------------:|:---------------------------------:|
|**PK** **FK**  |AccountAccountID   |INT       |11    |NOT NULL     |          |_A unique sequential number_ that references the account table|`1234567`                          |
|**PK** **FK**  |TradeTradeID       |INT       |11    |NOT NULL     |          |_A unique sequential number_ that references the trade table  |`1234567`                          |
|               |TradeContribution  |FLOAT     |      |NOT NULL     |          |                                                              |`1234567`                          |

#### Transfer
References the many to many relationship between Ticket and Hardware

|Key    |Name            |Type      |Size  |NULL/NOT NULL|Default   |Description                                                   |Sample                             |
|:-----:|:--------------:|:--------:|:----:|:-----------:|:--------:|:------------------------------------------------------------:|:---------------------------------:|
|**PK** |TransferID      |INT       |11    |NOT NULL     |          |_A unique sequential number_ that references the account table|`1234567`                          |
|       |Amount          |DECIMAL   |      |NOT NULL     |          |_A unique sequential number_ that references the trade table  |`1234567`                          |
|       |TransferDateTime|TIMESTAMP |      |NOT NULL     |          |                                                              |`1234567`                          |
|**FK** |AccountAccountID|INT       |11    |NOT NULL     |          |                                                              |`1234567`                          |
