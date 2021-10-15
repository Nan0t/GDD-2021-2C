USE [GD2C2021]
GO

IF NOT EXISTS ( SELECT * FROM sys.schemas WHERE name = 'SQL_NOOBS')
BEGIN
	EXECUTE('CREATE SCHEMA SQL_NOOBS')
END
GO


--ME FIJO SI EXISTE LA TABLA, EN CASO DE NO EXISTIR HAGO UN DROP Y LUEGO LA CREO (POR SI METEMOS CAMBIOS)
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SQL_NOOBS].paquete') AND type = 'U')
	DROP TABLE [SQL_NOOBS].paquete
	GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SQL_NOOBS].viaje') AND type = 'U')
	DROP TABLE [SQL_NOOBS].viaje
	GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SQL_NOOBS].tareaXorden_trabajo') AND type = 'U')
	DROP TABLE [SQL_NOOBS].tareaXorden_trabajo
	GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SQL_NOOBS].orden_trabajo') AND type = 'U')
	DROP TABLE [SQL_NOOBS].orden_trabajo
	GO

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

CREATE TABLE SQL_NOOBS.orden_trabajo (
	id INT NOT NULL PRIMARY KEY IDENTITY(1, 1),
	camion_id nvarchar(255) FOREIGN KEY
	REFERENCES [SQL_NOOBS].camion(patente)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	fecha nvarchar(255) NULL,
	estado nvarchar(255) NULL
)
GO

CREATE TABLE SQL_NOOBS.tareaXorden_trabajo (
	tarea_id int FOREIGN KEY
	REFERENCES [SQL_NOOBS].tarea(codigo)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	orden_trabajo_id int FOREIGN KEY
	REFERENCES [SQL_NOOBS].orden_trabajo(id)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	macanico_dni decimal(18,0) FOREIGN KEY
	REFERENCES [SQL_NOOBS].mecanico(dni)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	fecha_inicio_real datetime2(3) NULL,
	tiempo_real_dias int NULL,
	fecha_fin_real datetime2(3) NULL,
	fecha_inicio_planificado datetime2(3) NULL

)
GO

CREATE TABLE SQL_NOOBS.viaje (
	id int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	camion_id nvarchar(255) FOREIGN KEY
	REFERENCES [SQL_NOOBS].camion(patente)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	chofer_id decimal(18,0) FOREIGN KEY
	REFERENCES [SQL_NOOBS].chofer(dni)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	recorrido_id int FOREIGN KEY
	REFERENCES [SQL_NOOBS].recorrido(id)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	fecha_inicio datetime2(7) NULL,
	fecha_fin datetime2(3) NULL,
	consumo_combustible decimal(18,2) NULL

)
GO

CREATE TABLE SQL_NOOBS.paquete (
	id int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	tipo_paquete_id int FOREIGN KEY
	REFERENCES [SQL_NOOBS].tipo_paquete(id)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	viaje_id int FOREIGN KEY
	REFERENCES [SQL_NOOBS].viaje(id)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	precio decimal(18,2) NULL,
	cantidad int NULL

)
GO