use DB_Deliz;


CREATE TABLE Usuario 
    (
     idUsuario NUMERIC (5) NOT NULL , 
     email VARCHAR (30) NOT NULL , 
     contraseña VARCHAR (10) NOT NULL , 
     nombre VARCHAR (50) NOT NULL , 
     Categoria_id NUMERIC (5) NOT NULL 
    )
GO

CREATE TABLE CategoriaUsuario 
    (
     idCategoriaUsuario NUMERIC (5) NOT NULL , 
     nombre VARCHAR (40) 
    )
GO


ALTER TABLE CategoriaUsuario ADD CONSTRAINT CategoriaUsuario_PK PRIMARY KEY CLUSTERED (idCategoriaUsuario)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Color 
    (
     idColor NUMERIC (5) NOT NULL , 
     nombreColor VARCHAR (20) 
    )
GO

ALTER TABLE Color ADD CONSTRAINT Color_PK PRIMARY KEY CLUSTERED (idColor)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Compra 
    (
     idCompra NUMERIC (5) NOT NULL , 
     Estado_Transaccion_id NUMERIC (5) NOT NULL , 
     Metodo_Pago_id NUMERIC (5) NOT NULL , 
     EstadoDePago_id NUMERIC (5) NOT NULL , 
     Empresa_id NUMERIC (5) NOT NULL 
    )
GO

ALTER TABLE Compra ADD CONSTRAINT Compra_PK PRIMARY KEY CLUSTERED (idCompra)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Compra_Producto 
    (
     Compra_id NUMERIC (5) NOT NULL , 
     Producto_id NUMERIC (5) NOT NULL , 
     monto NUMERIC (10) 
    )
GO

ALTER TABLE Compra_Producto ADD CONSTRAINT Compra_Producto_PK PRIMARY KEY CLUSTERED (Compra_id, Producto_id)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Cotización 
    (
     idCotizacion NUMERIC (5) NOT NULL , 
     telefono VARCHAR (9) , 
     email VARCHAR (30) , 
     descripcion VARCHAR (300) , 
     Usuario_id NUMERIC (5) NOT NULL , 
     Empresa_id NUMERIC (5) NOT NULL 
    )
GO

ALTER TABLE Cotización ADD CONSTRAINT Cotización_PK PRIMARY KEY CLUSTERED (idCotizacion)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Departamento 
    (
     idDepartamento NUMERIC (5) NOT NULL , 
     nombre VARCHAR (50) 
    )
GO

ALTER TABLE Departamento ADD CONSTRAINT Departamento_PK PRIMARY KEY CLUSTERED (idDepartamento)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Documento 
    (
     idDocumento NUMERIC (5) NOT NULL , 
     URL VARCHAR (200) NOT NULL , 
     Tipo CHAR (1) , 
     titulo VARCHAR (30) , 
     descripcion VARCHAR (50) , 
     fechaAñadido DATE , 
     Compra_id NUMERIC (5), 
     Venta_id NUMERIC (5)  
    )
GO 

    


CREATE UNIQUE NONCLUSTERED INDEX 
    Documento__IDX ON Documento 
    ( 
     Compra_id
    ) 
GO 


CREATE UNIQUE NONCLUSTERED INDEX 
    Documento__IDXv1 ON Documento 
    ( 
     Venta_id
    ) 
GO

ALTER TABLE Documento ADD CONSTRAINT Documento_PK PRIMARY KEY CLUSTERED (idDocumento)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Empleado 
    (
     idEmpleado NUMERIC (5) NOT NULL , 
     nombre VARCHAR(60),
     telefono VARCHAR (15) NOT NULL , 
     email VARCHAR (30) , 
     tareas VARCHAR (200) , 
     fechaIngreso DATE , 
     fechaNacimiento DATE , 
     salario DECIMAL (8,2) , 
     cuentaBancaria VARCHAR (20) , 
     Rol_id NUMERIC (5) NOT NULL , 
     tipoContrato_id NUMERIC (5) NOT NULL , 
     NivelEducativo_id NUMERIC (5) NOT NULL , 
     Sexo_id NUMERIC (3) NOT NULL , 
     Departamento_id NUMERIC (5) NOT NULL 
    )
GO

ALTER TABLE Empleado ADD CONSTRAINT Empleado_PK PRIMARY KEY CLUSTERED (idEmpleado)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Empresa 
    (
     idEmpresa NUMERIC (5) NOT NULL , 
     RUC VARCHAR (50) , 
     Razon_Social VARCHAR (50) 
    )
GO

ALTER TABLE Empresa ADD CONSTRAINT Empresa_PK PRIMARY KEY CLUSTERED (idEmpresa)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Estado_Pedido 
    (
     idEstado_Pedido NUMERIC (5) NOT NULL , 
     nombre VARCHAR (30) 
    )
GO

ALTER TABLE Estado_Pedido ADD CONSTRAINT Estado_Pedido_PK PRIMARY KEY CLUSTERED (idEstado_Pedido)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Estado_Transaccion 
    (
     id NUMERIC (5) NOT NULL , 
     nombre VARCHAR (30) 
    )
GO

ALTER TABLE Estado_Transaccion ADD CONSTRAINT Estado_Transaccion_PK PRIMARY KEY CLUSTERED (id)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE EstadoDePago 
    (
     id NUMERIC (5) NOT NULL , 
     nombre VARCHAR (30) 
    )
GO

ALTER TABLE EstadoDePago ADD CONSTRAINT EstadoDePago_PK PRIMARY KEY CLUSTERED (id)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Metodo_Pago 
    (
     id NUMERIC (5) NOT NULL , 
     nombre VARCHAR (30) 
    )
GO

ALTER TABLE Metodo_Pago ADD CONSTRAINT Metodo_Pago_PK PRIMARY KEY CLUSTERED (id)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE NivelEducativo 
    (
     idNivel_Educativo NUMERIC (5) NOT NULL , 
     nombre VARCHAR (50) 
    )
GO

ALTER TABLE NivelEducativo ADD CONSTRAINT NivelEducativo_PK PRIMARY KEY CLUSTERED (idNivel_Educativo)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Pedido 
    (
     idPedido NUMERIC (5) NOT NULL , 
     fk_EstadoPedido NUMERIC (5) NOT NULL , 
     Vehiculo_id NUMERIC (5) NOT NULL , 
     Venta_id NUMERIC (5) NOT NULL , 
     Estado_Pedido_id NUMERIC (5) NOT NULL 
    )
GO 

    


CREATE UNIQUE NONCLUSTERED INDEX 
    Pedido__IDX ON Pedido 
    ( 
     Venta_id
    ) 
GO

ALTER TABLE Pedido ADD CONSTRAINT Pedido_PK PRIMARY KEY CLUSTERED (idPedido)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Pedido_Empleado 
    (
     Empleado_id NUMERIC (5) NOT NULL , 
     Pedido_id NUMERIC (5) NOT NULL 
    )
GO

ALTER TABLE Pedido_Empleado ADD CONSTRAINT Pedido_Empleado_PK PRIMARY KEY CLUSTERED (Empleado_id, Pedido_id)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Producto 
    (
     idProducto NUMERIC (5) NOT NULL , 
     nombre VARCHAR (20) , 
     precioUnitario DECIMAL (8,2) 
    )
GO

ALTER TABLE Producto ADD CONSTRAINT Producto_PK PRIMARY KEY CLUSTERED (idProducto)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Producto_Cotizacion 
    (
     Cotización_id NUMERIC (5) NOT NULL , 
     Producto_id NUMERIC (5) NOT NULL , 
     Cantidad NUMERIC (6) , 
     Monto_Total DECIMAL (8,2) 
    )
GO

ALTER TABLE Producto_Cotizacion ADD CONSTRAINT Producto_Cotizacion_PK PRIMARY KEY CLUSTERED (Producto_id, Cotización_id)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO



CREATE TABLE Rol 
    (
     idRol NUMERIC (5) NOT NULL , 
     nombre VARCHAR (30) 
    )
GO

ALTER TABLE Rol ADD CONSTRAINT Rol_PK PRIMARY KEY CLUSTERED (idRol)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Sexo 
    (
     idSexo NUMERIC (3) NOT NULL , 
     nombre VARCHAR (30) 
    )
GO

ALTER TABLE Sexo ADD CONSTRAINT Sexo_PK PRIMARY KEY CLUSTERED (idSexo)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE tipoContrato 
    (
     idTipo_Contrato NUMERIC (5) NOT NULL , 
     nombre VARCHAR (30) 
    )
GO

ALTER TABLE tipoContrato ADD CONSTRAINT tipoContrato_PK PRIMARY KEY CLUSTERED (idTipo_Contrato)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Ubicación 
    (
     idUbicación NUMERIC (5) NOT NULL , 
     provincia VARCHAR (25) NOT NULL , 
     Pais VARCHAR (20) , 
     ReferenciaDeUbicación VARCHAR (50) , 
     Número VARCHAR (15) , 
     Calle VARCHAR (20) , 
     Distrito VARCHAR (25) , 
     Cotización_id NUMERIC (5) NOT NULL 
    )
GO 

    


CREATE UNIQUE NONCLUSTERED INDEX 
    Ubicación__IDX ON Ubicación 
    ( 
     Cotización_id
    ) 
GO

ALTER TABLE Ubicación ADD CONSTRAINT Ubicación_PK PRIMARY KEY CLUSTERED (idUbicación)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO



ALTER TABLE Usuario ADD CONSTRAINT Usuario_PK PRIMARY KEY CLUSTERED (idUsuario)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Vehiculo 
    (
     idVehiculo NUMERIC (5) NOT NULL , 
     Matricula VARCHAR (6) 
    )
GO

ALTER TABLE Vehiculo ADD CONSTRAINT Vehiculo_PK PRIMARY KEY CLUSTERED (idVehiculo)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Vehiculo_Color 
    (
     Vehiculo_id NUMERIC (5) NOT NULL , 
     Color_id NUMERIC (5) NOT NULL 
    )
GO

ALTER TABLE Vehiculo_Color ADD CONSTRAINT Vehiculo_Color_PK PRIMARY KEY CLUSTERED (Vehiculo_id, Color_id)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Venta 
    (
     idVenta NUMERIC (5) NOT NULL , 
     Estado_Transaccion_id NUMERIC (5) NOT NULL , 
     Metodo_Pago_id NUMERIC (5) NOT NULL , 
     EstadoDePago_id NUMERIC (5) NOT NULL , 
     Empresa_id NUMERIC (5) NOT NULL 
    )
GO

ALTER TABLE Venta ADD CONSTRAINT Venta_PK PRIMARY KEY CLUSTERED (idVenta)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

ALTER TABLE Compra 
    ADD CONSTRAINT Compra_Empresa_FK FOREIGN KEY 
    ( 
     Empresa_id
    ) 
    REFERENCES Empresa 
    ( 
     idEmpresa 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Compra 
    ADD CONSTRAINT Compra_Estado_Transaccion_FK FOREIGN KEY 
    ( 
     Estado_Transaccion_id
    ) 
    REFERENCES Estado_Transaccion 
    ( 
     id 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Compra 
    ADD CONSTRAINT Compra_EstadoDePago_FK FOREIGN KEY 
    ( 
     EstadoDePago_id
    ) 
    REFERENCES EstadoDePago 
    ( 
     id 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Compra 
    ADD CONSTRAINT Compra_Metodo_Pago_FK FOREIGN KEY 
    ( 
     Metodo_Pago_id
    ) 
    REFERENCES Metodo_Pago 
    ( 
     id 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Compra_Producto 
    ADD CONSTRAINT Compra_Producto_Compra_FK FOREIGN KEY 
    ( 
     Compra_id
    ) 
    REFERENCES Compra 
    ( 
     idCompra 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Compra_Producto 
    ADD CONSTRAINT Compra_Producto_Producto_FK FOREIGN KEY 
    ( 
     Producto_id
    ) 
    REFERENCES Producto 
    ( 
     idProducto 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Cotización 
    ADD CONSTRAINT Cotización_Empresa_FK FOREIGN KEY 
    ( 
     Empresa_id
    ) 
    REFERENCES Empresa 
    ( 
     idEmpresa 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Cotización 
    ADD CONSTRAINT Cotización_Usuario_FK FOREIGN KEY 
    ( 
     Usuario_id
    ) 
    REFERENCES Usuario 
    ( 
     idUsuario 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

----
ALTER TABLE Documento 
    ADD CONSTRAINT Documento_Compra_FK FOREIGN KEY 
    ( 
     Compra_id
    ) 
    REFERENCES Compra 
    ( 
     idCompra 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Documento 
    ADD CONSTRAINT Documento_Venta_FK FOREIGN KEY 
    ( 
     Venta_id
    ) 
    REFERENCES Venta 
    ( 
     idVenta 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Empleado 
    ADD CONSTRAINT Empleado_Departamento_FK FOREIGN KEY 
    ( 
     Departamento_id
    ) 
    REFERENCES Departamento 
    ( 
     idDepartamento 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Empleado 
    ADD CONSTRAINT Empleado_NivelEducativo_FK FOREIGN KEY 
    ( 
     NivelEducativo_id
    ) 
    REFERENCES NivelEducativo 
    ( 
     idNivel_Educativo 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Empleado 
    ADD CONSTRAINT Empleado_Rol_FK FOREIGN KEY 
    ( 
     Rol_id
    ) 
    REFERENCES Rol 
    ( 
     idRol 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Empleado 
    ADD CONSTRAINT Empleado_Sexo_FK FOREIGN KEY 
    ( 
     Sexo_id
    ) 
    REFERENCES Sexo 
    ( 
     idSexo 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Empleado 
    ADD CONSTRAINT Empleado_tipoContrato_FK FOREIGN KEY 
    ( 
     tipoContrato_id
    ) 
    REFERENCES tipoContrato 
    ( 
     idTipo_Contrato 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Pedido_Empleado 
    ADD CONSTRAINT Pedido_Empleado_Empleado_FK FOREIGN KEY 
    ( 
     Empleado_id
    ) 
    REFERENCES Empleado 
    ( 
     idEmpleado 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Pedido_Empleado 
    ADD CONSTRAINT Pedido_Empleado_Pedido_FK FOREIGN KEY 
    ( 
     Pedido_id
    ) 
    REFERENCES Pedido 
    ( 
     idPedido 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Pedido 
    ADD CONSTRAINT Pedido_Estado_Pedido_FK FOREIGN KEY 
    ( 
     fk_EstadoPedido
    ) 
    REFERENCES Estado_Pedido 
    ( 
     idEstado_Pedido 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Pedido 
    ADD CONSTRAINT Pedido_Estado_Pedido_FKv1 FOREIGN KEY 
    ( 
     Estado_Pedido_id
    ) 
    REFERENCES Estado_Pedido 
    ( 
     idEstado_Pedido 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Pedido 
    ADD CONSTRAINT Pedido_Vehiculo_FK FOREIGN KEY 
    ( 
     Vehiculo_id
    ) 
    REFERENCES Vehiculo 
    ( 
     idVehiculo 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Pedido 
    ADD CONSTRAINT Pedido_Venta_FK FOREIGN KEY 
    ( 
     Venta_id
    ) 
    REFERENCES Venta 
    ( 
     idVenta 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Producto_Cotizacion 
    ADD CONSTRAINT Producto_Cotizacion_Cotización_FK FOREIGN KEY 
    ( 
     Cotización_id
    ) 
    REFERENCES Cotización 
    ( 
     idCotizacion 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Producto_Cotizacion 
    ADD CONSTRAINT Producto_Cotizacion_Producto_FK FOREIGN KEY 
    ( 
     Producto_id
    ) 
    REFERENCES Producto 
    ( 
     idProducto 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO



ALTER TABLE Ubicación 
    ADD CONSTRAINT Ubicación_Cotización_FK FOREIGN KEY 
    ( 
     Cotización_id
    ) 
    REFERENCES Cotización 
    ( 
     idCotizacion 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Usuario 
    ADD CONSTRAINT Usuario_CategoriaUsuario_FK FOREIGN KEY 
    ( 
     Categoria_id
    ) 
    REFERENCES CategoriaUsuario 
    ( 
     idCategoriaUsuario 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO


ALTER TABLE Vehiculo_Color 
    ADD CONSTRAINT Vehiculo_Color_Color_FK FOREIGN KEY 
    ( 
     Color_id
    ) 
    REFERENCES Color 
    ( 
     idColor 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Vehiculo_Color 
    ADD CONSTRAINT Vehiculo_Color_Vehiculo_FK FOREIGN KEY 
    ( 
     Vehiculo_id
    ) 
    REFERENCES Vehiculo 
    ( 
     idVehiculo 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Venta 
    ADD CONSTRAINT Venta_Empresa_FK FOREIGN KEY 
    ( 
     Empresa_id
    ) 
    REFERENCES Empresa 
    ( 
     idEmpresa 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Venta 
    ADD CONSTRAINT Venta_Estado_Transaccion_FK FOREIGN KEY 
    ( 
     Estado_Transaccion_id
    ) 
    REFERENCES Estado_Transaccion 
    ( 
     id 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Venta 
    ADD CONSTRAINT Venta_EstadoDePago_FK FOREIGN KEY 
    ( 
     EstadoDePago_id
    ) 
    REFERENCES EstadoDePago 
    ( 
     id 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Venta 
    ADD CONSTRAINT Venta_Metodo_Pago_FK FOREIGN KEY 
    ( 
     Metodo_Pago_id
    ) 
    REFERENCES Metodo_Pago 
    ( 
     id 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO


select * from color;
insert into color values (1, 'rojo');
insert into color values (2, 'azul');
insert into color values (3, 'verde');
insert into color values (4, 'negro');
insert into color values (5, 'blanco');


select * from categoriausuario;
insert into categoriausuario values (1, 'admin');
insert into categoriausuario values (2, 'usuarioNormal');
insert into categoriausuario values (3, 'empleado');

select * from usuario;

insert into usuario values(1,'20211617@aloe.ulima.edu.pe', '20211617', 'Adriel Marocho', 1);
insert into usuario values(2,'20213398@aloe.ulima.edu.pe', '20213398 ', 'Alexis Chaberlin', 1);
insert into usuario values(3,'20213485@aloe.ulima.edu.pe', '20213485', 'Polux DeLaCruz', 1);
insert into usuario values(4, '20211532@aloe.ulima.edu.pe', '20211532', 'Renzo Lorenzo', 1);
insert into usuario values(5, '20214132@aloe.ulima.edu.pe', '20214132', 'Nicolas Ruggiero', 1);


select * from Departamento;
INSERT INTO Departamento VALUES (1, 'Amazonas');
INSERT INTO Departamento VALUES (2, 'Áncash');
INSERT INTO Departamento VALUES (3, 'Apurímac');
INSERT INTO Departamento VALUES (4, 'Arequipa');
INSERT INTO Departamento VALUES (5, 'Ayacucho');
INSERT INTO Departamento VALUES (6, 'Cajamarca');
INSERT INTO Departamento VALUES (7, 'Callao');
INSERT INTO Departamento VALUES (8, 'Cusco');
INSERT INTO Departamento VALUES (9, 'Huancavelica');
INSERT INTO Departamento VALUES (10, 'Huánuco');
INSERT INTO Departamento VALUES (11, 'Ica');
INSERT INTO Departamento VALUES (12, 'Junín');
INSERT INTO Departamento VALUES (13, 'La Libertad');
INSERT INTO Departamento VALUES (14, 'Lambayeque');
INSERT INTO Departamento VALUES (15, 'Lima');
INSERT INTO Departamento VALUES (16, 'Loreto');
INSERT INTO Departamento VALUES (17, 'Madre de Dios');
INSERT INTO Departamento VALUES (18, 'Moquegua');
INSERT INTO Departamento VALUES (19, 'Pasco');
INSERT INTO Departamento VALUES (20, 'Piura');
INSERT INTO Departamento VALUES (21, 'Puno');
INSERT INTO Departamento VALUES (22, 'San Martín');
INSERT INTO Departamento VALUES (23, 'Tacna');
INSERT INTO Departamento VALUES (24, 'Tumbes');
INSERT INTO Departamento VALUES (25, 'Ucayali');

select * from estado_pedido;
insert into estado_pedido values (1, 'Pendiente');
insert into estado_pedido values (2, 'Cancelado');
insert into estado_pedido values (3, 'Entregado');

select * from empresa;
INSERT INTO empresa VALUES (1, '12345678901', 'Distribuidora de Maquinas S.A.C.');
INSERT INTO empresa VALUES (2, '98765432109', 'Tecnología Automatizada S.A.C.');
INSERT INTO empresa VALUES (3, '11223344556', 'Soluciones Dispensadoras E.I.R.L.');
INSERT INTO empresa VALUES (4, '99887766554', 'Innovaciones en Dispensadoras S.A.');
INSERT INTO empresa VALUES (5, '55667788990', 'Máquinas y Servicios Integrales S.A.C.');
INSERT INTO empresa VALUES (6, '66778899001', 'Distribuidora de Automatización E.I.R.L.');

select * from producto;
INSERT INTO producto VALUES (1, 'Maquina dispensadora', 450);
INSERT INTO producto VALUES (2, 'Bolas de juguetes', 1.00);
INSERT INTO producto VALUES (3, 'Pack de Snacks', 10.0);
INSERT INTO producto VALUES (4, 'Juguetes pequeños', 1.50);
INSERT INTO producto VALUES (5, 'Pelotas de goma', 1.20);
INSERT INTO producto VALUES (6, 'Llaveros', 3.00);


select * from cotización;
insert into cotización values (1, '982429015', '20213398@aloe.ulima.edu.pe', 'Hola, quisiera adquirir una máquina dispensadora junto con el servicio de abastecimiento mensual. ¿Podrían proporcionarme una cotización?',2,1);
insert into cotización values (2, '982429014', '20213485@aloe.ulima.edu.pe', 'Buenos días, me gustaría obtener una máquina dispensadora y el servicio de abastecimiento por un mes. ¿Podrían enviarme una cotización, por favor?',3,2);
insert into cotización values (3, '982429013', '20211532@aloe.ulima.edu.pe', 'Buen día, estoy buscando una máquina dispensadora y el servicio de abastecimiento para un mes. ¿Podrían hacerme una cotización, por favor?',4,3);

select * from producto_cotizacion;
insert into producto_cotizacion values (1,1,10,4500);
insert into producto_cotizacion values (1,2,150,150);
insert into producto_cotizacion values (2,1,15,6750);
insert into producto_cotizacion values (2,2,200,200);
insert into producto_cotizacion values (2,3,30,300);



select * from ubicación;
insert into ubicación values (1, 'Lima', 'Peru', 'Avenida Javier Prado Este', '123', 'Elmo', 'La Molina', 1);

insert into ubicación values (2, 'Arequipa', 'Peru', 'Calle Misti', '456', 'Carrier', 'Cayma', 2);

insert into ubicación values (3, 'Cusco', 'Peru', 'Plaza de Armas', '789', 'Sambique', 'Cusco', 3);

select * from rol;
INSERT INTO rol VALUES (1, 'Conductor');
INSERT INTO rol VALUES (2, 'Técnico de Mantenimiento');
INSERT INTO rol VALUES (3, 'Gerente de Ventas');
INSERT INTO rol VALUES (4, 'Especialista en Logística');
INSERT INTO rol VALUES (5, 'Atención al Cliente');
INSERT INTO rol VALUES (6, 'Instalador');
INSERT INTO rol VALUES (7, 'Coordinador de Pedidos');
INSERT INTO rol VALUES (8, 'Analista de Datos');
INSERT INTO rol VALUES (9, 'Especialista en Marketing');
INSERT INTO rol VALUES (10, 'Encargado de Inventario');

select * from estado_transaccion;
insert into estado_transaccion values (1, 'Pendiente');
insert into estado_transaccion values (2, 'Completada');
insert into estado_transaccion values (3, 'Fallida');
insert into estado_transaccion values (4, 'Cancelada');
insert into estado_transaccion values (5, 'En proceso');
insert into estado_transaccion values (6, 'Reembolsada');
insert into estado_transaccion values (7, 'En espera');
insert into estado_transaccion values (8, 'Declinada');
insert into estado_transaccion values (9, 'Autorizada');
insert into estado_transaccion values (10, 'Retenida');



select * from estadodepago;
insert into estadodepago values (1, 'Pendiente');
insert into estadodepago values (2, 'Pagado');
insert into estadodepago values (3, 'Fallido');
insert into estadodepago values (4, 'Reembolsado');
insert into estadodepago values (5, 'Cancelado');
insert into estadodepago values (6, 'En espera');
insert into estadodepago values (7, 'Parcialmente pagado');
insert into estadodepago values (8, 'Declinado');

select * from metodo_pago;
insert into metodo_pago values (1, 'Tarjeta de débito');
insert into metodo_pago values (2, 'Transferencia bancaria');
insert into metodo_pago values (3, 'Pago en efectivo');

select * from niveleducativo;
insert into niveleducativo values (1, 'Primaria');
insert into niveleducativo values (2, 'Secundaria');
insert into niveleducativo values (3, 'Bachillerato');
insert into niveleducativo values (4, 'Técnico');
insert into niveleducativo values (5, 'Pregrado');
insert into niveleducativo values (6, 'Posgrado');
insert into niveleducativo values (7, 'Maestría');
insert into niveleducativo values (8, 'Doctorado');
insert into niveleducativo values (9, 'Diplomado');

select * from sexo;
insert into sexo values (1, 'masculino');
insert into sexo values (2, 'femenino');

select * from tipocontrato;
insert into tipocontrato values (1, 'Tiempo completo');
insert into tipocontrato values (2, 'Medio tiempo');
insert into tipocontrato values (3, 'Por horas');
insert into tipocontrato values (4, 'Temporal');
insert into tipocontrato values (5, 'Indefinido');
insert into tipocontrato values (6, 'Freelance');
insert into tipocontrato values (7, 'Prácticas');
insert into tipocontrato values (8, 'Por proyecto');
insert into tipocontrato values (9, 'A tiempo parcial');







select * from vehiculo;
insert into vehiculo values (1, 'ABC123');
insert into vehiculo values (2, 'DEF456');
insert into vehiculo values (3, 'GHI789');
insert into vehiculo values (4, 'JKL012');
insert into vehiculo values (5, 'MNO345');



select * from vehiculo_color;
insert into vehiculo_color values (1,1);
insert into vehiculo_color values (1,2);
insert into vehiculo_color values (2,2);
insert into vehiculo_color values (3,3);
insert into vehiculo_color values (3,4);
insert into vehiculo_color values (4,4);
insert into vehiculo_color values (5,5);



select * from compra;
insert into compra values (1,1,1,1,1);
insert into compra values (2,2,2,2,2);
insert into compra values (3,3,3,3,3);
insert into compra values (4,1,2,1,4);
insert into compra values (5,1,1,1,5);

select * from venta;
insert into venta values (1,1,1,1,1);
insert into venta values (2,1,2,2,2);
insert into venta values (3,1,3,1,3);
insert into venta values (4,1,2,1,4);


select * from compra_producto;
insert into compra_producto values(1,1, 5000);
insert into compra_producto values(1,2, 7000);
insert into compra_producto values(2,1, 8000);
insert into compra_producto values(2,2, 6500);
insert into compra_producto values(3,1, 4000);



  






SELECT * FROM empleado;
INSERT INTO empleado 
VALUES (1, 'adriel','982429016', '20211617@aloe.ulima.edu.pe', 'Conducir el camión', '2022-06-15', '2004-02-13', 3000.00, '567890123456', 1, 1, 4, 1, 15);

INSERT INTO empleado 
VALUES (2, 'renzo','982429025', '20212017@aloe.ulima.edu.pe', 'Dar mantenimiento a las maquinas dispensadoras', '2022-01-15', '2004-03-13', 3000, '345612345678', 2, 3, 4, 1, 15);

INSERT INTO empleado 
VALUES (3, 'nicolas', '982429027' ,'20211632@aloe.ulima.edu.pe', 'Manejar los flujos economicos de la compañia', '2021-06-15', '2003-02-13', 3000, '567812349012', 3, 1, 7, 1, 15);

INSERT INTO empleado 
VALUES (4, 'alexis','982429029' ,'20213247@aloe.ulima.edu.pe', 'Encargado de pronosticar la demanda y el correcto funcionamiento de la cadena de suministro', '2022-06-15', '1970-02-13', 3000, '123456783456', 4, 1, 7, 1, 15);

INSERT INTO empleado 
VALUES (5, 'polux','982429023' ,'20162117@aloe.ulima.edu.pe', 'Encargado de atender las quejas y requerimientos de los clientes de los productos de la empresa', '2020-06-15', '2001-02-13', 3000, '123456789012', 5, 1, 4, 1, 15);



select * from pedido;
insert into pedido values (1,1,1,1,1);
insert into pedido values (2,1,1,2,2);
insert into pedido values (3,1,1,3,3);



















select * from pedido_empleado;
insert into pedido_empleado values (1, 1);
insert into pedido_empleado values (2, 1);
insert into pedido_empleado values (3, 1);
insert into pedido_empleado values (1, 2);
insert into pedido_empleado values (2, 2);

DROP INDEX Documento__IDXv1 ON Documento;
CREATE UNIQUE INDEX Documento__IDXv1
ON Documento (Compra_id, Venta_id)
WHERE Compra_id IS NOT NULL AND Venta_id IS NOT NULL;

SELECT * FROM documento;

INSERT INTO documento (idDocumento, url, tipo, titulo, descripcion, fechaAñadido, Compra_id, Venta_id)
VALUES (1, 'http1', 0, 'venta de dispensadoras', 'Venta para una empresa en Puno', '2022-06-15', 1, NULL);

INSERT INTO documento (idDocumento, url, tipo, titulo, descripcion, fechaAñadido, Compra_id, Venta_id)
VALUES (2, 'http2', 0, 'compra de snacks', 'Compra de snacks', '2023-06-15', 2, NULL);

INSERT INTO documento (idDocumento, url, tipo, titulo, descripcion, fechaAñadido, Compra_id, Venta_id)
VALUES (3, 'http3', 1, 'compra de snacks', 'Compra de snacks', '2023-06-15', NULL, 3);

INSERT INTO documento (idDocumento, url, tipo, titulo, descripcion, fechaAñadido, Compra_id, Venta_id)
VALUES (4, 'http2', 0, 'compra de snacks', 'Compra de snacks', '2023-06-15', 4, NULL);


--SELECT DE PRUEBA


-- SELECT para la tabla Usuario
SELECT * FROM Usuario;

-- SELECT para la tabla CategoriaUsuario
SELECT * FROM CategoriaUsuario;

-- SELECT para la tabla Color
SELECT * FROM Color;

-- SELECT para la tabla Compra
SELECT * FROM Compra;

-- SELECT para la tabla Compra_Producto
SELECT * FROM Compra_Producto;

-- SELECT para la tabla Cotización
SELECT * FROM Cotización;

-- SELECT para la tabla Departamento
SELECT * FROM Departamento;

-- SELECT para la tabla Documento
SELECT * FROM Documento;

-- SELECT para la tabla Empleado
SELECT * FROM Empleado;

-- SELECT para la tabla Empresa
SELECT * FROM Empresa;

-- SELECT para la tabla Estado_Pedido
SELECT * FROM Estado_Pedido;

-- SELECT para la tabla Estado_Transaccion
SELECT * FROM Estado_Transaccion;

-- SELECT para la tabla EstadoDePago
SELECT * FROM EstadoDePago;

-- SELECT para la tabla Metodo_Pago
SELECT * FROM Metodo_Pago;

-- SELECT para la tabla NivelEducativo
SELECT * FROM NivelEducativo;

-- SELECT para la tabla Pedido
SELECT * FROM Pedido;

-- SELECT para la tabla Pedido_Empleado
SELECT * FROM Pedido_Empleado;

-- SELECT para la tabla Producto
SELECT * FROM Producto;

-- SELECT para la tabla Producto_Cotizacion
SELECT * FROM Producto_Cotizacion;

-- SELECT para la tabla Rol
SELECT * FROM Rol;

-- SELECT para la tabla Sexo
SELECT * FROM Sexo;

-- SELECT para la tabla tipoContrato
SELECT * FROM tipoContrato;

-- SELECT para la tabla Ubicación
SELECT * FROM Ubicación;

-- SELECT para la tabla Vehiculo
SELECT * FROM Vehiculo;

-- SELECT para la tabla Vehiculo_Color
SELECT * FROM Vehiculo_Color;

-- SELECT para la tabla Venta
SELECT * FROM Venta;