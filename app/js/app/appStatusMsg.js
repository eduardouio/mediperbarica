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

      case 405:
      objError = {
        code : '405',
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
        type : 'Anvertencia',
        title : 'El registro ya Existe!',
        message : 'El registro que está ingresando ya existe en el sistema ' +
                ' verifique los datos para continuar',
        data : data
      };
      break;

      case 1001:
      objError = {
        code : '1001',
        type : 'Error',
        title : 'Faltan Datos',
        message : 'Falta uno o mas datos en el formulario de registro o es' + 
                'es demaciado corto ejem. (Dirección), (Teléfono), (Nombre) etc.',
        data : data
      };
      break;

      case 1002:
      objError = {
        code : '1002',
        type : 'Mensaje',
        title : 'Registro Guardado Correctamente',
        message : 'El registro se creo satifactoriamente',
        data : data
      };
      break;

      case 1003:
      objError = {
        code : '1003',
        type : 'Mensaje',
        title : 'Registro Guardado Correctamente',
        message : 'Las modificaciones en el registro fueron guardadas',
        data : data
      };
      break;

      case 1004:
      objError = {
        code : '1004',
        type : 'Error',
        title : 'Registro Inexistente',
        message : 'El registro que intenta ver no existe',
        data : data
      };
      break;

      case 1005:
      objError = {
        code : '1005',
        type : 'Mensaje',
        title : 'Registros Listados',
        message : 'Los registros se listaron correctamente',
        data : data
      };
      break;

      case 1006:
      objError = {
        code : '1006',
        type : 'Mensaje',
        title : 'Registro Eliminado',
        message : 'El registro fue eliminado correctamente',
        data : data
      };
      break;

      case 1007:
      objError = {
        code : '1007',
        type : 'Error',
        title : 'El Servidor Retornó Un Valor Vacio',
        message : 'No existen datos para esta consulta',
        data : data
      };
      break;
    }
    console.dir(objError);
  };