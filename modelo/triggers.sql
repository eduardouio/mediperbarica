/*******************************************************************************
  Copyright 2014 Mediperbarica Todos los derechos reservados
  @autor: Eduardo Villota
  @date: 11-05-2016 23:44
  @version 0.2.16
 
 Introduccion: Modelo de base de datos, definicion de acciones a tomar cuando
 uno o varios registros son borrados o ingresados
/******************************************************************************/

-- -----------------------------------------------------------------------------
-- Disparador para crear clientes desde historia y registro log
-- -----------------------------------------------------------------------------
DELIMITER //
CREATE TRIGGER HISTORIA_AFTER_INSERT 
	AFTER INSERT ON `historia` FOR EACH ROW
BEGIN
	-- crea el registro para cliente, para facilitar la facturacion
	INSERT INTO `cliente`
	(`id_cliente`,`nombres`,`telefono`,`direccion`)
	VALUES
	(NEW.id_paciente, NEW.nombres,NEW.telefono,NEW.direccion);
    
    -- se ingresa en el log de actividades    
    INSERT INTO `log_user`
	(`accion`, `tabla`, `new_data`)
    VALUES(
    'insert',
    'historia',
    CONCAT(NEW.id_paciente, ';' , NEW.nombres, ';' ,NEW.telefono, ';' ,NEW.direccion)
    );
END; //
DELIMITER ;

-- -----------------------------------------------------------------------------
-- Disparador historias update
-- -----------------------------------------------------------------------------
DELIMITER //
CREATE TRIGGER HISTORIA_AFTER_UPDATE
	AFTER UPDATE ON historia FOR EACH ROW
BEGIN
	    -- se ingresa en el log de actividades    
    INSERT INTO `log_user`
	(`accion`, `tabla`, `old_data`, `new_data`)
    VALUES(
    'update',
    'historia',
    CONCAT(OLD.id_paciente, ';' , OLD.nombres, ';' ,OLD.telefono, ';' ,OLD.direccion),
    CONCAT(NEW.id_paciente, ';' , NEW.nombres, ';' ,NEW.telefono, ';' ,NEW.direccion)
    );
END;//
DELIMITER ;

-- -----------------------------------------------------------------------------
-- Disparador historias delete
-- -----------------------------------------------------------------------------
DELIMITER //
CREATE TRIGGER HISTORIA_BEFORE_UPDATE
	BEFORE DELETE ON historia FOR EACH ROW
BEGIN
	    -- se ingresa en el log de actividades    
    INSERT INTO `log_user`
	(`accion`, `tabla`, `old_data`)
    VALUES(
    'delete',
    'historia',
    CONCAT(OLD.id_paciente, ';' , OLD.nombres, ';' ,OLD.telefono, ';' ,OLD.direccion)
    );
END;//
DELIMITER ;

-- -----------------------------------------------------------------------------
-- Disparador tratamientos insert
-- -----------------------------------------------------------------------------
DELIMITER //
CREATE TRIGGER TRATAMIENTOS_AFTER_INSERT
	AFTER INSERT ON tratamiento FOR EACH ROW
	BEGIN
		  -- se ingresa en el log de actividades    
    INSERT INTO `log_user`
	(`accion`, `tabla`, `new_data`)
    VALUES(
    'insert',
    'tratamiento',
    CONCAT(NEW.id_tratamiento, ';' , NEW.id_paciente, ';' ,
			NEW.nro_sesiones, ';' ,NEW.motivo_tratamiento, ';' 
            ,NEW.costo)
    );
	END;//
DELIMITER ;

-- -----------------------------------------------------------------------------
-- Disparador tratamientos DELETE
-- -----------------------------------------------------------------------------
DELIMITER //
CREATE TRIGGER TRATAMIENTOS_AFTER_DELETE
	AFTER DELETE ON tratamiento FOR EACH ROW
	BEGIN
		  -- se ingresa en el log de actividades    
    INSERT INTO `log_user`
	(`accion`, `tabla`, `new_data`)
    VALUES(
    'delete',
    'tratamiento',
    CONCAT(OLD.id_tratamiento, ';' , OLD.id_paciente, ';' ,
			OLD.nro_sesiones, ';' ,OLD.motivo_tratamiento, ';' 
            ,OLD.costo)
    );
	END;//
DELIMITER ;

-- -----------------------------------------------------------------------------
-- Disparador tratamientos update
-- -----------------------------------------------------------------------------
DELIMITER //
CREATE TRIGGER TRATAMIENTOS_AFTER_UPDATE
	AFTER UPDATE ON tratamiento FOR EACH ROW
	BEGIN
		  -- se ingresa en el log de actividades    
    INSERT INTO `log_user`
	(`accion`, `tabla`, `old_data`, `new_data`)
    VALUES(
    'update',
    'tratamiento',
    CONCAT(OLD.id_tratamiento, ';' , OLD.id_paciente, ';' ,
			OLD.nro_sesiones, ';' ,OLD.motivo_tratamiento, ';' 
            ,OLD.costo),
            CONCAT(NEW.id_tratamiento, ';' , NEW.id_paciente, ';' ,
			NEW.nro_sesiones, ';' ,NEW.motivo_tratamiento, ';' 
            ,NEW.costo)
    );
	END;//
DELIMITER ;

-- -----------------------------------------------------------------------------
-- Disparador antecedente insert
-- -----------------------------------------------------------------------------
DELIMITER //
CREATE TRIGGER ANTECEDENTE_AFTER_INSERT
	AFTER INSERT ON antecedente FOR EACH ROW
	BEGIN
		  -- se ingresa en el log de actividades    
    INSERT INTO `log_user`
	(`accion`, `tabla`,`new_data`)
    VALUES(
    'insert',
    'antecedente',
            CONCAT(NEW.id_antecedente, ';' , NEW.id_paciente, ';' ,
			,NEW.detalle)
    );
	END;//
DELIMITER ;

-- -----------------------------------------------------------------------------
-- Disparador antecedente update
-- -----------------------------------------------------------------------------
DELIMITER //
CREATE TRIGGER ANTECEDENTE_AFTER_UPDATE
	AFTER UPDATE ON antecedente FOR EACH ROW
	BEGIN
		  -- se ingresa en el log de actividades    
    INSERT INTO `log_user`
	(`accion`, `tabla`, `old_data`,`new_data`)
    VALUES(
    'update',
    'antecedente',
            CONCAT(OLD.id_antecedente, ';' , OLD.id_paciente,
            ';' ,OLD.detalle),
            CONCAT(NEW.id_antecedente, ';' , NEW.id_paciente, ';' ,
			NEW.detalle)
    );
	END;//
DELIMITER ;

-- -----------------------------------------------------------------------------
-- Disparador antecedente DELETE
-- -----------------------------------------------------------------------------
DELIMITER //
CREATE TRIGGER ANTECEDENTE_AFTER_DELETE
	AFTER DELETE ON antecedente FOR EACH ROW
	BEGIN
		  -- se ingresa en el log de actividades    
    INSERT INTO `log_user`
	(`accion`, `tabla`, `old_data`)
    VALUES(
    'delete',
    'antecedente',
            CONCAT(OLD.id_antecedente, ';' , OLD.id_paciente, ';' ,
			OLD.detalle)
    );
	END;//
DELIMITER ;


-- -----------------------------------------------------------------------------
-- Disparador cliente delete
-- -----------------------------------------------------------------------------
DELIMITER //
CREATE TRIGGER CLIENTE_AFTER_DELETE
	AFTER DELETE ON cliente FOR EACH ROW
	BEGIN
		  -- se ingresa en el log de actividades    
    INSERT INTO `log_user`
	(`accion`, `tabla`, `old_data`)
    VALUES(
    'delete',
    'cliente',
            CONCAT(OLD.id_cliente, ';' , OLD.nombres, ';' ,
			OLD.telefono, ';' ,OLD.direccion)
    );
	END;//
DELIMITER ;

-- -----------------------------------------------------------------------------
-- Disparador cliente insert
-- -----------------------------------------------------------------------------
DELIMITER //
CREATE TRIGGER CLIENTE_AFTER_INSERT
	AFTER INSERT ON cliente FOR EACH ROW
	BEGIN
		  -- se ingresa en el log de actividades    
    INSERT INTO `log_user`
	(`accion`, `tabla`, `new_data`)
    VALUES(
    'insert',
    'cliente',
            CONCAT(NEW.id_cliente, ';' , NEW.nombres, ';' ,
			NEW.telefono, ';' ,NEW.direccion)
    );
	END;//
DELIMITER ;

-- -----------------------------------------------------------------------------
-- Disparador cliente update
-- -----------------------------------------------------------------------------
DELIMITER //
CREATE TRIGGER CLIENTE_AFTER_UPDATE
	AFTER UPDATE ON cliente FOR EACH ROW
	BEGIN
		  -- se ingresa en el log de actividades    
    INSERT INTO `log_user`
	(`accion`, `tabla`, `old_data`, `new_data`)
    VALUES(
    'update',
    'cliente',
			CONCAT(OLD.id_cliente, ';' , OLD.nombres, ';' ,
			OLD.telefono, ';' ,OLD.direccion),
            CONCAT(NEW.id_cliente, ';' , NEW.nombres, ';' ,
			NEW.telefono, ';' ,NEW.direccion)
    );
	END;//
DELIMITER ;

-- -----------------------------------------------------------------------------
-- Disparador sesion update
-- -----------------------------------------------------------------------------
DELIMITER //
CREATE TRIGGER SESION_AFTER_UPDATE
	AFTER UPDATE ON sesion FOR EACH ROW
	BEGIN
		  -- se ingresa en el log de actividades    
    INSERT INTO `log_user`
	(`accion`, `tabla`, `old_data`, `new_data`)
    VALUES(
    'update',
    'sesion',
			CONCAT(OLD.id_personal, ';' , OLD.id_tratamiento, ';' ,
			OLD.fecha, ';' ,OLD.fecha, ';' ,OLD.notas),
            CONCAT(NEW.id_personal, ';' , NEW.id_tratamiento, ';' ,
			NEW.fecha, ';' ,NEW.fecha, ';' ,NEW.notas)
    );
	END;//
DELIMITER ;

-- -----------------------------------------------------------------------------
-- Disparador sesion insert
-- -----------------------------------------------------------------------------
DELIMITER //
CREATE TRIGGER SESION_AFTER_INSERT
	AFTER INSERT ON sesion FOR EACH ROW
	BEGIN
		  -- se ingresa en el log de actividades    
    INSERT INTO `log_user`
	(`accion`, `tabla`, `new_data`)
    VALUES(
    'insert',
    'sesion',
            CONCAT(NEW.id_personal, ';' , NEW.id_tratamiento, ';' ,
			NEW.fecha, ';' ,NEW.fecha, ';' ,NEW.notas)
    );
	END;//
DELIMITER ;

-- -----------------------------------------------------------------------------
-- Disparador sesion delete
-- -----------------------------------------------------------------------------
DELIMITER //
CREATE TRIGGER SESION_AFTER_DELETE
	AFTER DELETE ON sesion FOR EACH ROW
	BEGIN
		  -- se ingresa en el log de actividades    
    INSERT INTO `log_user`
	(`accion`, `tabla`, `old_data`)
    VALUES(
    'delete',
    'sesion',
			CONCAT(OLD.id_personal, ';' , OLD.id_tratamiento, ';' ,
			OLD.fecha, ';' ,OLD.fecha, ';' ,OLD.notas)
    );
	END;//
DELIMITER ;


-- -----------------------------------------------------------------------------
-- Disparador factura update
-- -----------------------------------------------------------------------------
DELIMITER //
CREATE TRIGGER COBRO_AFTER_UPDATE
	AFTER UPDATE ON cobro FOR EACH ROW
	BEGIN
		  -- se ingresa en el log de actividades    
    INSERT INTO `log_user`
	(`accion`, `tabla`, `old_data`, `new_data`)
    VALUES(
    'update',
    'cobro',
			CONCAT(OLD.tipo, ';' , OLD.fecha, ';' ,
			OLD.banco, ';' ,OLD.valor, ';' ,OLD.nro_deposito),
            CONCAT(NEW.tipo, ';' , NEW.fecha, ';' ,
			NEW.banco, ';' ,NEW.valor, ';' ,NEW.nro_deposito)
    );
	END;//
DELIMITER ;

-- -----------------------------------------------------------------------------
-- Disparador factura insert
-- -----------------------------------------------------------------------------
DELIMITER //
CREATE TRIGGER COBRO_AFTER_INSERT
	AFTER INSERT ON cobro FOR EACH ROW
	BEGIN
		  -- se ingresa en el log de actividades    
    INSERT INTO `log_user`
	(`accion`, `tabla`, `new_data`)
    VALUES(
    'insert',
    'cobro',
            CONCAT(NEW.tipo, ';' , NEW.fecha, ';' ,
			NEW.banco, ';' ,NEW.valor, ';' ,NEW.nro_deposito)
    );
	END;//
DELIMITER ;

-- -----------------------------------------------------------------------------
-- Disparador factura delete
-- -----------------------------------------------------------------------------
DELIMITER //
CREATE TRIGGER COBRO_AFTER_DELETE
	AFTER DELETE ON cobro FOR EACH ROW
	BEGIN
		  -- se ingresa en el log de actividades    
    INSERT INTO `log_user`
	(`accion`, `tabla`, `old_data`)
    VALUES(
    'delete',
    'cobro',
			CONCAT(OLD.tipo, ';' , OLD.fecha, ';' ,
			OLD.banco, ';' ,OLD.valor, ';' ,OLD.nro_deposito)
    );
	END;//
DELIMITER ;