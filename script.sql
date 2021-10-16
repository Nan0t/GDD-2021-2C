USE [GD2C2021]
GO

IF NOT EXISTS ( SELECT * FROM sys.schemas WHERE name = 'SQL_NOOBS')
BEGIN
	EXECUTE('CREATE SCHEMA SQL_NOOBS')
END
GO


--DROP DE TABLAS SI EXISTEN
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

--DROP DE SP SI EXISTEN (POR SI SE HACEN CAMBIOS)
IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[SQL_NOOBS].[insert_orden_trabajo]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE SQL_NOOBS.insert_orden_trabajo
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[SQL_NOOBS].[insert_camion]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE SQL_NOOBS.insert_camion
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[SQL_NOOBS].[insert_mecanico]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE SQL_NOOBS.insert_mecanico
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[SQL_NOOBS].[insert_taller]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE SQL_NOOBS.insert_taller
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[SQL_NOOBS].[insert_modelo]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE SQL_NOOBS.insert_modelo
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[SQL_NOOBS].[insert_tipo_tarea]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE SQL_NOOBS.insert_tipo_tarea
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[SQL_NOOBS].[insert_recorrido]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE SQL_NOOBS.insert_recorrido
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[SQL_NOOBS].[insert_tipo_paquete]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE SQL_NOOBS.insert_tipo_paquete
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[SQL_NOOBS].[insert_chofer]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE SQL_NOOBS.insert_chofer
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[SQL_NOOBS].[insert_material]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [SQL_NOOBS].insert_material
GO

-- CREACION DE TABLAS
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

-- CREACION DE SP

CREATE PROCEDURE SQL_NOOBS.insert_material
AS
BEGIN 
	INSERT INTO SQL_NOOBS.material (cod, descripcion, precio)
		SELECT 
			DISTINCT MATERIAL_COD, MATERIAL_DESCRIPCION, MATERIAL_PRECIO
		FROM 
			gd_esquema.Maestra
		WHERE MATERIAL_COD IS NOT NULL
END
GO


CREATE PROCEDURE SQL_NOOBS.insert_chofer
AS
BEGIN 
	INSERT INTO SQL_NOOBS.chofer (dni, nombre, apellido, direccion, telefono, mail, fecha_nacimiento, legajo, costo_hora)
		SELECT 
			DISTINCT CHOFER_DNI,
			CHOFER_NOMBRE, 
			CHOFER_APELLIDO,
			CHOFER_DIRECCION,
			CHOFER_TELEFONO,
			CHOFER_MAIL,
			CHOFER_FECHA_NAC,
			CHOFER_NRO_LEGAJO,
			CHOFER_COSTO_HORA
		FROM 
			gd_esquema.Maestra
		WHERE 
			CHOFER_DNI IS NOT NULL
END
GO


CREATE PROCEDURE SQL_NOOBS.insert_tipo_paquete
AS
BEGIN 
	INSERT INTO SQL_NOOBS.tipo_paquete (alto_max, ancho_max, largo_max, peso_max, descripcion_paquete, precio)
		SELECT 
			DISTINCT PAQUETE_ALTO_MAX,
			PAQUETE_ANCHO_MAX,
			PAQUETE_LARGO_MAX,
			PAQUETE_PESO_MAX,
			PAQUETE_DESCRIPCION,
			PAQUETE_PRECIO
		FROM 
			gd_esquema.Maestra
		WHERE 
			PAQUETE_ALTO_MAX IS NOT NULL
END
GO


CREATE PROCEDURE SQL_NOOBS.insert_recorrido
AS
BEGIN 
	INSERT INTO SQL_NOOBS.recorrido (origen, destino, precio, kilometros)
		SELECT 
			DISTINCT RECORRIDO_CIUDAD_ORIGEN,
			RECORRIDO_CIUDAD_DESTINO,
			RECORRIDO_PRECIO,
			RECORRIDO_KM
		FROM 
			gd_esquema.Maestra
		WHERE 
			RECORRIDO_CIUDAD_ORIGEN IS NOT NULL
END
GO


CREATE PROCEDURE SQL_NOOBS.insert_tipo_tarea
AS
BEGIN 
	INSERT INTO SQL_NOOBS.tipo_tarea (tipo_tarea_descripcion)
		SELECT 
			DISTINCT TIPO_TAREA
		FROM 
			gd_esquema.Maestra
		WHERE 
			TIPO_TAREA IS NOT NULL
END
GO


CREATE PROCEDURE SQL_NOOBS.insert_modelo
AS
BEGIN 
	INSERT INTO SQL_NOOBS.modelo (velocidad_maxima,capacidad_tanque,capacidad_carga,modelo,marca_camion)
		SELECT 
			DISTINCT MODELO_VELOCIDAD_MAX,
			MODELO_CAPACIDAD_TANQUE,
			MODELO_CAPACIDAD_CARGA,
			MODELO_CAMION,
			MARCA_CAMION_MARCA
		FROM 
			gd_esquema.Maestra
		WHERE 
			MODELO_CAMION IS NOT NULL
END
GO


CREATE PROCEDURE SQL_NOOBS.insert_taller
AS
BEGIN 
	INSERT INTO SQL_NOOBS.taller (nombre, mail, telefono, direccion, ciudad)
		SELECT 
			DISTINCT TALLER_NOMBRE, 
			TALLER_MAIL,
			TALLER_TELEFONO, 
			TALLER_DIRECCION, 
			TALLER_CIUDAD
		FROM 
			gd_esquema.Maestra
		WHERE 
			TALLER_NOMBRE IS NOT NULL
END
GO

CREATE PROCEDURE SQL_NOOBS.insert_mecanico
AS
BEGIN 
	INSERT INTO SQL_NOOBS.mecanico (dni, nombre, apellido, direccion, telefono, mail, fecha_nacimiento, legajo, costo_hora, taller_id)
		SELECT 
			DISTINCT MECANICO_DNI,
			MECANICO_NOMBRE, 
			MECANICO_APELLIDO,
			MECANICO_DIRECCION,
			MECANICO_TELEFONO,
			MECANICO_MAIL,
			MECANICO_FECHA_NAC,
			MECANICO_NRO_LEGAJO,
			MECANICO_COSTO_HORA,
			taller.id
		FROM 
			gd_esquema.Maestra maestra
			JOIN SQL_NOOBS.taller taller
				ON maestra.TALLER_NOMBRE = taller.nombre 
					AND maestra.TALLER_MAIL = taller.mail
					AND maestra.TALLER_TELEFONO = taller.telefono
					AND maestra.TALLER_DIRECCION = taller.direccion
					AND maestra.TALLER_CIUDAD = taller.ciudad
		WHERE 
			MECANICO_DNI IS NOT NULL
END
GO

CREATE PROCEDURE SQL_NOOBS.insert_camion
AS
BEGIN 
	INSERT INTO SQL_NOOBS.camion(patente, modelo_id, numero_chasis, numero_motor, fecha_alta)
		SELECT 
			DISTINCT CAMION_PATENTE,
			modelo.id,
			CAMION_NRO_CHASIS,
			CAMION_NRO_MOTOR,
			CAMION_FECHA_ALTA
		FROM 
			gd_esquema.Maestra maestra
			JOIN SQL_NOOBS.modelo modelo
				ON maestra.MODELO_VELOCIDAD_MAX = modelo.velocidad_maxima
					AND maestra.MODELO_CAPACIDAD_TANQUE = modelo.capacidad_tanque
					AND maestra.MODELO_CAPACIDAD_CARGA = modelo.capacidad_carga
					AND maestra.MODELO_CAMION = modelo.modelo
					AND maestra.MARCA_CAMION_MARCA = modelo.marca_camion
		WHERE 
			CAMION_PATENTE IS NOT NULL
END
GO

CREATE PROCEDURE SQL_NOOBS.insert_orden_trabajo
AS
BEGIN 
	INSERT INTO SQL_NOOBS.orden_trabajo(camion_id, fecha, estado)
		SELECT 
			DISTINCT camion.patente,
			ORDEN_TRABAJO_FECHA,
			ORDEN_TRABAJO_ESTADO
		FROM 
			gd_esquema.Maestra maestra
			JOIN SQL_NOOBS.camion camion
				ON maestra.CAMION_PATENTE = camion.patente
		WHERE 
			ORDEN_TRABAJO_FECHA IS NOT NULL
			AND ORDEN_TRABAJO_ESTADO IS NOT NULL
END
GO

--EJECUCION DE SP

EXEC [SQL_NOOBS].insert_material
EXEC [SQL_NOOBS].insert_chofer
EXEC [SQL_NOOBS].insert_tipo_paquete
EXEC [SQL_NOOBS].insert_recorrido
EXEC [SQL_NOOBS].insert_tipo_tarea
EXEC [SQL_NOOBS].insert_modelo
EXEC [SQL_NOOBS].insert_taller
EXEC [SQL_NOOBS].insert_mecanico
EXEC [SQL_NOOBS].insert_camion
EXEC [SQL_NOOBS].insert_orden_trabajo