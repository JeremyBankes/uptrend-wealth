CREATE OR REPLACE PROCEDURE CreateAddress(
    IN StreetAddress VARCHAR(256),
    IN Subdivision VARCHAR(256),
    IN City VARCHAR(256),
    IN ZipCode VARCHAR(10),
    IN CountryId INT
)
BEGIN
    INSERT INTO Address (StreetAddress, Subdivision, City, ZipCode, CountryId)
    VALUES (StreetAddress, Subdivision, City, ZipCode, CountryId);
END;

CREATE OR REPLACE PROCEDURE CreateUser(
    IN FirstName VARCHAR(128),
    IN LastName VARCHAR(128),
    IN Email VARCHAR(256),
    IN Hash BINARY(72),
    IN Phone VARCHAR(64),
    IN Registration DATETIME,
    IN AddressId INT
)
BEGIN
    INSERT INTO User (FirstName, LastName, Email, Hash, Phone, Registration, AddressId)
    VALUES (FirstName, LastName, Email, Hash, Phone, Registration, AddressId);
END;
