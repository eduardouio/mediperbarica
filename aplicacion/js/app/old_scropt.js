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
var mediperbaricaApp = angular.module('mediperbaricaApp', ['ngRoute','ui.bootstrap']);

//Metodo encargado de gestionar las histororias
mediperbaricaApp.factory('services', [ '$http', function($http){
	var serviceBase = host + 'index.php/historias/';
	var obj = {};

	//Metodo que obtiene las historias
	obj.getHistorias = function(){
		console.log('[Debug] => Se llama a la funcion getHistoria');
		console.log('[Debug] => ' + serviceBase + 'getHistoria');
		obj.httpResult = $http.get(serviceBase + 'getHistoria');
		return obj.httpResult;
	};
	//Metodo que retorna una historia
	obj.getHistoria = function (id_historia) {
		obj.httpResult = $http.get(serviceBase + 'getHistoria/' + id_historia);
		return obj.httpResult;
	};
	//Metodo que guarda una historia
	obj.insertHistoria = function (historia){
		console.log('[Debug] => Se llama al servicio insertHistoria');
		return $http.post(serviceBase + 'setHistoria', historia).then(function (results){
			obj.httpResult = results;
			return obj.httpResult;
		});
	};
	//Metodo que actualiza una historia
	obj.updateHistoria = function(id_historia, historia) {
		return $http.post(serviceBase + 'updateHistoria', {id_historia:id_historia, historia:historia}).then(function (status){
			obj.httpResult = status.data;
			console.log('[Debug]' + status.data);
			return status.data;
		});
	};

	//MEtodo que elimina una historia por URL
	obj.deleteHistoria = function(id_histora){
		return $http.delete(serviceBase + 'deleteHistoria/'+ id_histora).then (function (status){
			obj.httpResult = status.data;
			console.log('[Debug]' + status.data);
			return status.data;
		});
	}

	//Metodo que retorna la respuesta del servidor

	obj.getHttpResult = function(){
		return obj.httpResult;
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
	console.log("[Debug] => Se Establece los parametros de la paginacion & Se llama al controlador ListarController");
	$scope.historiasPaginadas = [];
	$scope.historias = [] ;
	$scope.currentPage = 0 ;
	$scope.numPerPage = 10 ;
	$scope.maxSize = 10 ;

	
	$scope.listarHistorias = function(){
		services.getHistorias().then(function (data){
			$scope.historias = data.data;
		});	

	};

	$scope.listarHistorias();


	//Determina el numero de paginas que contiene la paginacion
	$scope.numPages = function (){
		if ($scope.historias.length){
			console.log('[Debug] Valor de Paginacion ' + Math.ceil($scope.historias.length / $scope.numPerPage));		
			return Math.ceil($scope.historias.length / $scope.numPerPage);
		} else{
			console.log("[ERROR] no hay valor para el scope historias numPages()");
		}
	};

	//Determina lo que se muestra en la tabla
	$scope.$watch('currentPage + numPerPage', function(){
		if ($scope.historias.length > 0){
			var begin = (($scope.currentPage -1 ) * $scope.numPerPage);
			var end = begin + $scope.numPerPage;
			console.log("[Debug] valor de begin " + begin + " Valor de End " + end);
			$scope.historiasPaginadas = $scope.historias.slice(begin,end);
		} else {
			console.log("[ERROR] No hay un valor para scope Historias");
		}
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
		services.insertHistoria(historia);
		alert(services.httpResult);
		console.dir(services);
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