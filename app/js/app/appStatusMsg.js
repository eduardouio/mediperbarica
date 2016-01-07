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
//Manejo de errores app
function showMsg(codigo){
  console.log('[Debug] Lamada a funcion muestra de errores');
    switch (codigo) {
      case 404:
      alert ('Err [404] => La pagina solicitada no existe!, comuniquese con '+ 
            'el administrador, error interno de aplicacion' +
                        ' :( ');
      break;

      case 1000:
      return ('Status 1000: El Registro que intenta crear ya existe.' +
                        ' :(');
      break;
      case 1001:
      return ('Status 1001: Datos incompletos en el ' + 
        'formulario de Registro, uno de los campos esta incompleto o no tiene' +
        ' un valor asignado.');
      break;
      case 1002:
      return ('Status 1002: Registro Guardado ' + 
                    ' Correctamente! :)');
      break;
      case 1003:
      return ('Status 1003: Registro Editado' + 
                             ' Correctamente! :)');
      break;
      case 1004:
      return ('Status 1004: El Registro Al Que Intenta' + 
                             ' Acceder No Existe. :(');
      break;
      case 1005:
      return ('Status 1005: Registros Listados ' +
                                         'Correctamente :)');
      break;
      case 1006:
      return ('Status 1006: Registro Eliminado' + 
                             ' Correctamente :)');
      break;
      case 1007:
      return ('Status 1007: La Consulta Retornó Un Valor' + 
                             ' Vacío, No Existen Datos. :)');
      break;
    }
  };

