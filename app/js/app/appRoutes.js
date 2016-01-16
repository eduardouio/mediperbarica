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

	.when('/crear-personal',{
		templateUrl : host + 'tplhtml/templates/presentar-personal-tpl.html',
		controller : ''
	})

	.when('/presentar-personal/:idPersonal',{
		templateUrl : host + 'tplhtml/templates/presentar-personal-tpl.html',
		controller : ''
	})

	.when('/listar-historias',{
		templateUrl : host + 'tplhtml/templates/lista-historias-tpl.html',
		controller : 'listHistories'
	})

	.when('/crear-historia',{
		templateUrl : host + 'tplhtml/forms/frm-historia-tpl.html',
		controller: 'createHistoryController'
	})

	.when('/editar-historia/:historyID',{
		templateUrl : host + 'tplhtml/forms/frm-historia-tpl.html',
		controller : 'editHystory'
	})

	.when('/eliminar-historia/:historyID',{
		templateUrl : host + 'tplhtml/templates/vacio.html',
		controller : 'deleteHystory'
	})

	.when('/presentar-historia/:historyID',{
		templateUrl : host + 'tplhtml/templates/presentar-historia-tpl.html',
		controller : 'presentHystory'
	})

	.when('/asignar-antencedente/:idPerson',{
		templateUrl : host + 'tplhtml/forms/frm-antecedente-tpl.html',
		controller : 'assigAntecedent'
	})

	.when('/mostrar-antecedente/:idPerson',{
		templateUrl : host + 'tplhtml/templates/modal-antecedente-tpl.html',
		controller : ''
	})

	.when('/eliminar-antencedente/:idAntecedent',{
		templateUrl : host + 'tplhtml/forms/frm-antecedente-tpl.html',
		controller : 'assigAntecedent'
	})
	.when('/listar-antencedentes/:idPerson',{
		templateUrl : host + 'tplhtml/forms/frm-antecedente-tpl.html',
		controller : 'assigAntecedent'
	})
	.when('/editar-antencedente/:idAntecedent',{
		templateUrl : host + 'tplhtml/forms/frm-antecedente-tpl.html',
		controller : 'assigAntecedent'
	})

	.when('/listar-tratamientos',{
		templateUrl : host + 'tplhtml/templates/listar-tratamientos-tpl.html',
		controller : 'listTreatment'
	})

	.when('/presentar-tratamiento/:idTreatment',{
		templateUrl : host + 'tplhtml/templates/presentar-tratamiento-tpl.html',
		controller : 'presentTreatment'
	})

	.when('/crear-tratamiento/:idPerson',{
		templateUrl : host + 'tplhtml/forms/frm-tratamiento-tpl.html',
		controller : 'createTreatment'
	})

	.when('/editar-tratamiento/:idTreatment' , {
		templateUrl : host + 'tplhtml/forms/frm-tratamiento-tpl.html',
		controller : 'editTreatment'
	})

	.when('/eliminar-tratamiento/:idTreatment',{
		templateUrl : host + 'tplhtml/templates/vacio.html',
		controller : 'deleteTreatment'
	})

	.when('/acerca',{
		templateUrl : host + 'tplhtml/templates/acerca-app-tpl.html',
		controller : 'aboutApp'
	})

	.when('/error',{
		templateUrl : host + 'tplhtml/templates/error-server-tpl.html',
		controller : 'errorController'
	})

	.when('/asignar-sesion/:idTreatment',{
		templateUrl : host + 'tplhtml/templates/modal-sesion-tpl.html',
		controller : 'deleteHystory'
	})

	.when('/eliminiar-sesion/:idSesion',{
		templateUrl : host + 'tplhtml/templates/vacio.html',
		controller : 'deleteHystory'
	})

	.when('/editar-sesion/:idSesion',{
		templateUrl : host + 'tplhtml/templates/vacio.html',
		controller : 'deleteHystory'
	})

	.when('/listar-sesiones/:idTreatment',{
		templateUrl : host + 'tplhtml/templates/vacio.html',
		controller : 'deleteHystory'
	})

	.when('/nueva-factura',{
		templateUrl : host + 'tplhtml/forms/frm-factura-tpl.html',
		controller : ''
	})

	.when('/listar-facturas',{
		templateUrl : host + 'tplhtml/forms/frm-factura-tpl.html',
		controller : ''
	})

	.when('/ver-cliente/:idCoustumer',{
		templateUrl : host + 'tplhtml/templates/modal-cliente-tpl.html',
		controller : ''
	})

	.when('/sin-url',{
		templateUrl : host + 'tplhtml/templates/vacio.html',
		controller : 'deleteHystory'
	})
	.otherwise({redirectTo : '/'});

});