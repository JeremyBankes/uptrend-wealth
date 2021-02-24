# Uptrend Wealth
## A DATA DICTIONARY

## User
A user describes a person who may have signed up on the website, but hasn't necessarily (but could have) made a contribution to the fund (an investment).

| Key    | Name           | Type     | Size | Nullable | Default   | Description                    | Sample                                                         |
|:------:|:---------------|:---------|:----:|:--------:|:---------:|:-------------------------------|:---------------------------------------------------------------|
| **PK** | Id             | INTEGER  |      |          |           | A unique identifier            | 1002                                                           |
|        | FirstName      | VARCHAR  | 128  |          |           | The first name                 | 'Jeremy'                                                       |
|        | LastName       | VARCHAR  | 128  |          |           | The last name                  | 'Bankes'                                                       |
|        | Email          | VARCHAR  | 256  |          |           | The email address              | 'jeremy.bankes@gmail.com'                                      |
|        | Hash           | BINARY   | 72   |          |           | The hashed password            | '$2y$12$95ajGoGTH/mFyc0aGZ/CpetFWL.5EvrT6U8pCB6NlGjp1ZI6bXcUO' |
|        | Phone          | VARCHAR  | 64   |          |           | The phone number               | (902) 809 7345                                                 |
|        | Registration   | DATETIME |      |          |           | The date of registration       | 2021-11-14  23:59:59.999999                                    |
|        | Unregistration | DATETIME |      | **NULL** | NULL      | The date of unregistration     | 2023-04-04  15:45:03.43                                        |
| **FK** | RoleId         | INTEGER  |      |          |           | The ID of the role             | 4                                                              |
| **FK** | AddressId      | INTEGER  |      |          |           | The ID of the address          | 3045                                                           |
| **FK** | AccountId      | INTEGER  |      | **NULL** | NULL      | The ID of the account          | 1006                                                           |

## Account
An accout describes a user who has registered to be an investor.

| Key    | Name           | Type     | Size | Nullable | Default   | Description                    | Sample                                                         |
|:------:|:---------------|:---------|:----:|:--------:|:---------:|:-------------------------------|:---------------------------------------------------------------|
| **PK** | Id             | INTEGER  |      |          |           | A unique identifier            | 1005                                                           |
|        | CloseDate      | DATETIME |      | **NULL** | NULL      | The date of account closure    | 2023-04-04  15:45:03.43                                        |

## Trade
Represent a trade (A entering and exiting a position on the Forex market).

| Key    | Name             | Type     | Size    | Nullable | Description                                         | Sample                                           |
|:------:|:-----------------|:---------|:-------:|:--------:|:----------------------------------------------------|:-------------------------------------------------|
| **PK** | Id               | INTEGER  |         |          | A unique identifier                                 | 4005                                             |
|        | Pair             | CHAR     | 6       |          | The Forex currency pair the trade is using          | USDCAD                                           |
|        | EntryPrice       | DECIMAL  | (13, 4) |          | The price at which a trade is entered               | 43.4424                                          |
|        | EntryTime        | DATETIME |         |          | The time at which a trade is entered                | 2023-04-04  15:45:03.4                           |
|        | ExitPrice        | DECIMAL  | (13, 4) | **NULL** | The price at which a trade is exited                | 43.5523                                          |
|        | ExitTime         | DATETIME |         | **NULL** | The time at which a trade is exited                 | 2023-04-05  11:35:05.35                          |
|        | Direction        | BOOLEAN  |         |          | The direction a trade is meant to go                | true (for long, false for short)                 |
|        | InitialStopPrice | DECIMAL  | (13, 4) |          | The intial price at which the stop loss is placed   | 40.3443                                          |
|        | PositionSize     | INTEGER  |         |          | The size of a trade (units purchased)               | 123000                                           |
|        | FundSize         | DECIMAL  | (13, 4) |          | The total size of the fund at the time of the trade | 75454.4364                                       |
|        | Profit           | DECIMAL  | (13, 4) | **NULL** | The total profit or loss made on this trade         | -435.4343                                        |

## Claim
Represents the amount of a profit or loss an account will receive or suffer from a trade as a percentage (of the trade's "Profit" field).
| Key    | Name             | Type    | Size    | Nullable | Description                                         | Sample                                           |
|:------:|:-----------------|:--------|:-------:|:--------:|:----------------------------------------------------|:-------------------------------------------------|
| **FK** | AccountId        | INTEGER |         |          | The ID of the account owning this claim             | 1005                                             |
| **FK** | TradeId          | INTEGER |         |          | The ID of the trade the account has ownership of    | 1566                                             |
|        | Ownership        | DECIMAL | (5, 4)  |          | Percentage ownership of an account over a trade.    | 0.40000 (40%)                                    |

## Transfer
Represents an account's deposit or withdrawl of money from the fund. Note that there is no total balance of an account stored anywhere within the database, if a total
account balance is required, a summation of all transfers must be done. This is to avoid data synchronization issues.
| Key    | Name             | Type     | Size    | Nullable | Description                                         | Sample                                           |
|:------:|:-----------------|:---------|:-------:|:--------:|:----------------------------------------------------|:-------------------------------------------------|
| **PK** | Id               | INTEGER  |         |          | The ID of the transfer                              | 1134                                             |
| **FK** | AccountId        | INTEGER  |         |          | The ID of the account prompting the transfer        | 1005                                             |
|        | Amount           | DECIMAL  | (13, 4) |          | The amount of money being transfered                | $5000 ((+) for deposits, (-) for withdraws)      |
|        | Time             | DATETIME |         |          | The date and time of the transfer                   | 2023-04-05  11:35:05.35                          |

## Address
Represents an address.
| Key    | Name             | Type    | Size    | Nullable | Description                                         | Sample                                           |
|:------:|:-----------------|:--------|:-------:|:--------:|:----------------------------------------------------|:-------------------------------------------------|
| **PK** | Id               | INTEGER |         |          | The ID of the address                               | 26                                               |
|        | StreetAddress    | VARCHAR | 256     |          | The street address                                  | 200 Ashley St.                                   |
|        | Subdivision      | VARCHAR | 256     |          | The state or province                               | Ontario                                          |
|        | City             | VARCHAR | 256     |          | The town, city or village                           | Ottawa                                           |
|        | ZipCode          | VARCHAR | 10      |          | The ZIP or postal code                              | B4B 1T4                                          |
| **FK** | CountryID        | INTEGER |         |          | The ID of the country                               | 5                                                |

## Country
Represents a country.
| Key    | Name             | Type    | Size    | Nullable | Description                                         | Sample                                           |
|:------:|:-----------------|:--------|:-------:|:--------:|:----------------------------------------------------|:-------------------------------------------------|
| **PK** | Id               | INTEGER |         |          | The ID of the country                               | 5                                                |
|        | Name             | VARCHAR | 64      |          | The name of the country                             | Canada, Mongolian, Scotland ...                  |

## Permission
Represents a role's permit to take a certain action on the web interface. Certain roles will have certain permissions.
| Key    | Name             | Type    | Size    | Nullable | Description                                         | Sample                                           |
|:------:|:-----------------|:--------|:-------:|:--------:|:----------------------------------------------------|:-------------------------------------------------|
| **PK** | Id               | INTEGER |         |          | The ID of the permission                            | 2                                                |
|        | Name             | VARCHAR | 64      |          | The name of the permission                          | website.user.delete, website.view.fund, ...      |

## Role
Represents a collection of permissions allowing a user to take certain actions on the web interface. Roles can be given to or taken from users.
| Key    | Name             | Type    | Size    | Nullable | Description                                         | Sample                                           |
|:------:|:-----------------|:--------|:-------:|:--------:|:----------------------------------------------------|:-------------------------------------------------|
| **PK** | Id               | INTEGER |         |          | The ID of the role                                  | 4                                                |
|        | Name             | VARCHAR | 64      |          | The name of the role                                | moderator, developer, owner, ...                 |