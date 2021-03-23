CREATE OR REPLACE PROCEDURE CreateRole(
    IN Name VARCHAR(64),
    OUT Id INT
)
BEGIN
    INSERT INTO Role (Name)
    VALUES (Name);
    SET Id = LAST_INSERT_ID();
END;

CREATE OR REPLACE PROCEDURE CreatePermissions(
    IN Name VARCHAR(64),
    OUT Id INT
)
BEGIN
    INSERT INTO Permission (Name)
    VALUES (Name);
    SET Id = LAST_INSERT_ID();
END;

CREATE OR REPLACE PROCEDURE AssignPermissions(
    PermissionId INT,
    RoleId INT
)
BEGIN
    INSERT INTO RolePermissions (PermissionId, RoleId)
    VALUES (PermissionId, RoleId);
END;