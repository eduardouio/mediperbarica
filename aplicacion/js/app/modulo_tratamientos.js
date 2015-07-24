/*******************************************************************************
  Modulo de tratamientos
  http://mediperbarica.com.ec/hash/historias
  Copyright 2014 Mediperbarica Todos los derechos reservados
  @autor: Eduardo Villota
  @date: 11-05-2016 23:44
  @version 1.0
 
|_   _|       | |                (_)          | |           
  | |_ __ __ _| |_ __ _ _ __ ___  _  ___ _ __ | |_ ___  ___ 
  | | '__/ _` | __/ _` | '_ ` _ \| |/ _ \ '_ \| __/ _ \/ __|
  | | | | (_| | || (_| | | | | | | |  __/ | | | || (_) \__ \
  \_/_|  \__,_|\__\__,_|_| |_| |_|_|\___|_| |_|\__\___/|___/
/******************************************************************************/

//generamos la APP
var mediperbaricaApp = angular.module('mediperbaricaApp',['ngRoute']);

/* -----------------------------------------------------------------------------
 __    ___    __  
|__)|  || /\ /__` 
|  \\__/|/~~\.__/ 
                  
------------------------------------------------------------------------------*/
mediperbaricaApp.config(function($locationProvider,$routeProvider){
  $locationProvider.html5Mode.enabled;
  $routeProvider
  .when('/',{
    templateUrl : host + 'tplhtml/templates/listar-tratamientos-tpl.html',
    controller : 'listController'
  })
  .when('/presesentar/:id_tratamiento',{
    templateUrl : host + 'tplhtml/templates/presentar-tratamiento-tpl.html',
    controller : 'presentController'
  })
  .when('/crear',{
    templateUrl : host + 'tplhtml/forms/frm-tratamiento-tpl.html',
    controller : 'editController'
  })
  .when('editar/:id_tratamiento',{
    templateUrl : host + 'tplhtml/forms/frm-tratamiento-tpl.html',
    controller : 'editController'
  })
  .when('eliminar/:id_tratamiento',{
    templateUrl : host + 'tplhtml/templates/presesentar-tratamiento-tpl.html',
    controller : 'deleteTratamiento'
  })
  .when('/acerca',{
    templateUrl : host + 'tplhtml/templates/acerca-app-tpl.html',
    controller : 'aboutController'
  })
  //usar el controlador solo para emergencias
  .when('/error-server',{
    templateUrl : host + 'tplhtml/templates/acerca-app-tpl.html',
    controller : 'failController'
  })

  .otherwise({ redirectTo: '/'});

});

/* -----------------------------------------------------------------------------
 ___   _______  __        __  
|__/\ /  `|/  \|__)\ //\ /__` 
| /~~\\__,|\__/|  \ |/~~\.__/ 
------------------------------------------------------------------------------*/
mediperbaricaApp.factory('services', [ '$http' ,'$location' , function($http, 
                                                                    $location){
  var urlBase = host + 'index.php/';
  var service = {};
  //trae trae los tratamientos de la base de datos
  service.getTratamientos = function(callback){
    console.log('[DEBUG] FAC Lista Tratamientos');
    $http.get(urlBase + 'tratamientos/getTratamientos').
      success(function(response){
        return callback(response);
      }).
      error(function(response){
        alert('Lo sentimos!, No se puede recuperar los datos, ' +
                                                      ' intente mas tarde :(');
      });
  };
  //listado de historias para el autocoplete del form
  service.getHistorias = function(callback){
    console.log('[DEBUG] FAC Listar Historias');
    $http.get(urlBase + 'historias/getHistoria').
    success(function(response){
        return callback(response);
    }).
    error(function(response){
        alert('Lo sentimos!, No se puede recuperar los datos, ' +
                                                      ' intente mas tarde :(');
    })
  };

  return service;
}]);

/* -----------------------------------------------------------------------------
 __  __    _____  __          ___ __  __  
/  `/  \|\ |||__)/  \|   |   |__ |__)/__` 
\__,\__/| \|||  \\__/|___|___|___|  \.__/ 
------------------------------------------------------------------------------*/

/*------------------------------------------------------------------------------
Controllador encargado de Listar los tratamientos
------------------------------------------------------------------------------*/
mediperbaricaApp.controller('listController',function($scope,services,
                                            $rootScope, $location,$routeParams){
  console.log('[DEBUG] CTRL Lista tratamientos');
  var respuesta = services.getTratamientos(function(response){
          if(parseInt(response['msg']) == 1007){
           alert('Base sin datos');
          }
          parseInt(response['msg'])
          $scope.showMsg(parseInt(response['msg']));
          $scope.tratamientos = response.data;
      });
});

/*------------------------------------------------------------------------------
Controllador encargado de presentar los tratamientos
------------------------------------------------------------------------------*/
mediperbaricaApp.controller('presentController',function($scope,services,
                                                        $location,$routeParams){

});
/*------------------------------------------------------------------------------
Controllador encargado de agregar y editar un tratamiento
------------------------------------------------------------------------------*/
mediperbaricaApp.controller('editController',function($scope,services,
                                                       $location,$routeParams){
    console.log('[DEBUG] CTRL editar tratamientos');
    /**
    Metodo encargado de cargar la info basica
    */
    $scope.loadData = function(){
        $scope.historia = {};
        $scope.antecedentes = {};
        $scope.tratamiento = {};
        $scope.personal = {};
        //recuperamos los datos
        var respHistorias = services.getHistorias(function(response){
            
        });

    };


    //iniciamos loadData
    $scope.loadData();

    /**
  Metodo encargado de mostrar los codigos de error de la app
  */
  $scope.showMsg = function(codigo){
    switch (codigo) {
      case 1000:
      $scope.alertas['msg'] = ('Err [1000] => El tratamiento ya Existe ' +
                        ':(');
        $scope.redirectHome();
      break;
      case 1001:
      $scope.alertas['msg'] = ('Err [1001] => Datos incompletos en el ' + 
        'formulario de registro de tratamiento.');
      break;
      case 1002:
      $scope.alertas['msg'] = ('Err [1002] => Tratamiento registrado ' + 
                    ' Correctamente! :)');
      break;
      case 1003:
      $scope.alertas['msg'] = ('Err [1003] => Tratamiento editado' + 
                             ' Correctamente! :)');
      break;
      case 1004:
      $scope.alertas['msg'] = ('Err [1004] => El tratamiento al que intenta' + 
                             ' acceder no existe.');
      break;
      case 1005:
      $scope.alertas['msg'] = ('Err [1005] => Tratamientos listados ' +
                                                          'Correctamente :(');
      break;
      case 1006:
      $scope.alertas['msg'] = ('Err [1006] => Tratamiento Eliminado' + 
                             ' Correctamente');
      break;
      case 1007:
      $scope.alertas['msg'] = ('Err [1007] => La consulta retorno un valor' + 
                             ' vacio, no existen datos.');
      break;
    }
  };

});

/*------------------------------------------------------------------------------
Controllador encargado de eliminar un tratamiento
------------------------------------------------------------------------------*/
mediperbaricaApp.controller('deleteTratamiento',function($scope,services,
                                                        $location,$routeParams){

});

/*------------------------------------------------------------------------------
Controllador encargado de mostrar acerca de
------------------------------------------------------------------------------*/
mediperbaricaApp.controller('aboutController',function($scope,services,
                                                        $location,$routeParams){

});
/*------------------------------------------------------------------------------
Controllador encargado de mostrar error iniminete en app
------------------------------------------------------------------------------*/
mediperbaricaApp.controller('failController',function($scope,services,
                                                        $location,$routeParams){

});