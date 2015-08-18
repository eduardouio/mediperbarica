/*******************************************************************************
Modulo de inicio de session
http://mediperbarica/hash/login
Copyright Mediperbarica S.A. Todos los derechos reservados
@autor: Eduardo Villota
@date: 21-07-2015
@version 0.1
  _     ___   ____ ___ _   _ 
 | |   / _ \ / ___|_ _| \ | |
 | |  | | | | |  _ | ||  \| |
 | |__| |_| | |_| || || |\  |
 |_____\___/ \____|___|_| \_|
                             
*******************************************************************************/

var mediperbaricaApp = angular.module('mediperbaricaApp',['ngRoute']);

/* ---------------------------------------------------------------------------
 __    ___    __  
|__)|  || /\ /__` 
|  \\__/|/~~\.__/ 
----------------------------------------------------------------------------*/
mediperbaricaApp.config(function($locationProvider,$routeProvider){
	//configuramos la relacion entre contrllers rutas y views
	$routeProvider
	.when('/error',{
		templateUrl : host + 'tplhtml/templates/error-server-tpl.html',
		controller :  'errorController'
	})
});

/* -----------------------------------------------------------------------------
 ___   _______  __        __  
|__/\ /  `|/  \|__)\ //\ /__` 
| /~~\\__,|\__/|  \ |/~~\.__/ 
------------------------------------------------------------------------------*/

mediperbaricaApp.factory('services',['$http', '$rootScope','$location', 
							function($http, $rootScope, $location){
	var serviceBase = host + 'index.php';
	var service = {};

	// Funcion encargada de validar los datos
	 service.login = function(userData,callback){
		$http.post( serviceBase + '/login/go', userData).
		success(function(response){
			callback(response);
		}).
		error(function(response){
			alert('No se pudo enviar los datos al Servidor Intente Nuevamente')
		});

	};
	return service;
}]);

/* -----------------------------------------------------------------------------
 __  __    _____  __          ___ __  __  
/  `/  \|\ |||__)/  \|   |   |__ |__)/__` 
\__,\__/| \|||  \\__/|___|___|___|  \.__/ 
------------------------------------------------------------------------------*/

mediperbaricaApp.controller('loginController',function($scope, $location, 
														$rootScope, services){
	//funcion encargada de enviar el formulario
	$scope.login = function(user){
		//validamos los datos del usuario
		var respuesta = services.login(user,
			function(response){
				var codigo = response.code
				$scope.showMsg(parseInt(codigo));
			}
			);

	};
	/**
	Se analiza los datos si no estas vacio se retora true
	*/
	$scope.validForm = function(user){
		//comprobamos que el ususario haya ingresado los datos
		var myCondition = false
		if (user.username && user.password){
			if (user.username !== '' && user.password !== ''){
				myCondition = true;
			}
		}
		// se evalua la condicion
		if(myCondition){
			$scope.login(user);
		}else{
			$scope.showMsg(1003);
		}
	};

	$scope.redirectHome = function(){
		var url = host + 'index.php/inicio';
		function redireccionar(){
			window.location= url;
		}
		setTimeout(redireccionar(), 5000);
	}

	/**
	Metodo encargado de mostrar los codigos de error de la app
	*/
	$scope.showMsg = function(codigo){
		switch (codigo) {
			case 1000:
			$scope.user['alerta'] = ('Err [1003] => Sesión iniciada ' +
												' correctamente:(');
				$scope.redirectHome();
			break;
			case 1001:
			$scope.user['alerta'] = ('Err [1001] => Sesión Caducada! :(');
			break;
			case 1002:
			$scope.user['alerta'] = ('Err [1002] => Usuario y/o Clave ' + 
										' incorrectos intente nuevamente :(');
			break;
			case 1003:
			$scope.user['alerta'] = ('Err [1003] => Favor llene todos' + 
														 ' los campos');
			break;
			case 1005:
			$scope.user['alerta'] = ('Err [1005] => Servidor no disponible :(');
			break;
		}
	};
});