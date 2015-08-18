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
      alert ('Err [404] => La pagina solicitada no existe!, comuniquese con el administrador, error interno de aplicacion' +
                        ' :( ');
      break;

      case 1000:
      return ('Err [1000] => El Registro Ya Existe!' +
                        ' :(');
      break;
      case 1001:
      return ('Err [1001] => Datos incompletos en el ' + 
        'formulario de Registro.');
      break;
      case 1002:
      return ('Err [1002] => Registro Guardado ' + 
                    ' Correctamente! :)');
      break;
      case 1003:
      return ('Err [1003] => Registro Editado' + 
                             ' Correctamente! :)');
      break;
      case 1004:
      return ('Err [1004] => El Registro Al Que Intenta' + 
                             ' Acceder No Existe. :(');
      break;
      case 1005:
      return ('Err [1005] => Registros Listados ' +
                                         'Correctamente :)');
      break;
      case 1006:
      return ('Err [1006] => Registro Eliminado' + 
                             ' Correctamente :)');
      break;
      case 1007:
      return ('Err [1007] => La Consulta Retornó Un Valor' + 
                             ' Vacío, No Existen Datos. :)');
      break;
    }
  };

