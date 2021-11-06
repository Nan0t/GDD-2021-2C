USE [GD2C2021]
GO

--ME FIJO SI EXISTE LA TABLA, EN CASO DE EXISTIR HAGO UN DROP Y LUEGO LA CREO (POR SI METEMOS CAMBIOS)
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SQL_NOOBS].BI_dimension_recorrido') AND type = 'U')
	DROP TABLE [SQL_NOOBS].BI_dimension_recorrido
	GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SQL_NOOBS].BI_dimension_tipo_paquete') AND type = 'U')
	DROP TABLE [SQL_NOOBS].BI_dimension_tipo_paquete
	GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SQL_NOOBS].BI_dimension_paquete') AND type = 'U')
	DROP TABLE [SQL_NOOBS].BI_dimension_paquete
	GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SQL_NOOBS].BI_dimension_chofer') AND type = 'U')
	DROP TABLE [SQL_NOOBS].BI_dimension_chofer
	GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SQL_NOOBS].BI_dimension_modelo') AND type = 'U')
	DROP TABLE [SQL_NOOBS].BI_dimension_modelo
	GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SQL_NOOBS].BI_dimension_camion') AND type = 'U')
	DROP TABLE [SQL_NOOBS].BI_dimension_camion
	GO

--DROP DE SP SI EXISTEN (POR SI SE HACEN CAMBIOS) 
IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[SQL_NOOBS].[insert_BI_dimension_recorrido]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE SQL_NOOBS.insert_BI_dimension_recorrido
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[SQL_NOOBS].[insert_BI_dimension_tipo_paquete]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE SQL_NOOBS.insert_BI_dimension_tipo_paquete
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[SQL_NOOBS].[insert_BI_dimension_paquete]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE SQL_NOOBS.insert_BI_dimension_paquete
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[SQL_NOOBS].[insert_BI_dimension_chofer]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE SQL_NOOBS.insert_BI_dimension_chofer
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[SQL_NOOBS].[insert_BI_dimension_modelo]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE SQL_NOOBS.insert_BI_dimension_modelo
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[SQL_NOOBS].[insert_BI_dimension_camion]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE SQL_NOOBS.insert_BI_dimension_camion
GO


--CREACION DE TABLAS

CREATE TABLE SQL_NOOBS.BI_dimension_recorrido(
	recorrido_id int PRIMARY KEY,
	origen nvarchar(255) NULL,
	destino nvarchar(255) NULL,
	precio decimal (18,2) NULL,
	kilometros int NULL
)
GO

CREATE TABLE SQL_NOOBS.BI_dimension_tipo_paquete(
	tipo_paquete_id int PRIMARY KEY,
	alto_max decimal (18,2) NULL,
	ancho_max decimal (18,2) NULL,
	largo_max decimal (18,2) NULL,
	peso_max decimal(18,2) NULL,
	descripcion_paquete nvarchar(255) NULL,
	precio decimal (18,2) NULL
)
GO

CREATE TABLE SQL_NOOBS.BI_dimension_paquete(
	paquete_id int PRIMARY KEY,
	precio decimal (18,2) NULL,
	cantidad int NULL
)
GO

CREATE TABLE SQL_NOOBS.BI_dimension_chofer(
	dni decimal (18,0) PRIMARY KEY,
	nombre nvarchar (255) NULL,
	apellido nvarchar(255) NULL,
	telefono int NULL,
	mail nvarchar(255) NULL,
	fecha_nacimiento datetime2(3) NULL,
	legajo int NULL,
	costo_hora int NULL
)
GO

CREATE TABLE SQL_NOOBS.BI_dimension_modelo(
	modelo_id int PRIMARY KEY,
	velocidad_maxima int NULL,
	capacidad_tanque int NULL,
	capacidad_carga int NULL,
	modelo nvarchar (255) NULL, 
	marca_camion nvarchar (255) NULL
)
GO

CREATE TABLE SQL_NOOBS.BI_dimension_camion(
	patente nvarchar(255) PRIMARY KEY,
	numero_chasis nvarchar(255) NULL,
	numero_motor nvarchar(255) NULL,
	fecha_alta datetime2(3) NULL
)
GO

-- CREACION DE SP

CREATE PROCEDURE SQL_NOOBS.insert_BI_dimension_recorrido
AS
BEGIN 
	INSERT INTO SQL_NOOBS.BI_dimension_recorrido (origen, destino, precio, kilometros)
		SELECT 
			DISTINCT (origen ,destino, precio, kilometros)
		FROM 
			SQL_NOOBS.recorrido
END
GO

CREATE PROCEDURE SQL_NOOBS.insert_BI_dimension_tipo_paquete
AS
BEGIN 
	INSERT INTO SQL_NOOBS.BI_dimension_tipo_paquete (alto_max, ancho_max, largo_max, peso_max, descripcion_paquete, precio)
		SELECT 
			DISTINCT (alto_max, ancho_max, largo_max, peso_max, descripcion_paquete, precio)
		FROM 
			SQL_NOOBS.tipo_paquete
END
GO

CREATE PROCEDURE SQL_NOOBS.insert_BI_dimension_paquete
AS
BEGIN 
	INSERT INTO SQL_NOOBS.BI_dimension_paquete (precio, cantidad)
		SELECT 
			DISTINCT (precio, cantidad)
		FROM 
			SQL_NOOBS.paquete
END
GO

CREATE PROCEDURE SQL_NOOBS.insert_BI_dimension_chofer
AS
BEGIN 
	INSERT INTO SQL_NOOBS.BI_dimension_chofer (nombre, apellido, direccion, telefono, mail, fecha_nacimiento, legajo, costo_hora)
		SELECT 
			DISTINCT (nombre, apellido, direccion, telefono, mail, fecha_nacimiento, legajo, costo_hora)
		FROM 
			SQL_NOOBS.chofer
END
GO

CREATE PROCEDURE SQL_NOOBS.insert_BI_dimension_modelo
AS
BEGIN 
	INSERT INTO SQL_NOOBS.BI_dimension_modelo (velocidad_maxima, capacidad_tanque, capacidad_carga, modelo, marca_camion)
		SELECT 
			DISTINCT (velocidad_maxima, capacidad_tanque, capacidad_carga, modelo, marca_camion)
		FROM 
			SQL_NOOBS.modelo
END
GO

CREATE PROCEDURE SQL_NOOBS.insert_BI_dimension_camion
AS
BEGIN 
	INSERT INTO SQL_NOOBS.BI_dimension_camion (numero_chasis, numero_motor, fecha_alta)
		SELECT 
			DISTINCT ((numero_chasis, numero_motor, fecha_alta)
		FROM 
			SQL_NOOBS.camion
END
GO