/*******************************************************************************
  http://patorjk.com/software/taag/#p=display&f=Doom&t=Errores
  Modulo de tratamientos
  http://mediperbarica.com.ec/hash/historias
  Copyright 2014 Mediperbarica Todos los derechos reservados
  @autor: Eduardo Villota
  @date: 11-05-2016 23:44
  @version 1.0
  _____                             
|  ___|                            
| |__ _ __ _ __ ___  _ __ ___  ___ 
|  __| '__| '__/ _ \| '__/ _ \/ __|
| |__| |  | | | (_) | | |  __/\__ \
\____/_|  |_|  \___/|_|  \___||___/
/******************************************************************************/
  /**
    Estructura de control encargada de manejar los errores de aplicación
    @param int(codeNumber) codigo de error
    @param obj(data) objeto con el error
    @return (void)
    **/
function showStatus(codeNumber, data){
  console.log('[Debug] Llamada funcion showStatus');
  //variable que almacena la los detalles del error
  var objError = {};
    switch (codeNumber) {
      
      case 404:
      objError = {
        code : '404',
        type : 'Error',
        title : 'La Página solicitada no existe!',
        message : 'El error ocurrió porque un recurso no está disponible ' +
                'es posible que sea un error interno, si el problema continúa' +
                'comuníquese al mail <eduardouio7@gmail.com>',
        data : data
      };
      break;


      case 500:
      objError = {
        code : '500',
        type : 'Error',
        title : 'Error De Servidor',
        message : 'Error interno de servidor la peticion no se procesó' + 
                  'por que la misma causó un error, favor contacte con el' + 
                  'administrador del servidor <eduardouio7@gmail.com>',
        data : data
      };
      break;
    
      case 100:
      objError = {
        code : '100',
        type : 'Error',
        title : 'Error en Aplicacion',
        message : 'No se puede enviar los datos al servidor, compruebe' + 
                  'su conexión a Internet e intente nuevamente.',
        data : data
      };
      break;

      case 1000:
      objError = {
        code : '1000',
        type : 'Advertencia',
        title : 'El registro ya Existe!',
        message : 'El registro que está ingresando ya existe en el sistema ' +
                ' verifique los datos para continuar',
        data : data
      };
      break;

      case 1001:
      objError = {
        code : '1001',
        type : 'Advertencia',
        title : 'Sesión Terminada',
        message : 'La sesión ha caducado, inicie una nueva sesión',
        data : data
      };
      break;

      case 2000:
      objError = {
        code : '2000',
        type : 'Error',
        title : 'Faltan Datos',
        message : 'Falta uno o mas datos en el formulario de registro, ' + 
                  ' compruebe e intente nuevamente',
        data : data
      };
      break;

      case 2001:
      objError = {
        code : '2001',
        type : 'Error',
        title : 'Registro Inexistente',
        message : 'El registro que intenta ver no existe',
        data : data
      };
      break;
      case 2002:
      objError = {
        code : '2002',
        type : 'Error',
        title : 'El Servidor Retornó Un Valor Vacio',
        message : 'No existen datos para esta consulta',
        data : data
      };
      break;
      
      case 2003:
      objError = {
        code : '2003',
        type : 'Error',
        title : 'User y Password incorrecto',
        message : 'El nombre de usuario o la contraseña, ' + 
        'está incorrecto, intente nuevamente',
        data : data
      };
      break;

      case 2004:
      objError = {
        code : '2004',
        type : 'Error',
        title : 'No se puede eliminar el registro',
        message : 'El registro que intenta eliminar tiene otros registros, ' + 
        'dependientes lo cual impide su borrado para poder cuidar ' +
          ' la integridad de la base de datos',
        data : data
      };
      break;

    case 2005:
      objError = {
        code : '2005',
        type : 'Error',
        title : 'Dato insuficiente corto',
        message : 'Uno de los datos es demasiado corto para lo permitido, ' + 
                  'Rectifique e intente nuevamente',
        data : data
      };
      break;

    case 2006:
      objError = {
        code : '2006',
        type : 'Error',
        title : 'Numero de Identificacion Duplicado',
        message : 'El número de Cédula ya esta asignado a otra historia, ' + 
                  'Rectifique e intente nuevamente',
        data : data
      };
      break;

      case 3000:
      objError = {
        code : '3000',
        type : 'Mensaje',
        title : 'Registro Guardado Correctamente',
        message : 'El registro se creo satifactoriamente',
        data : data
      };
      break;

      case 3001:
      objError = {
        code : '3001',
        type : 'Mensaje',
        title : 'Registro Editado Correctamente',
        message : 'Las modificaciones en el registro fueron guardadas',
        data : data
      };
      break;

      case 3002:
      objError = {
        code : '3002',
        type : 'Mensaje',
        title : 'Registros Listados',
        message : 'Los registros se listaron correctamente',
        data : data
      };
      break;

      case 3003:
      objError = {
        code : '3003',
        type : 'Mensaje',
        title : 'Registro Eliminado',
        message : 'El registro fue eliminado correctamente',
        data : data
      };
      break;

      case 3004:
      objError = {
        code : '3004',
        type : 'Mensaje',
        title : 'Sesión Iniciada',
        message : 'La sesión se inicio correctamente',
        data : data
      };
      break;

      case 4000:
      objError = {
        code : '4000',
        type : 'Error',
        title : 'Partametro Incompleto',
        message : 'El parametro pasado a la función BackEnd esta Incompleto',
        data : data
      };
      break;
  }
    console.dir(objError);
  };