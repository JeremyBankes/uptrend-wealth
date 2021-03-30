# CREATE OR REPLACE PROCEDURE GetUserInformation(
#     IN UserId INT,
#
# )
#
# BEGIN
#     SELECT User.Id, User.FirstName, User.LastName, User.Email, User.Hash,
#            User.Phone, User.Registration, User.Unregistration, StreetAddress,
#            Subdivision, City, ZipCode, Name
#     FROM User
#     INNER JOIN Address ON User.AddressId = Address.Id
#     INNER JOIN Country ON Address.CountryId = Country.Id
#     UNION
#     SELECT Role.Name FROM Role
#     INNER JOIN UserRole ON Role.Id = UserRole.RoleId
#     INNER JOIN User ON UserRole.UserId = User.Id;
# END;