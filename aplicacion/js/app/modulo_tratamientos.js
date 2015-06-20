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
		templateUrl: host + 'tplhtml/templates/listar-tratamientos-tpl.html',
		controller: 'ListarTratamientosController'
	})
	.when('/mostrar-tratamiento/:tratamientoId', {
		templateUrl: host + 'tplhtml/templates/mostrar-tratamiento-tpl.html',
		controller: 'mostrarTratamientosController'
	})
	.when('/crear/', {
		templateUrl: host + 'tplhtml/forms/frm-tratamiento-tpl.html',
		controller: 'AsignarTratamientosController'
	})
	.when('/actualizar-tratamiento/:tratamientoId', {
		templateUrl: host + 'tplhtml/templates/listar-tratamientos-tpl.html',
		controller: 'ListarTratamientosController'
	})
	.when('/listarTratamientos', {
		templateUrl: host + 'tplhtml/templates/listar-tratamientos-tpl.html',
		controller: 'ListarTratamientosController'
	})
	.otherwise({ redirectTo: '/' });
});


/* ---------------------------------------------------------------------------
 ___   _______  __        __  
|__/\ /  `|/  \|__)\ //\ /__` 
| /~~\\__,|\__/|  \ |/~~\.__/ 

----------------------------------------------------------------------------*/
mediperbaricaApp.factory('services', [ '$http','$location', function($http,
																	$location){
	var serviceBase = host + 'index.php/';
	var obj = {};

	//Metodo que obtiene las historias
	obj.getHistorias = function(){
		console.log('[Debug] => Se llama a la factory que l');
		console.log('[Debug] => ' + serviceBase + 'getHistoria');
		return $http.get(serviceBase + 'historias/getHistoria');
	};
	//Metodo que retorna una historia
	obj.getHistoria = function (id_historia) {
		return $http.get(serviceBase + 'historias/getHistoria/' + id_historia);
	};
	//Metodo que guarda una historia
	obj.insertHistoria = function (historia){
		console.log('[Debug] => Se llama al servicio insertHistoria');
		var result = $http.post(serviceBase + 'historias/setHistoria', 
								historia);
		console.log('[Debug] Retornamos el volcado de la peticion $http');
		
		result.success(function(data){
			console.log('[Debug] Se envia la peticion Satisfactoriamente');
			var respuesta = parseInt(data.msg);
			switch(respuesta){
				case 1000:
					console.log('[Debug] estatus 1000 ya existe ');
					alert('La historia que esta ingresando ya existe!');
					$location.path('/presentar/' + data.id_historia);
					break;
				case 1001:
					console.log('[Debug] status 1001 faltan datos');
					alert('Uno de los Datos ingresados ' +
							'esta incompleto o no existe!');
					console.log('[Debug] status 1002 se crea la historia');
					break;
				case 1002:
					$location.path('/presentar/' + data.id_historia);
			}
			return data;
		});
		result.error(function(data,status,headers,config) {
			console.log('[Debug] No se puede conectar al Server');
			$location.path('/error-server');
		});

	};

	//Metodo que actualiza una historia
	obj.updateHistoria = function(historia) {
		var result = $http.post(serviceBase + 'historias/updateHistoria', 
								historia);

		result.success(function(data){
			console.log('[Debug] Se envia la peticion Satisfactoriamente');
			var respuesta = parseInt(data.msg);
			switch(respuesta){
				case 1000:
					console.log('[Debug] status 1000 el id del paciente esta ' + 
								'en otra historia');
					alert('Ya existe un registro con el mismo numero de Cedula ' + 
						  'en el sistema!');
					break;
				case 1001:
					console.log('[Debug] status 1001 faltan datos');
					alert('Uno de los Datos ingresados esta incompleto o no '+
						'existe!');
					console.log('[Debug] status 1002 se crea la historia');
					break;
					
				case 1003:
					$location.path('/presentar/' + data.id_historia);
					break;
			}
			return data;
		});
		result.error(function(data,status,headers,config) {
			console.log('[Debug] No se puede conectar al Server');
			$location.path('/error-server');
		});
	};

	//Metodo que elimina una historia por URL
	obj.deleteHistoria = function(id_histora){
		return $http.delete(serviceBase + 'historias/deleteHistoria/'+ 
							id_histora).then (function (status){
			console.log('[Debug]' + status.data);
			return status.data;
		});
	};

	//Obtiene los antecedentes de una historia
	obj.getAntecedentes = function (pacienteId) {
		console.log('[Debug] Se llama al servicio getAntecedentes');
		return $http.get(serviceBase + 'antecedentes/getAntecedentes/' + 
						pacienteId);
	};

	//obtiene un antecedente
	obj.getAntecedente = function (antecedenteId) {
		console.log('[Debug] Se llama al servicio getAntecedente');
		return $http.get(serviceBase + 'antecedentes/getAntecedente/' + 
						antecedenteId);
	};

	//guarda un antecedente
	obj.insertAntecedente = function (antecedente) {
		console.log('[Debug] => Se llama al servicio insertAntecedente');
		var result = $http.post(serviceBase + 'antecedentes/setAntecedente', 
								antecedente);
		console.log('[Debug] Retornamos el volcado de la peticion $http');
		result.success(function(data){
			console.log('[Debug] Se envia la peticion Satisfactoriamente');
			var respuesta = parseInt(data.msg);
			switch(respuesta){
				case 2000:
					console.log('[Debug] estatus 2000 ya existe ');
					alert('Ya Existe Este Antecedete En Esta Historia!');
					$location.path('/presentar/' + data.id_historia);
					break;
				case 2001:
					console.log('[Debug] status 2001 faltan datos');
					alert('Uno de los Datos ingresados esta incompleto o no ' +
						'existe!');
					console.log('[Debug] status 2002 se crea el antecedente');
					break;
				case 2002:
					$location.path('/presentar/' + data.id_historia);
			}
			return data;
		});
		result.error(function(data,status,headers,config) {
			console.log('[Debug] No se puede conectar al Server');
			$location.path('/error-server');
		});
	};

	//Metodo que actualiza un antecedente
	obj.updateAntecedente = function(antecedente) {
		console.log('[Debug] Antecedete Recibido :');
		console.dir(antecedente);
		console.log('[Debug] Se llama al servicio updateAntecedente');
		var result = $http.post(serviceBase + 'antecedentes/updateAntecedente', 
								antecedente);
		result.success(function(data){
			console.log('[Debug] Se envia la peticion Satisfactoriamente');
			var respuesta = parseInt(data.msg);
			switch(respuesta){
				case 2000:
					console.log('[Debug] status 2000 Ya Existe Este ' +
						'Antecedete En Esta Historia');
					alert('Ya Existe Este Antecedete En Esta Historia!');
					break;
				case 2001:
					console.log('[Debug] status 2001 faltan datos');
					alert('Uno de los Datos ingresados esta incompleto o ' + 
							'no existe!');
					console.log('[Debug] status 2003 se crea el atecedente');
					break;
				case 2003:
					$location.path('/presentar/' + data.id_historia);
			}
			return data;
		});
		result.error(function(data,status,headers,config) {
			console.log('[Debug] No se puede conectar al Server');
			$location.path('/error-server');
		});
	};
	return obj;
}]);