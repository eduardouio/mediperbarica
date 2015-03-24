/*!
 * Fichero encargado de trabajar con el personal
 * http://mediperbarica.com.ec/
 *
 *
 * Copyright 2014 Mediperbarica Todos los derechos reservados
 * @autor: Eduardo Villota
 * @date: 20-03-2015 00:23
 */

/**
*  Module de insersion de personas
*
* Co este modulo se prueba la infromcion que se
*/
var mediperbaricaApp = angular.module('mediperbaricaApp', ['ngRoute']);


/**
Configuracion de las rutas a las plantillas
*/

mediperbaricaApp.config(function($locationProvider, $routeProvider){
	
	//$locationProvider.html5Mode(true);
	$routeProvider
	.when('/pacientes',{
		templateUrl : 'tplhtml/pacientes.html',
		controllerAs : 'pacientes',
		controller : 'PacientesController'
	})
	.when('/personal',{
		templateUrl : 'tplhtml/personal.html',
		controllerAs : 'personal',
		controller: 'PersonalController'
	})
	.when('/tratamientos',{
		templateUrl : 'tplhtml/tratamientos.html',
		controllerAs : 'tratamientos',
		controller: 'TratamientosController'
	})
	.when('/clientes',{
		templateUrl : 'tplhtml/clientes.html',
		controllerAs : 'clientes',
		controller: 'ClientesController'
	})
	.when('/facturacion',{
		templateUrl : 'tplhtml/facturacion.html',
		controllerAs : 'facturacion',
		controller: 'FacturacionController'
	})
		.when('/usuarios',{
		templateUrl : 'tplhtml/usuarios.html',
		controllerAs : 'usuarios',
		controller: 'UsuariosController'
	})
			.when('/acerca/:idCliente',{
		templateUrl : 'tplhtml/acerca.html',
		controller: 'AcercaController'
	})
	.otherwise({ redirectTo: '/' 
	});
});


/**
Controlador encargado de manejar el personal
*/
mediperbaricaApp.controller('PersonalController', function ($scope, $http) {
	
	$scope.persona = {
		'id_personal' : '',
		'nombres' : '',
		'direccion' : 'null',
		'telefono_fijo' : 'null',
		'celular' : 'null',
		'mail' : '',
		'notas' : ''
	};

	/**
	* Valida los datos del formularios y permite mostrar el boton de enviar
	* Valores requeridos cedula, nombres, mail)
	* @return Boolean
	*/
	$scope.validarFrmPersonal = function(){
		$scope.persona.id_personal = $scope.id_personal;
		$scope.persona.nombres = $scope.nombres;
		$scope.persona.direccion = $scope.direccion;
		$scope.persona.telefono_fijo = $scope.telefono_fijo;
		$scope.persona.celular = $scope.celular;
		$scope.persona.mail = $scope.mail;
		$scope.persona.notas = $scope.notas;
		$scope.eviarForm();
	};

	/**
	* Envia el formulario validado al server
	* @return Boolean
	*/
	$scope.eviarForm = function() {
		 console.log('Envioado a'  + host);
		 console.log($scope.persona);
		 console.log($scope.persona.nombres = "Eduardo Villota");
		 var request = $http({
		 	method: "post",
		 	url: 'http://localhost/aplicacion/index.php/personal/registrar',
		 	data : {
		 			'id_personal' : $scope.id_personal,
					'nombres' : $scope.nombres,
					'direccion' : $scope.direccion,
					'telefono_fijo' : $scope.telefono_fijo,
					'celular' : $scope.celular,
					'mail' : $scope.mail,
					'notas' : $scope.notas
		 			},
		 	headers : {'Content-Type' : 'Aplication/x-www-form-urlencoded'}
		 });

		 request.success(function (data) {
		 	$scope.id_personal = '';
			$scope.nombres = '';
			$scope.direccion = '';
			$scope.telefono_fijo = '';
			$scope.celular = '';
			$scope.mail = '';
			$scope.notas = '';
		 	alert('Se guardo el registro ' + data);
		 });
	};

	
	/**
	* Limpia el scope de los datos del formulario
	*/
	$scope.limpiarForm = function (){
		$scope.id_personal = '';
		$scope.nombres = '';
		$scope.direccion = '';
		$scope.telefono_fijo = '';
		$scope.celular = '';
		$scope.mail = '';
		$scope.notas = '';
	};

	/**
	* Cierra el formulario de contactos
	*/
	$scope.cerrarForm = function(){
			
	};

});

/**
Controlador encargado de manjar los pacientes
*/
mediperbaricaApp.controller('PacientesController', [function ($scope) {
	// Contenido del controlador para pacientes
}]);


/**
Controlador encargado de manejar los tratamamientos
*/

mediperbaricaApp.controller('TratamientosController', [function ($scope) {
	//contenido del controlador para tratamientos
}]);


/**
controlador encargado de manejar a los clientes
*/
mediperbaricaApp.controller('ClientesController', [function ($scope) {
 //contenido del controlador de clientes

}]);


/**
controlador encargado de manejar la facturacion
*/
mediperbaricaApp.controller('FacturacionController', [function ($scope) {
	//contenido del controlador de facturacion
}]);


/**
Controlador para los usuarios 
*/
mediperbaricaApp.controller('UsuariosController', [function ($scope){
	//contenido encargado dem manejar los uusarios
}]);

/**
Controlador acerca de
*/
mediperbaricaApp.controller('AcercaController', [function ($scope, idCliente){
	alert(idCliente);
	//contendio de la vista acerca de
}]);
