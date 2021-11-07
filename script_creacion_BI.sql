USE [GD2C2021]
GO

--ME FIJO SI EXISTE LA TABLA, EN CASO DE EXISTIR HAGO UN DROP Y LUEGO LA CREO (POR SI METEMOS CAMBIOS)
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SQL_NOOBS].BI_tareaXmaterial') AND type = 'U')
	DROP TABLE [SQL_NOOBS].BI_tareaXmaterial
	GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SQL_NOOBS].BI_dimension_tarea') AND type = 'U')
	DROP TABLE [SQL_NOOBS].BI_dimension_tarea
	GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SQL_NOOBS].BI_dimension_material') AND type = 'U')
	DROP TABLE [SQL_NOOBS].BI_dimension_material
	GO


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

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SQL_NOOBS].BI_dimension_tiempo') AND type = 'U')
	DROP TABLE [SQL_NOOBS].BI_dimension_tiempo
	GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SQL_NOOBS].BI_dimensiones_taller') AND type = 'U')
	DROP TABLE [SQL_NOOBS].BI_dimensiones_taller
	GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SQL_NOOBS].BI_dimensiones_tipo_tarea') AND type = 'U')
	DROP TABLE [SQL_NOOBS].BI_dimensiones_tipo_tarea
	GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SQL_NOOBS].BI_dimensiones_mecanico') AND type = 'U')
	DROP TABLE [SQL_NOOBS].BI_dimensiones_mecanico
	GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SQL_NOOBS].BI_dimensiones_orden_trabajo') AND type = 'U')
	DROP TABLE [SQL_NOOBS].BI_dimensiones_orden_trabajo
	GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SQL_NOOBS].BI_dimensiones_marca_camion') AND type = 'U')
	DROP TABLE [SQL_NOOBS].BI_dimensiones_marca_camion
	GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SQL_NOOBS].BI_rango_edad') AND type = 'U')
	DROP TABLE [SQL_NOOBS].BI_rango_edad
	GO


IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SQL_NOOBS].BI_hechos_viajes') AND type = 'U')
	DROP TABLE [SQL_NOOBS].BI_hechos_viajes
	GO

IF object_id(N'SQL_NOOBS.fn_BI_buscar_pk_rango', N'FN') IS NOT NULL
    DROP FUNCTION SQL_NOOBS.fn_BI_buscar_pk_rango
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

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[SQL_NOOBS].[insert_BI_dimension_material]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE SQL_NOOBS.insert_BI_dimension_material
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[SQL_NOOBS].[insert_BI_dimension_tarea]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE SQL_NOOBS.insert_BI_dimension_tarea
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[SQL_NOOBS].[insert_BI_tareaXmaterial]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE SQL_NOOBS.insert_BI_tareaXmaterial
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[SQL_NOOBS].[insert_BI_dimension_tiempo]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE SQL_NOOBS.insert_BI_dimension_tiempo
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[SQL_NOOBS].[insert_BI_rango_edad]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE SQL_NOOBS.insert_BI_rango_edad
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[SQL_NOOBS].[insert_BI_dimension_taller]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE SQL_NOOBS.insert_BI_dimension_taller
GO
IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[SQL_NOOBS].[insert_BI_dimension_mecanico]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE SQL_NOOBS.insert_BI_dimension_mecanico
GO
IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[SQL_NOOBS].[insert_BI_dimension_orden_trabajo]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE SQL_NOOBS.insert_BI_dimension_orden_trabajo
GO
IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[SQL_NOOBS].[insert_BI_dimension_tipo_tarea]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE SQL_NOOBS.insert_BI_dimension_tipo_tarea
GO
IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[SQL_NOOBS].[insert_BI_tipo_tarea]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE SQL_NOOBS.insert_BI_tipo_tarea
GO

IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[SQL_NOOBS].[insert_BI_dimension_marca_camion]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE SQL_NOOBS.insert_BI_dimension_marca_camion
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
CREATE TABLE SQL_NOOBS.BI_dimension_tiempo (
	id int NOT NULL IDENTITY(1, 1) PRIMARY KEY,  
    cuatrimestre int NOT NULL,
    Año int NOT NULL
)
GO

CREATE TABLE SQL_NOOBS.BI_dimension_material (
	cod nvarchar(100) NOT NULL PRIMARY KEY,
	descripcion nvarchar(255) NULL,
	precio decimal(18,2) NULL
)
GO

CREATE TABLE SQL_NOOBS.BI_dimension_tarea (
	codigo int NOT NULL PRIMARY KEY,  
	tiempo_estimado_dias int NULL,
	descripcion_tarea nvarchar(255) NULL,
    costo decimal(10,2) NULL
)
GO

CREATE TABLE SQL_NOOBS.BI_tareaXmaterial (
	tarea_id int FOREIGN KEY
	REFERENCES [SQL_NOOBS].BI_dimension_tarea(codigo)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	material_id nvarchar(100) FOREIGN KEY
	REFERENCES [SQL_NOOBS].BI_dimension_material(cod)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	cantidad_material int NULL
)
GO

CREATE TABLE SQL_NOOBS.BI_rango_edad (
	id int IDENTITY(1, 1) PRIMARY KEY,
    rango nvarchar(30) NULL
)
GO

CREATE TABLE SQL_NOOBS.BI_dimension_chofer(
	dni decimal (18,0) PRIMARY KEY,
	nombre nvarchar (255) NULL,
	apellido nvarchar(255) NULL,
	direccion nvarchar(255) NULL,
	telefono int NULL,
	mail nvarchar(255) NULL,
	fecha_nacimiento datetime2(3) NULL,
	legajo int NULL,
	costo_hora int NULL,
	rango_edad_id int FOREIGN KEY
	REFERENCES [SQL_NOOBS].BI_rango_edad(id)
	ON DELETE CASCADE
	ON UPDATE CASCADE
)
GO
CREATE TABLE SQL_NOOBS.BI_dimensiones_taller (
	taller_id int NOT NULL IDENTITY(1, 1) PRIMARY KEY,  
	nombre nvarchar(255) NULL,
	mail nvarchar(255) NULL,
	telefono decimal(18,0) NULL,
	direccion nvarchar(255) NULL,
	ciudad nvarchar(255) NULL
)
GO

CREATE TABLE SQL_NOOBS.BI_dimensiones_tipo_tarea (
	id int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	tipo_tarea_descripcion nvarchar(255) NULL
)
GO

CREATE TABLE SQL_NOOBS.BI_dimensiones_mecanico (
	dni decimal(18,0) NOT NULL PRIMARY KEY,  
	nombre nvarchar(255) NULL,
	apellido nvarchar(255) NULL,
	direccion nvarchar(255) NULL,
	telefono int NULL,
	mail nvarchar(255) NULL,
	fecha_nacimiento datetime2(3) NULL,
	legajo int NULL,
	costo_hora int NULL,
	rango_edad_id int FOREIGN KEY
	REFERENCES [SQL_NOOBS].BI_rango_edad(id)
	ON DELETE CASCADE
	ON UPDATE CASCADE
)
GO


CREATE TABLE SQL_NOOBS.BI_dimensiones_orden_trabajo (
	orden_trabajo_id INT NOT NULL PRIMARY KEY IDENTITY(1, 1),
	fecha nvarchar(255) NULL,
	estado nvarchar(255) NULL
)
GO

CREATE TABLE SQL_NOOBS.BI_dimensiones_marca_camion (
	id INT NOT NULL PRIMARY KEY IDENTITY(1, 1),
	descripcion nvarchar(255) NULL
)
GO

-- CREACION FUNCIONES 

CREATE TABLE SQL_NOOBS.BI_hechos_viajes(
 dni decimal (18, 0) REFERENCES SQL_NOOBS.BI_dimension_chofer,
 recorrido_id int REFERENCES SQL_NOOBS.BI_dimension_recorrido,
 tipo_paquete_id int REFERENCES SQL_NOOBS.BI_dimension_tipo_paquete,
 modelo_id int REFERENCES SQL_NOOBS.BI_dimension_modelo,
 tiempo_id int REFERENCES SQL_NOOBS.BI_dimension_tiempo,
 fecha_inicio datetime2(7)  ,
 fecha_fin datetime2(3),
 patente nvarchar(255) REFERENCES SQL_NOOBS.BI_dimension_camion,
 consumo_combustible decimal (18, 2) NULL,
 PRIMARY KEY (dni, recorrido_id,tipo_paquete_id,modelo_id,tiempo_id,patente,fecha_inicio,fecha_fin)
)
GO


CREATE FUNCTION SQL_NOOBS.fn_BI_buscar_pk_rango  (@diferencia_edad AS int)
RETURNS int
AS
BEGIN
	RETURN 
	(SELECT
	CASE
		WHEN @diferencia_edad BETWEEN 18 AND 30 THEN (SELECT id FROM BI_rango_edad WHERE rango LIKE '18 - 30 años' )
		WHEN @diferencia_edad BETWEEN 31 AND 50 THEN (SELECT id FROM BI_rango_edad WHERE rango LIKE '31 – 50 años' )
		ELSE (SELECT id FROM BI_rango_edad WHERE rango LIKE '> 50 años' )
	END
	)
END
GO

-- CREACION DE SP
CREATE PROCEDURE SQL_NOOBS.insert_BI_dimension_material
AS
BEGIN
	INSERT INTO SQL_NOOBS.BI_dimension_material
		SELECT * FROM SQL_NOOBS.material 
END
GO

CREATE PROCEDURE SQL_NOOBS.insert_BI_dimension_tarea
AS
BEGIN
	INSERT INTO SQL_NOOBS.BI_dimension_tarea (codigo, tiempo_estimado_dias, descripcion_tarea)
		SELECT codigo, 
			tiempo_estimado_dias, 
			descripcion_tarea 
		FROM SQL_NOOBS.tarea
END
GO

CREATE PROCEDURE SQL_NOOBS.insert_BI_tareaXmaterial
AS
BEGIN
	INSERT INTO SQL_NOOBS.BI_tareaXmaterial
		SELECT * FROM SQL_NOOBS.tareaXmaterial
END
GO

CREATE PROCEDURE SQL_NOOBS.insert_BI_dimension_tiempo
AS
BEGIN
	INSERT INTO SQL_NOOBS.BI_dimension_tiempo
		SELECT 
			DISTINCT
			DATEPART(QUARTER, fecha_inicio) AS [cuatrimestre],
			YEAR(fecha_inicio) AS [Año]
		FROM SQL_NOOBS.viaje
		UNION
		SELECT
			DISTINCT
			DATEPART(QUARTER, fecha_inicio_real) AS [cuatrimestre],
			YEAR(fecha_inicio_real) AS [Año]
		FROM SQL_NOOBS.tareaXorden_trabajo
		UNION
		SELECT
			DISTINCT
			DATEPART(QUARTER, fecha_fin_real) AS [cuatrimestre],
			YEAR(fecha_fin_real) AS [Año]
		FROM SQL_NOOBS.tareaXorden_trabajo
		UNION
		SELECT 
			DISTINCT
			DATEPART(QUARTER, fecha) AS [cuatrimestre],
			YEAR(fecha) AS [Año]
		FROM SQL_NOOBS.orden_trabajo
		ORDER BY 1 ASC, 2 ASC
END
GO

CREATE PROCEDURE SQL_NOOBS.insert_BI_rango_edad
AS
BEGIN
	INSERT INTO SQL_NOOBS.BI_rango_edad (rango)
	VALUES
		('18 - 30 años'), 
		('31 – 50 años'), 
		('> 50 años')
END
GO

CREATE PROCEDURE SQL_NOOBS.insert_BI_dimension_recorrido
AS
BEGIN 
	INSERT INTO SQL_NOOBS.BI_dimension_recorrido (recorrido_id,origen, destino, precio, kilometros)
		SELECT 
			DISTINCT id, origen ,destino, precio, kilometros
		FROM 
			SQL_NOOBS.recorrido
END
GO

CREATE PROCEDURE SQL_NOOBS.insert_BI_dimension_tipo_paquete
AS
BEGIN 
	INSERT INTO SQL_NOOBS.BI_dimension_tipo_paquete
		SELECT 
			*
		FROM 
			SQL_NOOBS.tipo_paquete
END
GO

CREATE PROCEDURE SQL_NOOBS.insert_BI_dimension_paquete
AS
BEGIN 
	INSERT INTO SQL_NOOBS.BI_dimension_paquete (paquete_id, precio, cantidad)
		SELECT 
			id, precio, cantidad
		FROM 
			SQL_NOOBS.paquete
END
GO

CREATE PROCEDURE SQL_NOOBS.insert_BI_dimension_chofer
AS
BEGIN 
	INSERT INTO SQL_NOOBS.BI_dimension_chofer (dni, nombre, apellido, direccion, telefono, mail, fecha_nacimiento, legajo, costo_hora, rango_edad_id)
		SELECT dni,
			nombre,
			apellido, 
			direccion, 
			telefono, 
			mail, 
			fecha_nacimiento, 
			legajo, 
			costo_hora,
			SQL_NOOBS.fn_BI_buscar_pk_rango(DATEDIFF(year, fecha_nacimiento, GETDATE()))
		FROM 
			SQL_NOOBS.chofer
END
GO

CREATE PROCEDURE SQL_NOOBS.insert_BI_dimension_modelo
AS
BEGIN 
	INSERT INTO SQL_NOOBS.BI_dimension_modelo 
		SELECT *
		FROM 
			SQL_NOOBS.modelo
END
GO

CREATE PROCEDURE SQL_NOOBS.insert_BI_dimension_camion
AS
BEGIN 
	INSERT INTO SQL_NOOBS.BI_dimension_camion (patente, numero_chasis, numero_motor, fecha_alta)
		SELECT 
			DISTINCT patente, numero_chasis, numero_motor, fecha_alta
		FROM 
			SQL_NOOBS.camion
END
GO


CREATE PROCEDURE SQL_NOOBS.insert_BI_dimension_taller
AS
BEGIN
	INSERT INTO SQL_NOOBS.BI_dimensiones_taller (nombre,mail, telefono, direccion,ciudad)
		SELECT 
				nombre,
				mail, 
				telefono, 
				direccion,
				ciudad
		FROM 
				SQL_NOOBS.taller
END
GO

CREATE PROCEDURE SQL_NOOBS.insert_BI_dimension_mecanico
AS
BEGIN
	INSERT INTO SQL_NOOBS.BI_dimensiones_mecanico (dni,nombre,apellido,direccion,telefono,mail,fecha_nacimiento,legajo,costo_hora, rango_edad_id)
		SELECT 
				dni, 
				nombre, 
				apellido, 
				direccion, 
				telefono, 
				mail, 
				fecha_nacimiento, 
				legajo, 
				costo_hora,
				SQL_NOOBS.fn_BI_buscar_pk_rango(DATEDIFF(year, fecha_nacimiento, GETDATE()))
		FROM 
				SQL_NOOBS.mecanico
END
GO

CREATE PROCEDURE SQL_NOOBS.insert_BI_dimension_orden_trabajo
AS
BEGIN
	INSERT INTO SQL_NOOBS.BI_dimensiones_orden_trabajo(fecha,estado)
		SELECT DISTINCT
				fecha, 
				estado
		FROM 
				SQL_NOOBS.orden_trabajo
END
GO

CREATE PROCEDURE SQL_NOOBS.insert_BI_dimension_tipo_tarea
AS
BEGIN
	INSERT INTO SQL_NOOBS.BI_dimensiones_tipo_tarea (tipo_tarea_descripcion)
		SELECT 
				tipo_tarea_descripcion
		FROM 
				SQL_NOOBS.tipo_tarea
END
GO

CREATE PROCEDURE SQL_NOOBS.insert_BI_dimension_marca_camion
AS
BEGIN
	INSERT INTO SQL_NOOBS.BI_dimensiones_marca_camion (descripcion)
		SELECT 
				DISTINCT marca_camion
		FROM 
				SQL_NOOBS.modelo
END
GO


CREATE PROCEDURE SQL_NOOBS.insert_BI_hechos_viajes
AS
BEGIN
	INSERT INTO SQL_NOOBS.BI_hechos_viajes (dni,recorrido_id,tipo_paquete_id, modelo_id, 
				tiempo_id,fecha_inicio,v.fecha_fin, patente, consumo_combustible)
		SELECT v.chofer_id, v.recorrido_id, p.tipo_paquete_id, ca.modelo_id,
		(SELECT id FROM SQL_NOOBS.BI_dimension_tiempo bi_diti
			WHERE YEAR(v.fecha_inicio)=  bi_diti.Año AND 
			DATEPART(QUARTER, v.fecha_inicio) = bi_diti.cuatrimestre),v.fecha_inicio,v.fecha_fin,
			ca.patente,v.consumo_combustible
		from SQL_NOOBS.viaje v join SQL_NOOBS.paquete p on (v.id = p.viaje_id)
		join SQL_NOOBS.camion ca on (v.camion_id = ca.patente)
END
GO

EXEC SQL_NOOBS.insert_BI_dimension_tiempo
EXEC SQL_NOOBS.insert_BI_rango_edad
EXEC SQL_NOOBS.insert_BI_dimension_chofer
EXEC SQL_NOOBS.insert_BI_dimension_modelo
EXEC SQL_NOOBS.insert_BI_dimension_camion
EXEC SQL_NOOBS.insert_BI_dimension_tipo_paquete
EXEC SQL_NOOBS.insert_BI_dimension_paquete
EXEC SQL_NOOBS.insert_BI_dimension_recorrido
EXEC SQL_NOOBS.insert_BI_dimension_tarea
EXEC SQL_NOOBS.insert_BI_dimension_material
EXEC SQL_NOOBS.insert_BI_tareaXmaterial
EXEC SQL_NOOBS.insert_BI_dimension_taller
EXEC SQL_NOOBS.insert_BI_dimension_mecanico
EXEC SQL_NOOBS.insert_BI_dimension_orden_trabajo
EXEC SQL_NOOBS.insert_BI_dimension_tipo_tarea
EXEC SQL_NOOBS.insert_BI_dimension_marca_camion
EXEC SQL_NOOBS.insert_BI_hechos_viajes

