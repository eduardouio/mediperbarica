/*******************************************************************************
  Copyright 2014 Mediperbarica Todos los derechos reservados
  @autor: Eduardo Villota
  @date: 11-05-2016 23:44
  @version 0.2
  
 Factories:
  ['serviceHistories'],['serviceTreatments'],['serviceEmployees'],
  ['serviceAntecedets'],['serviceCustomers'],['serviceSessions'],
  ['serviceMachines'],['serviceCollections'],['serviceInvoices'],
  ['serviceLoadTemplates']
  
 Introduccion: Modulo encargado de manejar la funcionalidad de la aplicacion, 
 se encargda de realizar consultas y mostrar informacion CRUD
/******************************************************************************/

/**
Controllador encargado del inicio y cierre de sesion
**/
mediperbaricaApp.controller('loginController', function($scope, $location,
									$timeout, serviceLogin){
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


/*******************************************************************************
Controlador inicial es el que se carga en el home de la pagina

factories: ['serviceHistories'],['serviceTreatments'],['serviceEmployees'],
            ['serviceAntecedets'],['serviceCustomers'],['serviceSessions'],
            ['serviceMachines'],['serviceCollections'],['serviceInvoices'],
            ['serviceLoadTemplates']

Rutas
'/'
*******************************************************************************/
mediperbaricaApp.controller('startController', function($scope, $location,
   serviceHistories, serviceTreatments, serviceEmployees, serviceSessions,
   serviceMachines, serviceCollections, serviceInvoices){
    console.log('[Debug] Llamada a CTRL startController');
    
    
});

/*******************************************************************************
Controlador para historias y antecedentes

factories: [serviceHistories],[serviceTreatments],[serviceAntecedets], 
           [serviceSessions]

Rutas
'/listar-historias'
'/crear-historia'
'/editar-historia/:idHistory'
'/presentar-historia/:idHistory'
'/eliminar-historia/:idHistory'
*******************************************************************************/
mediperbaricaApp.controller('historiesController', function($scope, $location,
    serviceHistories, serviceTreatments, serviceAntecedets, serviceSessions ){
    console.log('[Debug] Llamada a CTRL historiesController');
    //Variables de almacenamiento Datos
    $scope.lstHistoriesData = {};
    $scope.counter = 0;
    $scope.historyData = {};
    $scope.antecedentsData = {};
    $scope.antecedentData = {};
    $scope.statusMsg = '';
    
    //Metodo que define la funcion a llamar dependiendo de la plantilla que se muestre
    $scope.init = function(){
        var mypath = $location.path();
        console.dir($location);
        console.log(mypath);
        switch (mypath){
            case '/listar-historias' :
                $scope.listHistories();
                break;
            case ('/presentar-historia/8'):
                $scope.presentHistory();
                break
        }
    };
    
    //Metodo para listar Historias '/listar-historias/'
    $scope.listHistories = function(){
        console.log('[Debug] llamda a listHistories');
        var responseHttp = serviceHistories.getHistories();
        responseHttp.then(
            //validamos la respuesta del server
            function(response){
                $scope.lstHistoriesData = response.data;
                //Llamamos a la funcion de manejo de status
                 $scope.validHistoriesErrors(response.msg, response.data);
            },
            function(error){
                $scope.validHistoriesErrors(error.msg, error.data);
            }
        )
        
    };
    
    //Metodo para presentar una historia
    $scope.presentHistory = function(){
        console.log('[Debug] llamda a metodo presentHistory')
    };
    
    
    //Funcion que inicia el init del controller
    $scope.init();
    
    //Funcion encargada de presentar los errores en pantalla
    $scope.validHistoriesErrors = function(error, data){
        console.log('[Debug] llamada a metodo validHistoriesErrors' + error);
        var statusDetail = showStatus(error, data);    
        Materialize.toast( statusDetail['message'],  3000);
    };
    
    
});

/*******************************************************************************
Controlador para tratamientos y sesiones

Factories:
  ['serviceHistories'],['serviceTreatments'],['serviceEmployees'],
  ['serviceAntecedets'],['serviceSessions'], ['serviceMachines'],
  ['serviceCollections'],['serviceInvoices'],

Rutas
'/listar-tratamientos'
'/crear-tratamiento/:idHistory'
'/editar-tratamiento/:idTreatment'
'/eliminar-tratamiento/:idTreatment'
*******************************************************************************/
mediperbaricaApp.controller('treatmentsController', function($scope, $location,
    serviceHistories, serviceTreatments, serviceEmployees,  serviceAntecedets, 
    serviceSessions, serviceMachines, serviceCollections, serviceInvoices){
    console.log('[Debug] Llamada a CTRL treatmentsController');
    
    
});
                            
/*******************************************************************************	
Controlador para personal

Factories:
  ['serviceTreatments'],['serviceEmployees'],['serviceSessions']
  
Rutas
'/crear-personal'
'/editar-personal/:idPersonal'
'/listar-personal'
'/presentar-personal/:idPersonal'
'/eliminar-personal/:idPersonal'
*******************************************************************************/	
mediperbaricaApp.controller('personalController', function($scope, $location, 
    serviceTreatments, serviceEmployees, serviceSessions){
    console.log('[Debug] Llamada a CTRL personalController');
    
    
});

/*******************************************************************************
Controlador para facturas
 Factories:
  ['serviceHistories'],['serviceTreatments'],['serviceCustomers'],
  ['serviceCollections'],['serviceInvoices']
 
Rutas
'/emitir-factura'
'/anular-factura/:idInvoice'
'/presentar-factura/:idInvoice
*******************************************************************************/
mediperbaricaApp.controller('invoiceController', function($scope, $location,
    serviceHistories, serviceTreatments, serviceCustomers, serviceCollections, 
                                                           serviceInvoices){
    console.log('[Debug] Llamada a CTRL invoiceController');
    
    
});

/*******************************************************************************
Controlador para clientes

 Factories:
  ['serviceCustomers'],['serviceInvoices']
  
Rutas
'/crear-cliente'
'/editar-cliente/:idCustomer
'/eliminar-cliente/:idCustomer'
'/presentar-cliente/:idCustomer'
*******************************************************************************/
mediperbaricaApp.controller('customerController', function($scope, $location,
                                serviceCustomers, serviceInvoices){
    console.log('[Debug] Llamada a CTRL customerController');
    
    
});

/*******************************************************************************
Controlador para Equipos

Factories:
  ['serviceTreatments'],['serviceSessions'], ['serviceMachines']
  
Rutas
'/crear-equipo'
'/editar-equipo/:idMachine'
'/eliminar-equipo/:idMachine'
'/presentar-equipo/:idMachine'
*******************************************************************************/
mediperbaricaApp.controller('machineController', function($scope, $location,
                    serviceTreatments, serviceSessions, serviceMachines){
    console.log('[Debug] Llamada a CTRL machineController');
    
    
});

/*******************************************************************************                            
Controlador para usuarios

Rutas
'/crear-usuario'
'/eliminar-usuario/:idUser'
'/suspender-usuario/:idUser'
'/editar-usuario/:idUser'
*******************************************************************************/                            
mediperbaricaApp.controller('userController', function($scope, $location){
    console.log('[Debug] Llamada a CTRL userController');
    
    
});

/*******************************************************************************
Controlador para dar informacion acerca de la aplicacion

Rutas
'/acerca'
*******************************************************************************/
mediperbaricaApp.controller('aboutController', function($scope, $location){
    console.log('[Debug] Llamada a CTRL aboutController');
    
    
});

/*******************************************************************************
Controlador que muestra error de comunicacion con el server

Rutas
'/error-comunicacion
*******************************************************************************/
mediperbaricaApp.controller('errorController', function($scope, $location){
    console.log('[Debug] Llamada a CTRL errorController');
    
    
});