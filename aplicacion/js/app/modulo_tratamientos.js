/*****************************************************************************
  Modulo de tratamientos
  http://mediperbarica.com.ec/hash/historias
  Copyright 2014 Mediperbarica Todos los derechos reservados
  @autor: Eduardo Villota
  @date: 11-05-2016 23:44
  @version 1.0
 _    _  _       _                _ 
| |  | |(_)     | |              (_)            
| |__| | _  ___ | |_  ___   _ __  _   __ _  ___ 
|  __  || |/ __|| __|/ _ \ | '__|| | / _` |/ __|
| |  | || |\__ \| |_| (_) || |   | || (_| |\__ \
|_|  |_||_||___/ \__|\___/ |_|   |_| \__,_||___/

 ****************************************************************************/
 var mediperbaricaApp = angular.module('mediperbaricaApp', ['ngRoute']);

 /****************************************************************************
                    			 __    ___    __  
                    			|__)|  || /\ /__` 
                    			|  \\__/|/~~\.__/ 
                    			                  
*****************************************************************************/
mediperbaricaApp.config(function($locationProvider, $routeProvider){
	$routeProvider
	.when('/', {
		templateUrl: host + 'tplhtml/listar-tratamientos-tpl.html',
		controller: 'ListarTratamientosController'
	})
	.when('/mostrar-tratamiento/:tratamientoId', {
		templateUrl: host + 'tplhtml/mostrat-tratamiento-tpl.html',
		controller: 'mostrarTratamientosController'
	})
	.when('/crear/', {
		templateUrl: host + 'tplhtml/crear-tratamiento-tpl.html',
		controller: 'AsignarTratamientosController'
	})
	.when('/actualizar-tratamiento/:tratamientoId', {
		templateUrl: host + 'tplhtml/listar-tratamientos-tpl.html',
		controller: 'ListarTratamientosController'
	})
	.when('/listarTratamientos', {
		templateUrl: host + 'tplhtml/listar-tratamientos-tpl.html',
		controller: 'ListarTratamientosController'
	})
	.otherwise({ redirectTo: '/' });
});