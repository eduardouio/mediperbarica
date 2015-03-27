/*!
  Fichero encargado de trabajar con las historias
  http://mediperbarica.com.ec/hash/historias
 
 
  Copyright 2014 Mediperbarica Todos los derechos reservados
  @autor: Eduardo Villota
  @date: 20-03-2015 00:23
 */

/**
Moduludo encargado de Crear Editar y Buscar las historias
*/
var mediperbaricaApp = angular.module('mediperbaricaApp', ['ngRoute']);

//Metodo encargado de gestionar las histororias
mediperbaricaApp.factory('services', [ '$http', function($http){
	var serviceBase = host + 'index.php/historias/';
	var obj = {};

	//Metodo que obtiene las historias
	obj.getHistorias = function(){
		console.log('[Debug] => Se llama a la funcion getHistoria');
		console.log('[Debug] => ' + serviceBase + 'getHistoria');
		return $http.get(serviceBase + 'getHistoria');
	};
	//Metodo que retorna una historia
	obj.getHistoria = function (id_historia) {
		return $http.get(serviceBase + 'getHistoria/' + id_historia);
	};
	//Metodo que guarda una historia
	obj.insertHistoria = function (historia){
		console.log('[Debug] => Se llama al servicio insertHistoria');
		return $http.post(serviceBase + 'setHistoria', historia).then(function (results){
			console.log('[Debug] => Resultado de la consulta');
			console.dir(results);
			return results;
		});
	};
	//Metodo que actualiza una historia
	obj.updateHistoria = function(id_historia, historia) {
		return $http.post(serviceBase + 'updateHistoria', {id_historia:id_historia, historia:historia}).then(function (status){
			console.log('[Debug]' + status.data);
			return status.data;
		});
	};

	//MEtodo que elimina una historia por URL
	obj.deleteHistoria = function(id_histora){
		return $http.delete(serviceBase + 'deleteHistoria/'+ id_histora).then (function (status){
			console.log('[Debug]' + status.data);
			return status.data;
		});
	}

	return obj;
}])


/**
Configuracion de las rutas a las plantillas
*/
mediperbaricaApp.config(function($locationProvider, $routeProvider){
	
	//$locationProvider.html5Mode(true);
	$routeProvider
	.when('/',{
		templateUrl : host + 'tplhtml/lista-tpl.html',
		controllerAs : 'ctrlListar',
		controller : 'ListarController'
	})
	.when('/crear',{
		templateUrl : host + 'tplhtml/historias-tpl.html',
		controllerAs : 'editCtrl',
		controller: 'editController'
	})
	.when('/buscar',{
		templateUrl : host + 'tplhtml/lista-tpl.html',
		controllerAs : 'ctrlListar',
		controller: 'ListarController'
	})
		.when('/acerca',{
		templateUrl : host + 'tplhtml/acerca.html',
		controller: 'AcercaController'
	})
	.otherwise({ redirectTo: '/' 
	});
});

//controlador encargado de listar las historias
mediperbaricaApp.controller('ListarController', function($scope, services){
	console.log("[Debug] => Se llama al controlador ListarController");
	services.getHistorias().then(function (data){
		$scope.historias = data.data;
	});
});

/**
Controlador encargado de Crear Editar Elimianar
*/
mediperbaricaApp.controller('editController', function( $scope, 
							$rootScope, $location, $routeParams, services){
	console.log('[Debug] => Se incia la carga de editController');
	var id_historia = ($routeParams.id_historia) ? parseInt($routeParams.id_historia) : 0;	
	$rootScope.title = (id_historia > 0) ? 'Edit Historia' : 'Add Historia';
	
	//Guada una historia
	$scope.saveHistoria = function (historia){
		console.log('[Debug] => Se llama a saveHistoria de editController');
		console.dir(historia);
		services.insertHistoria(historia);
	};	

	/**
	Metodo encargado de limpiar el $scope, Se comparan los vcalores de los objetos
	historia
	@return (boolean)
	*/
	$scope.isClean = function (){
		return angular.equals(original, $scope.historia);
	};

	/**	
	MEtodo encargado de eliminar un registro de historia
	@return str(id_historia)
	*/
	$scope.deleteHistoria = function(historia){
		$location.path('/');
		if(confirm("Esta Seguro de Eliminar la Historia : " + $scope._id + ' de ' + $scope.nombres) == true)
			services.deleteHistoria(historia._id);
	};

	console.log('[Debug] => Se termina la carga de editController');
});

mediperbaricaApp.controller('AcercaController', function($scope, services){

});
