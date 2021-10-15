USE [GD2C2021]
GO

IF NOT EXISTS ( SELECT * FROM sys.schemas WHERE name = 'SQL_NOOBS')
BEGIN
	EXECUTE('CREATE SCHEMA SQL_NOOBS')
END
GO


--ME FIJO SI EXISTE LA TABLA, EN CASO DE NO EXISTIR HAGO UN DROP Y LUEGO LA CREO (POR SI METEMOS CAMBIOS)
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SQL_NOOBS].material') AND type = 'U')
	DROP TABLE [SQL_NOOBS].material
	GO


CREATE TABLE SQL_NOOBS.material (
	cod nvarchar(100) NOT NULL PRIMARY KEY,
	descripcion nvarchar(255) NULL,
	precio decimal(18,2) NULL
)


IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SQL_NOOBS].tipo_tarea') AND type = 'U')
	DROP TABLE [SQL_NOOBS].tipo_tarea
	GO

	
CREATE TABLE SQL_NOOBS.tipo_tarea (
	id int NOT NULL IDENTITY PRIMARY KEY,  --IDENTITY se usa para autoincrementar el valor de id al agregar nuevas filas
	tipo_tarea_descripcion nvarchar(255) NULL
)

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SQL_NOOBS].taller') AND type = 'U')
	DROP TABLE [SQL_NOOBS].taller
	GO

	
CREATE TABLE SQL_NOOBS.taller (
	id int NOT NULL IDENTITY PRIMARY KEY,  
	nombre nvarchar(255) NULL,
	mail nvarchar(255) NULL,
	telefono decimal(18,0) NULL,
	direccion nvarchar(255) NULL,
	ciudad nvarchar(255) NULL
)

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SQL_NOOBS].modelo') AND type = 'U')
	DROP TABLE [SQL_NOOBS].modelo
	GO

	
CREATE TABLE SQL_NOOBS.modelo (
	id int NOT NULL IDENTITY PRIMARY KEY,  
	velocidad_maxima int NULL,
	capacidad_tanque int NULL,
	capacidad_carga int NULL,
	modelo nvarchar(255) NULL,
	marca_camion nvarchar(255) NULL
)

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SQL_NOOBS].recorrido') AND type = 'U')
	DROP TABLE [SQL_NOOBS].recorrido
	GO

	
CREATE TABLE SQL_NOOBS.recorrido (
	id int NOT NULL IDENTITY PRIMARY KEY,  
	origen nvarchar(255) NULL,
	destino nvarchar(255) NULL,
	precio nvarchar(255) NULL,
	kilometros int NULL,
	combustible decimal(18,2) NULL
)


IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SQL_NOOBS].chofer') AND type = 'U')
	DROP TABLE [SQL_NOOBS].chofer
	GO

CREATE TABLE SQL_NOOBS.chofer (
	dni decimal(18,0) NOT NULL PRIMARY KEY,  
	nombre nvarchar(255) NULL,
	apellido nvarchar(255) NULL,
	direccion nvarchar(255) NULL,
	telefono int NULL,
	mail nvarchar(255) NULL,
	fecha_nacimiento datetime2(3) NULL,
	legajo int NULL,
	costo_hora int NULL
)

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SQL_NOOBS].tipo_paquete') AND type = 'U')
	DROP TABLE [SQL_NOOBS].tipo_paquete
	GO

CREATE TABLE SQL_NOOBS.tipo_paquete (
	id int NOT NULL IDENTITY PRIMARY KEY,  
	alto_max decimal(18,2) NULL,
	ancho_max decimal(18,2) NULL,
	largo_max decimal(18,2) NULL,
	peso_max decimal(18,2) NULL,
	descripcion_paquete nvarchar(255) NULL,
	precio decimal(18,2) NULL
)