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

mediperbaricaApp.factory('serviceLogin',['$http','$rootScope','$location',
	function($http, $rootScope, $location){

		// variable que almacena los servicios de la factory
		var service = {};

		//Funcion encargada de validar los datos del login
		service.login = function(userData, callback){
			console.log('[Debug] llamada funcion login');
			$http.post(serviceBase + 'login/go', userData).
			success(function(response) {
				callback(response);
			}).
			error(function(response){
				showStatus(404,response);
			})
		};

	return service;
	}
]);