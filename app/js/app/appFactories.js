/*******************************************************************************
  Copyright 2014 Mediperbarica Todos los derechos reservados
  @autor: Eduardo Villota
  @date: 11-05-2016 23:44
  @version 0.2
 
 Introduccion: Modulo Encargado de Manejar las solicitudes al servidor, GET
 y POST maneja solicitudes asincronas
/******************************************************************************/
//Variable que define el index.php en las rutas para la interaccion HTTP
var serviceBase = host + 'index.php/';

/**-----------------------------------------------------------------------------
Factory Login
-----------------------------------------------------------------------------**/
mediperbaricaApp.factory('serviceLogin',['$http','$rootScope','$location', '$q',
	function($http, $rootScope, $location, $q){
		console.log('[Debug] Llamada a FAC serviceLogin');
		// variable que almacena los servicios de la factory
		var service = {};
		var deferred = $q.defer();
		var promise = deferred.promise;

		//Funcion encargada de validar los datos del login
		service.login = function(userData){
			console.log('[Debug] llamada funcion login');
			$http.post(serviceBase + 'login/go', userData).
			success(function(response) {
				return deferred.resolve(response);
			}).
			error(function(response){
				return deferred.reject(response);
			})
			return promise
		};

		//Funcion encargada de cerrar la datos del login
		service.logon = function(){
			console.log('[Debug] llamada funcion logon');
			$http.post(serviceBase + 'login/logout').
			success(function(response) {
				return deferred.resolve(response);
			}).
			error(function(response){
				return deferred.reject(response);
			})
			return promise
		};

		return service;
	}]);

/*------------------------------------------------------------------------------
Factory Historias
------------------------------------------------------------------------------*/
mediperbaricaApp.factory('serviceHistories', ['$http','$rootScope','$location',
							'$q', 
	function($http, $rootScope, $location, $q){
		console.log('[Debug] Llamada a FAC serviceHistories');
		//valiables que almacenas los servicios
		var service = {};
		var deferred = $q.defer();
		var promise = deferred.promise;

		//Funcion encargada de listar las historias
		service.getHistories = function(){
			console.log('[Debug] llamada funcion getHistories() ');
			$http.get(serviceBase + 'historias/getHistoryData')
				.success(function(response){
					return deferred.resolve(response);
				})
				.error(function(response){
					return deferred.reject(response);
				})
			return promise;
		};

		//Funcion encargada de devolver una historia
		service.getHistory = function(idHistory){
			console.log('[Debug] llamada funcion getHistory()');
			
			$http.get(serviceBase + 'hisotrias/getHistoryData/' + idHistory)
				.success(function(response){
					return deferred.resolve(response);
				})
				.error(function(response){
					return deferred.reject(response);
				})
			return promise;
		};

		//Funcion encargada de guardar una historia
		service.setHistory = function(history){
			console.log('[Debug] llamada funcion setHistory()');
			$http.get(serviceBase + 'hisotrias/setHistory/' , history)
				.success(function(response){
					return deferred.resolve(response);
				})
				.error(function(response){
					return deferred.reject(response);
				})
			return promise;
		};

		//Funcion encargada de eliminar una historia
		service.delHistory = function(idHistory){
			console.log('[Debug] llamada funcion delHistory()');
			$http.delete(serviceBase + 'hisotrias/deleteHistory/' , history)
				.success(function(response){
					return deferred.resolve(response);
				})
				.error(function(response){
					return deferred.reject(response);
				})
			return promise;
		};

		return service;
	}]);