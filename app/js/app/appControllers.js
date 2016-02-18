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
mediperbaricaApp.controller('historiesController', function($scope, $location, $routeParams,
    serviceHistories, serviceTreatments, serviceAntecedets, serviceSessions ){
    console.log('[Debug] Llamada a CTRL historiesController');
    //Variables de almacenamiento Datos
    $scope.lstHistoriesData = [];
    $scope.counter = 0;
    $scope.historyData = {};
    $scope.antecedentsData = [];
    $scope.statusMsg = '';

    //Metodo que define la funcion a llamar dependiendo de la plantilla que se muestre
    $scope.init = function(){
        //identificacion ur para llamar a funcion
        var mypath = $location.path();
        var reph = /\/presentar-historia\/\d/;
        var relh = /\/listar-historias/;
        var rech = /\/editar-historia/;
        //Seleccionamos las rutas y direccionamos a la primera que de true
        switch (true){
            case relh.test(mypath):
                $scope.listHistories();
                break;
            case reph.test(mypath):
                $scope.presentHistory();
                break;
            case rech.test(mypath):
                $scope.prepareFormHistory();
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
                $scope.counter = $scope.lstHistoriesData.length;
                //Llamamos a la funcion de manejo de status
                $scope.validHistoriesErrors(response.msg, response.data);
            },
            function(error){
                $scope.validHistoriesErrors(error.msg, error.data);
            }
        );  
    };
    
    //Metodo para presentar una historia
    $scope.presentHistory = function(){
        console.log('[Debug] llamda a metodo presentHistory');
        //llenamos los datos de la historia
        var responseHttp = serviceHistories.getHistory($routeParams.idHistory);
        responseHttp.then(
            function(response){
                if (response.msg == '2001'){
                    $scope.validHistoriesErrors(response.msg, response);
                    $location.path('/listar-historias');
                }else if(response.msg == '2002'){
                    $scope.validHistoriesErrors(response.msg, response);
                }else{
                    $scope.historyData = response.data[0];
                    $scope.getAntecedents($scope.historyData.id_paciente);
                    console.dir($scope.historyData);
                }
            },
            function(error){
                $scope.validHistoriesErrors(error.msg, error.data); 
            }
        );
    };
        
    //obtiene los antecedentes de un paciente
    $scope.getAntecedents = function(idPerson){
        var responseHttp = serviceAntecedets.getAntecedents(idPerson);
        responseHttp.then(
            function(response){
                $scope.antecedentsData = response.data;
            },function(error){
                $scope.validHistoriesErrors(response.msg, response.data);
            }
        );
    };
    
    //Inicia el formulario con los datos de las historias
    $scope.saveHistory = function(historyData){
        console.log('[Debug] Llamda a metodo saveHistory');
        var httpResponse = serviceHistories.saveHistory(historyData);
        httpResponse.then(function(response){
            if(response.msg == '3000'){
                $scope.saveAntecedents(historyData.id_paciente);
                $location.path('/presentar-historia/' + response.data);
            }else if(response.msg == '3001'){
                $location.path('/presentar-historia/' + response.data);
            }
            $scope.validHistoriesErrors(response.msg, response.data);
        },
            function(error){
            $scope.validHistoriesErrors('7777', error);
        })
    };
    
    //anade un antecedente al listado
    $scope.addAntecedent = function(antecedent){
        console.log('[Debug] Llamda a metodo saveHistory');
        //Verificacmo si se esta creando e editando la historia sino se añaden
        if($location.path() == '/crear-historia'){
            $scope.antecedentsData.push(
                    {antecedente: toTitleCase(antecedent.antecedente)});
            $scope.antecedent = {};
        }else{
            //guarda el antecedente en la base de datos
            antecedent['id_paciente'] = $scope.historyData.id_paciente;
            var httpresponse = serviceAntecedets.saveAntecedent(antecedent);
            httpresponse.then(
                function(response){
                    if(response.msg == '3000'){
                        $scope.antecedentsData.push(
                            {antecedente: toTitleCase(antecedent.antecedente)});
                        $scope.antecedent = {};
                    } else{
                        $scope.validHistoriesErrors(response.msg,response);
                    }   
                },
                function(error){
                alert('hubo un eror en lapeticion');
            });
        }
    };
    
    //elimina un antecedente del listado
    $scope.deleteAntecedent = function(antecedente){
        //Vertificamios si se esta creando o editando
        if($location.path() == '/crear-historia'){
            angular.forEach($scope.antecedentsData, function(value, key){
               if(value.antecedente == antecedente){
                   $scope.antecedentsData.splice(key,1);
               }
            });
        }else{
            console.dir(antecedente);
            console.dir($scope.antecedentsData);
            //elimina un antecedente de la lista
            var idAntecedent = 0;
            angular.forEach($scope.antecedentsData, function(value, key){
               if(value.antecedente == antecedente){
                   idAntecedent = value['id_antecedente']; 
               }     
            });
            //eliminamos el antecedente
            if(idAntecedent > 0){
                var httpresponse = serviceAntecedets.deleteAntecedent(idAntecedent);
                httpresponse.then(
                    function(response){
                        console.dir(response);
                        //si la consulta se ejecutra lo borramos de la lista
                        if(response.msg == '3003'){
                            angular.forEach($scope.antecedentsData, function
                                           (value, key){
                                if(value.antecedente == antecedente){
                                    $scope.antecedentsData.splice(key,1);
                                }
                            });
                        }else{
                            $scope.validHistoriesErrors(response.msg, response)
                        }
                    },
                    function(error){
                        alert('Error de envio solicitud HTTP');
                    });
            }
        }
    };
    
    //Verifica campos nulos si lo son no coloca active en el label
    $scope.isInputNull = function (data){
        if(typeof(data) == 'string'){
            return 'active';
        }
    };
    
    //prepara un formulario para la edicion
    $scope.prepareFormHistory = function(){
        var httpresponse = serviceHistories.getHistory($routeParams.idHistory);
        httpresponse.then(function(response){
            if(response.msg == '3002'){
                $scope.historyData = response.data[0];
                //obtenemos los antecedentes de la historia
                $scope.getAntecedents(response.data[0].id_paciente);
            }else{
                $scope.validHistoriesErrors(response.msg, response)
            }
            
        },function(error){
            $scope.validHistoriesErrors('7777', error);
        });
    };
    
    //Guarda el listado de antecedentes
    $scope.saveAntecedents = function(idPacient){
        if($scope.antecedentsData.length > 0){
            angular.forEach($scope.antecedentsData, function(value,key){            
            value.id_paciente = idPacient;
            var httpresponse = serviceAntecedets.saveAntecedent(value);
            httpresponse.then(function(response){
                $scope.validHistoriesErrors(response.msg, response);
            },function(error){
                $scope.validHistoriesErrors('7777', error);
            });
        }); 
        }else{
            $scope.validHistoriesErrors('2005', $scope.antecedentsData);
        }
  
    };
    
    //Valida los datos del formulario
    $scope.validDataForm = function(historyData){
        //cuando edita el form genra campos null
        if( /editar-historia\/\d/.test($location.path())){
            angular.forEach(historyData, function(value, key){
                if(value == null){
                    delete historyData[key];
                }
            });
        }
        
        //normalizamos el arreglo eliminar vacios y nulls 0
        angular.forEach(historyData, function(value,key){
            var mivalue = historyData[key];
            if(!/mail/.test(mivalue) || !/fecha_nacimiento/.test(mivalue)){
               historyData[key] = mivalue.toLowerCase();
               historyData[key] = toTitleCase(mivalue);
            }}); 
        
        //variable de condicion antes de evaluar el objeto
        var condition = true;
        
        //Variables obligatorioas con valores minimos
        var minimalValues = {
                'id_paciente' : '10',    
                'nombres' : '10',    
                'direccion' : '5',    
                'telefono' : '7',    
                'fecha_nacimiento' :'10' };
        $i = 0;
        //comprobamos la cantidad de datos y su condiciones
        angular.forEach(minimalValues, function(value, key){
            if(historyData[key]){
                $i ++;
                if(historyData[key].length < value){
               condition = false;   
            }    
            }
            
        });
        //mostramos el error
        if($i == 5){
            condition ? $scope.saveHistory(historyData) : $scope.validHistoriesErrors('2005',{});
        }else{
            $scope.validHistoriesErrors('2000',{});
        }
    };
    
    //Funcion que inicia el init del controller
    $scope.init();
    
    //Funcion encargada de presentar los errores en pantalla
    $scope.validHistoriesErrors = function(error, data){
        var statusDetail = showStatus(error, data);    
        Materialize.toast( statusDetail['message'],  2500);
    }
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