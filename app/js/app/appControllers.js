/*******************************************************************************
  Copyright 2014 Mediperbarica Todos los derechos reservados
  @autor: Eduardo Villota
  @date: 11-05-2016 23:44
  @version 0.2
 
 Introduccion: Modulo encargado de manejar la funcionalidad de la aplicacion, 
 se encargda de realizar consultas y mostrar informacion CRUD
/******************************************************************************/

/**
Controllador encargado del inicio y cierre de sesion
**/
mediperbaricaApp.controller('loginController', function($scope, $location,
									$rootScope, $timeout, serviceLogin){
	//Envia el formulario al server
	$scope.login = function(userData){
		//validamos los datos del usuarios
		var promiseLogin = serviceLogin.login(userData);
		promiseLogin.then(
			function(response){
				console.dir(response);
				$scope.redirectToHome();
			}, function(error){
				console.dir(error);
			});
	};

	//Valida los datos del user
	$scope.validForm = function(userData){
		var condition = false;
		console.dir(userData);
		if(userData.username && userData.password){
			if(userData.username !== '' && userData.password !== ''){
				condition = true;
			}
		}

		if(condition){
			$scope.login(userData);
		}else{
			console.log('Error en dfatos')
		}
	};

	$scope.logon = function(){
		//Cierra la sesion del usuario
		var promiseLogin = serviceLogin.logon();
		promiseLogin.then(
			function(response){
				console.dir(response);
				$scope.redirectToHome();
			}, function(error){
				console.dir(error);
			});
	};

	//redirecciona al inicio de la aplicacion
	$scope.redirectToHome = function(){
		var url = host + 'index.php/inicio'
		function redirect(){
			window.location = url;
		}

		setTimeout(redirect(),3000);

	}

});


/**
Controlador de la pagina principal, muestra informacion relevante del sistema
**/
mediperbaricaApp.controller('startController', function($scope, $location,
												$rootScope, $timeout){

});

/**
Controllador 
**/
mediperbaricaApp.controller('historiesController', function($scope, $location,
			$rootScope, $timeout, serviceHistories,serviceLoadTemplates, $sce){
	console.log('[Debug] llamad a Controller listHistories');

	$scope.counter = 0;
	$scope.listHistories = function(){
		console.log('[Debug] llamada a funcion listHistories()');
		var promiseHistories = serviceHistories.getHistories();
		promiseHistories.then(
			function(response){
				$scope.historias = response.data;
				console.log($scope.historias.length);
				$scope.counter = $scope.historias.length;
				console.dir(response);
			},
			function(error){
				console.log('[Debug] Hubo un problema para recuperar las hisotiras');
				console.dir(error);
			}
			);
	};

	//Metodo encargado de mostrar una historia
	$scope.presentHistory = function (idPerson){
		console.log('[Debug] Llamada funcion presentHistory ' + idPerson);

			
	};
	//El controlador inicia obteniendo un listado completo de las historias
	$scope.listHistories();


});



/**
Controllador 
**/
mediperbaricaApp.controller('createHistoryController', function($scope, $location,
												$rootScope, $timeout){

});


/**
Controllador 
**/
mediperbaricaApp.controller('editHystory', function($scope, $location,
												$rootScope, $timeout){

});


/**
Controllador 
**/
mediperbaricaApp.controller('deleteHystory', function($scope, $location,
												$rootScope, $timeout){

});


/**
Controllador 
**/
mediperbaricaApp.controller('presentHystory', function($scope, $location,
												$rootScope, $timeout){

});


/**
Controllador 
**/
mediperbaricaApp.controller('assigAntecedent', function($scope, $location,
												$rootScope, $timeout){

});


/**
Controllador 
**/
mediperbaricaApp.controller('presentTreatment', function($scope, $location,
												$rootScope, $timeout){

});


/**
Controllador 
**/
mediperbaricaApp.controller('presentTreatment', function($scope, $location,
												$rootScope, $timeout){

});


/**
Controllador 
**/
mediperbaricaApp.controller('createTreatment', function($scope, $location,
												$rootScope, $timeout){

});


/**
Controllador 
**/
mediperbaricaApp.controller('editTreatment', function($scope, $location,
												$rootScope, $timeout){

});


/**
Controllador 
**/
mediperbaricaApp.controller('deleteTreatment', function($scope, $location,
												$rootScope, $timeout){

});


/**
Controllador 
**/
mediperbaricaApp.controller('aboutApp', function($scope, $location,
												$rootScope, $timeout){

});


/**
Controllador 
**/
mediperbaricaApp.controller('errorController', function($scope, $location,
												$rootScope, $timeout){

});
