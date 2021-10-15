USE [GD2C2021]
GO

IF NOT EXISTS ( SELECT * FROM sys.schemas WHERE name = 'SQL_NOOBS')
BEGIN
	EXECUTE('CREATE SCHEMA SQL_NOOBS')
END
GO


--ME FIJO SI EXISTE LA TABLA, EN CASO DE NO EXISTIR HAGO UN DROP Y LUEGO LA CREO (POR SI METEMOS CAMBIOS)
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SQL_NOOBS].camion') AND type = 'U')
	DROP TABLE [SQL_NOOBS].camion
	GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SQL_NOOBS].tareaXmaterial') AND type = 'U')
	DROP TABLE [SQL_NOOBS].tareaXmaterial
	GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SQL_NOOBS].mecanico') AND type = 'U')
	DROP TABLE [SQL_NOOBS].mecanico
	GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SQL_NOOBS].tarea') AND type = 'U')
	DROP TABLE [SQL_NOOBS].tarea
	GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SQL_NOOBS].material') AND type = 'U')
	DROP TABLE [SQL_NOOBS].material
	GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SQL_NOOBS].tipo_tarea') AND type = 'U')
	DROP TABLE [SQL_NOOBS].tipo_tarea
	GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SQL_NOOBS].taller') AND type = 'U')
	DROP TABLE [SQL_NOOBS].taller
	GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SQL_NOOBS].modelo') AND type = 'U')
	DROP TABLE [SQL_NOOBS].modelo
	GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SQL_NOOBS].recorrido') AND type = 'U')
	DROP TABLE [SQL_NOOBS].recorrido
	GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SQL_NOOBS].chofer') AND type = 'U')
	DROP TABLE [SQL_NOOBS].chofer
	GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SQL_NOOBS].tipo_paquete') AND type = 'U')
	DROP TABLE [SQL_NOOBS].tipo_paquete
	GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SQL_NOOBS].tarea') AND type = 'U')
	DROP TABLE [SQL_NOOBS].tarea
	GO


CREATE TABLE SQL_NOOBS.material (
	cod nvarchar(100) NOT NULL PRIMARY KEY,
	descripcion nvarchar(255) NULL,
	precio decimal(18,2) NULL
)
GO

	
CREATE TABLE SQL_NOOBS.tipo_tarea (
	id int NOT NULL IDENTITY(1, 1) PRIMARY KEY,  --IDENTITY se usa para autoincrementar el valor de id al agregar nuevas filas
	tipo_tarea_descripcion nvarchar(255) NULL
)
GO
	
CREATE TABLE SQL_NOOBS.taller (
	id int NOT NULL IDENTITY(1, 1) PRIMARY KEY,  
	nombre nvarchar(255) NULL,
	mail nvarchar(255) NULL,
	telefono decimal(18,0) NULL,
	direccion nvarchar(255) NULL,
	ciudad nvarchar(255) NULL
)
GO

	
CREATE TABLE SQL_NOOBS.modelo (
	id int NOT NULL IDENTITY(1, 1) PRIMARY KEY,  
	velocidad_maxima int NULL,
	capacidad_tanque int NULL,
	capacidad_carga int NULL,
	modelo nvarchar(255) NULL,
	marca_camion nvarchar(255) NULL
)
GO
	
CREATE TABLE SQL_NOOBS.recorrido (
	id int NOT NULL IDENTITY(1, 1) PRIMARY KEY,  
	origen nvarchar(255) NULL,
	destino nvarchar(255) NULL,
	precio nvarchar(255) NULL,
	kilometros int NULL,
	combustible decimal(18,2) NULL
)
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
GO

CREATE TABLE SQL_NOOBS.tipo_paquete (
	id int NOT NULL IDENTITY(1, 1) PRIMARY KEY,  
	alto_max decimal(18,2) NULL,
	ancho_max decimal(18,2) NULL,
	largo_max decimal(18,2) NULL,
	peso_max decimal(18,2) NULL,
	descripcion_paquete nvarchar(255) NULL,
	precio decimal(18,2) NULL
)
GO

CREATE TABLE SQL_NOOBS.tarea (
	codigo int NOT NULL PRIMARY KEY,  
	tiempo_estimado_dias int NULL,
	descripcion_tarea nvarchar(255) NULL,
	tipo_tarea_id int FOREIGN KEY
	REFERENCES [SQL_NOOBS].tipo_tarea(id)
	ON DELETE CASCADE
	ON UPDATE CASCADE
)
GO

CREATE TABLE SQL_NOOBS.mecanico (
	dni decimal(18,0) NOT NULL PRIMARY KEY,  
	nombre nvarchar(255) NULL,
	apellido nvarchar(255) NULL,
	direccion nvarchar(255) NULL,
	telefono int NULL,
	mail nvarchar(255) NULL,
	fecha_nacimiento datetime2(3) NULL,
	legajo int NULL,
	costo_hora int NULL,
	taller_id int FOREIGN KEY 
	REFERENCES [SQL_NOOBS].taller(id)
	ON DELETE CASCADE
	ON UPDATE CASCADE
)
GO

CREATE TABLE SQL_NOOBS.tareaXmaterial (
	tarea_id int FOREIGN KEY
	REFERENCES [SQL_NOOBS].tarea(codigo)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	material_id nvarchar(100) FOREIGN KEY
	REFERENCES [SQL_NOOBS].material(cod)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	cantidad_material int NULL
)
GO

CREATE TABLE SQL_NOOBS.camion (
	patente nvarchar(255) NOT NULL PRIMARY KEY,
	modelo_id int FOREIGN KEY
	REFERENCES [SQL_NOOBS].modelo(id)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	numero_chasis nvarchar(255) NULL,
	numero_motor nvarchar(255) NULL,
	fecha_alta datetime2(3) NULL
)
GO