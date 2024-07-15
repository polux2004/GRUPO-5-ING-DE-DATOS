
CREATE TRIGGER trg_BeforeInsertUsuario
ON Usuario
INSTEAD OF INSERT
AS
BEGIN
    DECLARE @email VARCHAR(30);
    DECLARE @existingCount INT;

    SELECT @email = email FROM inserted;

    SELECT @existingCount = COUNT(*) FROM Usuario WHERE email = @email;

    IF @existingCount > 0
    BEGIN
        RAISERROR('La inserción ha sido cancelada porque el email ya existe.', 16, 1);
    END
    ELSE
    BEGIN
        INSERT INTO Usuario (idUsuario, email, contraseña, nombre, Categoria_id)
        SELECT idUsuario, email, contraseña, nombre, Categoria_id FROM inserted;
    END
END;
GO

