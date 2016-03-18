/*******************************************************************************
  Copyright 2014 Mediperbarica Todos los derechos reservados
  @autor: Eduardo Villota
  @date: 11-05-2016 23:44
  @version 0.2
 
 Introduccion: Modulo encargado de manejar las rutas de la aplicacion

 Se configura la relacion entre controladores y rutas en el navegador
/******************************************************************************/

mediperbaricaApp.config(function($locationProvider, $routeProvider){
	//Se indica el patron Url Final la base esta en la vista del pie de pagina
	//se lo mantiene ahi para que herede la configuracion global de PHP
	$routeProvider
	
	.when('/',{
		templateUrl : host + 'tplhtml/templates/inicio-tpl.html',
		controller : 'startController'
	})

	.when('/listar-historias',{
		templateUrl : host + 'tplhtml/templates/listar-historias-tpl.html',
		controller : 'historiesController'
	})

	.when('/crear-historia',{
		templateUrl : host + 'tplhtml/forms/frm-historia-tpl.html',
		controller : 'historiesController'
	})

	.when('/editar-historia/:idHistory',{
		templateUrl : host + 'tplhtml/forms/frm-historia-tpl.html',
		controller : 'historiesController'
	})	

	.when('/presentar-historia/:idHistory',{
		templateUrl : host + 'tplhtml/templates/presentar-historia-tpl.html',
		controller : 'historiesController'
	})		

	.when('/listar-tratamientos',{
		templateUrl : host + 'tplhtml/templates/listar-tratamientos-tpl.html',
		controller : 'treatmentsController'
	})

	.when('/crear-tratamiento/:idHistory',{
		templateUrl : host + 'tplhtml/forms/frm-tratamiento-tpl.html',
		controller : 'treatmentsController'
	})

	.when('/editar-tratamiento/:idTreatment',{
		templateUrl : host + 'tplhtml/forms/frm-tratamiento-tpl.html',
		controller : 'treatmentsController'
	})

	.when('/presentar-tratamiento/:idTreatment',{
		templateUrl : host + 'tplhtml/templates/presentar-tratamiento-tpl.html',
		controller : 'treatmentsController'
	})

	.when('/eliminar-tratamiento/:idTreatment',{
		templateUrl : host + 'tplhtml/templates/presentar-tratamiento-tpl.html',
		controller : 'treatmentsController'
	})

	.when('/crear-personal',{
		templateUrl : host + 'tplhtml/forms/frm-presonal-tpl.html',
		controller : 'personalController'
	})

	.when('/editar-personal/:idPersonal',{
		templateUrl : host + 'tplhtml/froms/frm-presonal-tpl.html',
		controller : 'personalController'
	})

	.when('/listar-personal',{
		templateUrl : host + 'tplhtml/templates/listar-personal-tpl.html',
		controller : 'personalController'
	})

	.when('/presentar-personal/:idPersonal',{
		templateUrl : host + 'tplhtml/templates/presentar-personal-tpl.html',
		controller : 'personalController'
	})

	.when('/eliminar-personal/:idPersonal',{
		templateUrl : host + 'tplhtml/templates/presentar-personal-tpl.html',
		controller : 'personalController'
	})

	.when('/emitir-factura/:valorMax',{
		templateUrl : host + 'tplhtml/forms/frm-factura-tpl.html',
		controller : 'invoiceController'
	})

	.when('/anular-factura/:idInvoice',{
		templateUrl : host + 'tplhtml/templates/presentar-factura-tpl-html',
		controller : 'invoiceController'
	})

	.when('/presentar-factura/:idInvoice',{
		templateUrl : host + 'tplhtml/templates/presentar-factura-tpl-html',
		controller : 'invoiceController'
	})

	.when('/crear-cliente',{
		templateUrl : host + 'tplhtml/forms/frm-cliente-tpl.html',
		controller : 'customerController'
	})

	.when('/editar-cliente/:idCustomer',{
		templateUrl : host + 'tplhtml/forms/frm-cliente-tpl.html',
		controller : 'customerController'
	})

	.when('/eliminar-cliente/:idCustomer',{
		templateUrl : host + 'tplhtml/templates/presentar-cliente-tpl.html',
		controller : 'customerController'
	})

	.when('/presentar-cliente/:idCustomer',{
		templateUrl : host + 'tplhtml/templates/presentar-cliente-tpl.html',
		controller : 'customerController'
	})

	.when('/crear-equipo',{
		templateUrl : host + 'tplhtml/froms/frm-equipo-tpl.html',
		controller : 'machineController'
	})

	.when('/editar-equipo/:idMachine',{
		templateUrl : host + 'tplhtml/froms/frm-equipo-tpl.html',
		controller : 'machineController'
	})

	.when('/eliminar-equipo/:idMachine',{
		templateUrl : host + 'tplhtml/templates/presentar-equipo-tpl.html',
		controller : 'machineController'
	})

	.when('/presentar-equipo/:idMachine',{
		templateUrl : host + 'tplhtml/templates/presentar-equipo-tpl.html',
		controller : 'machineController'
	})

	.when('/crear-usuario',{
		templateUrl : host + 'tplhtml/forms/frm-user-tpl.html',
		controller : 'userController'
	})

	.when('/eliminar-usuario/:idUser',{
		templateUrl : host + 'tplhtml/forms/frm-user-tpl.html',
		controller : 'userController'
	})

	.when('/suspender-usuario/:idUser',{
		templateUrl : host + 'tplhtml/forms/frm-user-tpl.html',
		controller : 'userController'
	})

	.when('/editar-usuario/:idUser',{
		templateUrl : host + 'tplhtml/forms/frm-user-tpl.html',
		controller : 'userController'
	})

	.when('/acerca',{
		templateUrl : host + 'tplhtml/templates/acerca-app-tpl.html',
		controller : 'aboutController'
	})

	.when('/error-comunicacion',{
		templateUrl : host + 'tplhtml/templates/error-server-tpl.html',
		controller : 'errorController'
	})

	.otherwise({redirectTo : '/'});

});