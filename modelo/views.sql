/*******************************************************************************
  Copyright 2014 Mediperbarica Todos los derechos reservados
  @autor: Eduardo Villota
  @date: 11-05-2016 23:44
  @version 0.2.16
 
 Introduccion: Definicion de consultas para obtener informacion no 
 son necesariamente vistas
/******************************************************************************/

-- -----------------------------------------------------------------------------
-- Consulta de listado de historias
-- -----------------------------------------------------------------------------
SELECT 
	hst.id_historia, 
	hst.id_paciente , 
	hst.nombres,
	(SELECT count(id_tratamiento) FROM tratamiento AS trt 
		WHERE trt.id_paciente = hst.id_paciente) AS `tratamientos`,
	hst.telefono, 
	hst.mail , 
	hst.nombre_referente ,
	timestampdiff(year,hst.fecha_nacimiento,curdate()) AS `edad`,
	concat(month(hst.creado), '-' , year(hst.creado)) as creado
	FROM historia AS hst Order by hst.nombres ASC;

-- -----------------------------------------------------------------------------
-- Consulta de listado de tratamientos
-- -----------------------------------------------------------------------------
SELECT
	trt.id_tratamiento,
	per.nombres as personal,
	hst.nombres as paciente,
	hst.telefono,
    trt.nro_sesiones,
		(SELECT count(id_sesion) 
			FROM sesion 
			WHERE id_tratamiento = trt.id_tratamiento) as sesiones_realizadas,
		(SELECT fecha 
			FROM sesion 
            WHERE id_tratamiento = trt.id_tratamiento 
            ORDER BY fecha DESC limit 1) as ultima_sesion,
        trt.costo,
		(SELECT SUM(valor) from cobro where id_factura = 
				(SELECT id_factura 
					from factura 
                    where id_tratamiento = trt.id_tratamiento )) as pagos
FROM tratamiento as trt
LEFT JOIN personal as per USING(id_personal)
LEFT JOIN historia as hst USING(id_paciente);

-- -----------------------------------------------------------------------------
-- Consulta de listado de personal
-- -----------------------------------------------------------------------------
SELECT
	trt.id_tratamiento,
	per.nombres as personal,
	hst.nombres as paciente,
	hst.mail,
	hst.telefono,
    trt.nro_sesiones,
		(SELECT count(id_sesion) 
			FROM sesion 
			WHERE id_tratamiento = trt.id_tratamiento) as sesiones_realizadas,
		(SELECT fecha 
			FROM sesion 
            WHERE id_tratamiento = trt.id_tratamiento 
            ORDER BY fecha DESC limit 1) as ultima_sesion
FROM tratamiento as trt
LEFT JOIN personal as per USING(id_personal)
LEFT JOIN historia as hst USING(id_paciente);

-- -----------------------------------------------------------------------------
-- Consulta de listado de personal
-- -----------------------------------------------------------------------------
SELECT 
	per.id_personal,
	per.nombres,
	per.cargo,
    per.celular,
    per.mail,
    per.creado,
    per.direccion,
    per.notas,
    (SELECT count(id_sesion) FROM sesion WHERE id_personal = per.id_personal) as tratamientos,
    (SELECT count(id_tratamiento) FROM tratamiento WHERE id_personal = per.id_personal) as sesiones
FROM personal as per;


-- -----------------------------------------------------------------------------
-- Consulta de listado equipos
-- -----------------------------------------------------------------------------
SELECT eqp.id_equipo,
	eqp.nombre,
	eqp.marca,
	eqp.modelo,
	(SELECT count(id_sesion) FROM sesion WHERE id_equipo = eqp.id_equipo) as sesiones,
    eqp.notas
FROM equipo as eqp;

-- -----------------------------------------------------------------------------
-- Consulta de facturas
-- -----------------------------------------------------------------------------
SELECT 
	fac.id_factura,
    fac.fecha,
    cli.nombres,
    trt.id_tratamiento,
    fac.descuento,
    fac.subtotal0,
    fac.subtotal12,
    (SELECT sum(valor) FROM cobro WHERE id_factura = fac.id_factura) as cobro
    FROM factura as fac
    LEFT JOIN cliente as cli USING (id_cliente)
    LEFT JOIN tratamiento as trt USING(id_tratamiento);