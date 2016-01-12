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

		//funcion estandar para GET
		function httpGet(url){
		var deferred = $q.defer();
		var promise = deferred.promise;
		$http.post(serviceBase + url)
				.success(function(response){
					return deferred.resolve(response);
				})
				.error(function(response){
					return deferred.reject(response);
				})
			return promise;			
		}

		//funcion estandar para POST
		function httpPost(url,data){
		var deferred = $q.defer();
		var promise = deferred.promise;
		$http.post(serviceBase + url,data)
				.success(function(response){
					return deferred.resolve(response);
				})
				.error(function(response){
					return deferred.reject(response);
				})
			return promise;			
		}

		//funcion estandar para DELETE
		function httpDelete(url,data){
		var deferred = $q.defer();
		var promise = deferred.promise;
		$http.delete(serviceBase + url,data)
				.success(function(response){
					return deferred.resolve(response);
				})
				.error(function(response){
					return deferred.reject(response);
				})
			return promise;			
		}

		//Funcion encargada de validar los datos del login
		service.login = function(userData){
			console.log('[Debug] llamada funcion login');
			return httpPost('login/go', userData);
		};

		//Funcion encargada de cerrar la datos del login
		service.logon = function(){
			console.log('[Debug] llamada funcion logon');
			return httpGet('login/logout');
		}
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
		
		//funcion estandar para GET
		function httpGet(url){
		var deferred = $q.defer();
		var promise = deferred.promise;
		$http.post(serviceBase + url)
				.success(function(response){
					return deferred.resolve(response);
				})
				.error(function(response){
					return deferred.reject(response);
				})
			return promise;			
		}

		//funcion estandar para POST
		function httpPost(url,data){
		var deferred = $q.defer();
		var promise = deferred.promise;
		$http.post(serviceBase + url,data)
				.success(function(response){
					return deferred.resolve(response);
				})
				.error(function(response){
					return deferred.reject(response);
				})
			return promise;			
		}

		//funcion estandar para DELETE
		function httpDelete(url,data){
		var deferred = $q.defer();
		var promise = deferred.promise;
		$http.delete(serviceBase + url,data)
				.success(function(response){
					return deferred.resolve(response);
				})
				.error(function(response){
					return deferred.reject(response);
				})
			return promise;			
		}

		//Funcion encargada de listar las historias
		service.getHistories = function(){
			console.log('[Debug] llamada funcion getHistories() ');
			return httpGet('historias/getHistoryData');	
			};

		//Funcion encargada de devolver una historia
		service.getHistory = function(idHistory){
			console.log('[Debug] llamada funcion getHistory()');
			return httpGet('hisotrias/getHistoryData/' + idHistory);
		};

		//Funcion encargada de guardar una historia
		service.setHistory = function(history){
			console.log('[Debug] llamada funcion setHistory()');
			return httpPost('hisotrias/setHistory/' , history);
		};

		//Funcion encargada de eliminar una historia
		service.delHistory = function(idHistory){
			console.log('[Debug] llamada funcion delHistory()');
			return httpDelete('hisotrias/deleteHistory/' , history);
		};

		return service;
	}]);

/*------------------------------------------------------------------------------
Factory Para carga de archivos HTML
------------------------------------------------------------------------------*/
mediperbaricaApp.factory('serviceLoadTemplates', ['$http','$rootScope','$location',
							'$q', 
	function($http, $rootScope, $location, $q){
		console.log('[Debug] Llamada a FAC serviceLoadTemplates');
		//valiables que almacenas los servicios
		var service = {};
		
		//funcion estandar para GET
		function httpPost(url,idHistory){
		var deferred = $q.defer();
		var promise = deferred.promise;
		$http.post(serviceBase + url , idHistory)
				.success(function(response){
					return deferred.resolve(response);
				})
				.error(function(response){
					return deferred.reject(response);
				})
			return promise;			
		}

		//Funcion encargada de listar las historias
		service.getTplPresentHistory = function(idHistory){
			console.log('[Debug] llamada funcion getTplPresentHistory() ');
			return httpPost('templates/getTplPresentHistory/', idHistory );	
			}

		return service;
	}]);