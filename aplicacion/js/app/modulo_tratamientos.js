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
var mediperbaricaApp = angular.module('mediperbaricaApp',['ngRoute',
                                                                'ngMaterial']);

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

/**
Factoria encargad de manejar los datos de los tratamientos
*/
mediperbaricaApp.factory('treatmentsServices', [ '$http' ,'$location','$q', function(
                                                    $http, $location,$q){
    console.log('[DEBUG] FAC treatmentsServices');
    var service = {};
    var urlBase = host + 'index.php/';
    var defered = $q.defer();
    var promise =  defered.promise;

    //trae trae los tratamientos de la base de datos
    service.getTreatments = function(){
    console.log('[DEBUG] MET FAC getTreatments');

    $http.get(urlBase + 'tratamientos/getTreatments')
        .success(function(response){
            return defered.resolve(response);
        })
        .error(function(response){
            return defered.reject(response);
      });
    return promise;
  }
  return service;

}]);

/**
    Factoria encargada de manejar los datos de loas empleados
*/
mediperbaricaApp.factory('employedServices', [ '$http' ,'$location','$q', 
                                                function($http, $location,$q){
    console.log('[DEBUG] FACT employedServices');
    var service = {};
    var urlBase = host + 'index.php/';
    var defered = $q.defer();
    var promise =  defered.promise;

    service.getEmployedData = function(){
    console.log('[Debug] MET FAC get getEmployedData');
    $http.get(urlBase + 'personal/getEmployedData')
        .success(function(response){
            return defered.resolve(response);
        })
        .error(function(response){
            return defered.reject(response);
        });
    return promise;
  }  

  return service;
}]);


/**
Factoria encargada de manejar los datos de las historias
*/
mediperbaricaApp.factory('historyServices', [ '$http' ,'$location','$q', 
                                                function( $http, $location,$q){
    console.log('[Debug] FCT historyServices');
    var service = {};
    var urlBase = host + 'index.php/';
    var defered = $q.defer();
    var promise =  defered.promise;

    service.getHistories = function(){
        console.log('[DEBUG] MET FAC getHistories');
        $http.get(urlBase + 'historias/getHistoryData')
            .success(function(response){
                return defered.resolve(response);
            })
            .error(function(response){
                return defered.reject(response);
            })
        return promise;
        } ;  
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
mediperbaricaApp.controller('listController',function($scope,$timeout,$rootScope, 
                                                        $location,$routeParams,
                                                        treatmentsServices){
    console.log('[DEBUG] CTRL Lista tratamientos');
    //guarda los tratamientos
    var promiseTratamientos = treatmentsServices.getTreatments();
    promiseTratamientos.then(
        function(response){
            delete $scope.tratamientos;
            console.dir(response);
            $scope.tratamientos = response.data;                
        },
        function(error){
            $scope.error = error;
            console.log('[ERROR] ' + error);
        })
});

/*------------------------------------------------------------------------------
Controllador encargado de agregar y editar un tratamiento
------------------------------------------------------------------------------*/
mediperbaricaApp.controller('editController',function($scope,$location,$timeout,
                                                 $routeParams, historyServices){
    console.log('[Debug] CTRL editController');

    //Acciones para cuando cambia de valor el AC
    $scope.acSelectedItemChange = function(item){
        console.log('El Valor Cambia a ' + JSON.stringify(item));
    };

    //acciones para mostrar la lista de historias
    $scope.acSearchHistory = function(acQueryText){
        var histories = [];
        //recuperamos la promesa de historias
        var promiseHistories = historyServices.getHistories();
        promiseHistories.then(
        function(response){
            //creamos la lista de historias
            var historiesItems = response.data;
            angular.forEach(historiesItems, function(value,key){
                console.dir((value.nombres).indexOf(acQueryText) > -1);
                if((value.nombres.toLowerCase()).indexOf(acQueryText
                                                        .toLowerCase()) >= 0 ){
                var item = {
                    'display' : value.nombres,
                    'value' : value.id_paciente
                };
                histories.push(item);
            }
            });
        },
        function(error){
            console.log('[ERROR] 404 ' + error);
            showMsg(404);
        });
            return histories;
        }
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
Controllador encargado de presentar los tratamientos
------------------------------------------------------------------------------*/
mediperbaricaApp.controller('presentController',function($scope,services,
                                                        $location,$routeParams){

});