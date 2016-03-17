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
    $routeParams, $rootScope,
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
    
    //Habilitra o deshabilirta el boton de borrado
    $scope.enableDisableButton = function(){
        if($scope.nroTreatments == '0' || $scope.nroTreatments == 0 ){
            return false;
        }else{
            return true;
        }
    }

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
                    $scope.nroTreatments = 0;
                    //obtenemos el numero de tratamientos de la historia
                    var httpResponse = serviceTreatments.getPersonTratments(
                                                $scope.historyData.id_paciente);
                    httpResponse.then(
                        function(response){
                            if(response.msg == '3002'){
                                $scope.nroTreatments = response.data.length;
                            }
                        },function(error){
                            $scope.validHistoriesErrors('7777', error);
                        });
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
                $scope.validHistoriesErrors(error.msg, error.data);
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
    
    //Elimina una historia solo si esta no tiene tratamientos
    $scope.deleteHistory = function(idPerson){
        console.log('[Debug] Llamada a method deleteHistory');
        if(idPerson > 0){
            //eliminamos los antecedentes
            var httpResponse = serviceAntecedets.deleteAntecedentsHistory(idPerson);
            httpResponse.then(function(response){
                if(response.msg == '3003'){
                    //eliminamos la historia
                    var httpResponse = serviceHistories.deleteHistory(idPerson);
                    httpResponse.then(function(response){
                        if(response.msg == '3003'){
                            $scope.validHistoriesErrors(response.msg, response)
                            $location.path('/listar-historias');
                        }else{
                            $scope.validHistoriesErrors(response.msg, response)
                        }
                    },function(error){
                        $scope.validHistoriesErrors('7777', error);
                    });
                }else{
                    $scope.validHistoriesErrors(response.msg, response);
                }
            },function(error){
                $scope.validHistoriesErrors('7777', error);
            });
            
        }
    };
    
    //anade un antecedente al listado
    $scope.addAntecedent = function(antecedent){
        console.log('[Debug] Llamda a metodo addAntecedent');
        //Verificacmo si se esta creando e editando la historia sino se añaden
        if($location.path() == '/crear-historia'){
            $scope.antecedentsData.push(
                    {antecedente: toTitleCase(antecedent.antecedente)});
            $scope.antecedent = {};
        }else{
            //guarda el antecedente en la base de datos
            antecedent['id_paciente'] = $scope.historyData.id_paciente;
            var httpresponse = serviceAntecedets.saveAntecedent(antecedent);
            console.dir($scope.antecedentsData);
            httpresponse.then(
                function(response){
                    if(response.msg == '3000'){
                        //cuando editamos el no existe el array por eso lo creamos
                        if(typeof($scope.antecedentsData) == 'undefined'){
                            $scope.antecedentsData = [];
                        }   
                        $scope.antecedentsData.push(
                            {antecedente: toTitleCase(antecedent.antecedente),
                            id_antecedente : response.data});
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
            //elimina un antecedente de la lista
            var idAntecedent = 0;
            angular.forEach($scope.antecedentsData, function(value, key){
               if(value.antecedente == antecedente){
                   idAntecedent = value['id_antecedente']; 
               }     
            });
            //eliminamos el antecedente siempre y cuando exista en la base de datos
            if(idAntecedent > 0){
                var httpresponse = serviceAntecedets.deleteAntecedent(idAntecedent);
                httpresponse.then(
                    function(response){
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
            //Elimina antecedentes agregados en la edicion
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
            if(historyData[key] && condition){
                $i ++;
                if(historyData[key].length < value){
               condition = false; 
            }    
            }
            
        });
        //mostramos el error
        if($i == 5){
            condition ? $scope.saveHistory(historyData) : 
                                        $scope.validHistoriesErrors('2005',{});
        }else{
            $scope.validHistoriesErrors('2000',{});
        }
    };
    
    //Funcion que inicia el init del controller
    $scope.init();
    
    $scope.$on('listHistories', function(){return $scope.listHistories(); alert('Hola');});

    
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
    $routeParams,
    serviceHistories, serviceTreatments, serviceEmployees,  serviceAntecedets, 
    serviceSessions, serviceMachines, serviceCollections, serviceInvoices){
    console.log('[Debug] Llamada a CTRL treatmentsController');
    
    //Variables de almacenamiento Datos
    $scope.counter = 0;
    $scope.lsTreatmentsData = [];
    $scope.lstHistoriesData = [];
    $scope.lsEmployeesData = [];
    $scope.sessionsData = [];
    $scope.idCustomerName = [];
    $scope.idEmployeeName = [];
    $scope.counter = 0;
    $scope.historyData = {};
    $scope.employeedData = {};
    $scope.treatmentData = {};
    $scope.statusMsg = '';

    //Metodo que define la funcion a llamar dependiendo de la plantilla que se muestre
    $scope.init = function(){
        //identificacion ur para llamar a funcion
        var mypath = $location.path();
        var relt = /\/listar-tratamientos/;
        var rept = /\/presentar-tratamiento\/\d/;
        var rect = /\/crear-tratamiento\/\d/;
        var reet = /\/editar-tratamiento\/\d/;
        //Seleccionamos las rutas 'r3;365lytmkhlouop67iy direccionamos a la primera que de true
        switch (true){
            case relt.test(mypath):
                $scope.listTreartments();
                break;
            case rept.test(mypath):
                $scope.presentTreatment();
                break;                                
            case reet.test(mypath):
                $scope.prepareFormTreatment($routeParams.idTreatment);
                break;
            case rect.test(mypath):
                $scope.prepareFormTreatment(null);
        }
    };

    //Metodo encargado de listar los tratamientos
    $scope.listTreartments = function(){
        console.log('[Debug] Lamada a metodo listTreartments');
        var httpResponse = serviceTreatments.getTratments();
        httpResponse.then(
            function(response){
                $scope.validTreatmentsErrors(response.msg, response.data);
                $scope.lsTreatmentsData = response.data;
            },function(error){
                $scope.validTreatmentsErrors('7777', error);
            });
    };

    //Metodo encargado de presentar un tratamiento
    //@parmam idTreatment recibido por URL
    $scope.presentTreatment = function(){
        console.log('[Debug] Lamada a metodo presentTreatment');

        //identificamos el tratamiento y lo traemos 
        var httpResponse = serviceTreatments.getTreatment(
                                                $routeParams.idTreatment);
        httpResponse.then(
            function(response){
                if(response.msg == '3002'){
                    $scope.treatmentData = response.data[0];
                    //obtenemos los datos de la hiostoria
                    getHistory($scope.treatmentData.id_paciente);
                    getProfessional($scope.treatmentData.id_personal);
                    getSessions($scope.treatmentData.id_tratamiento);
                }else{
                    $scope.validTreatmentsErrors(response.msg, response);    
                }
            },
            function(error){
                $scope.validTreatmentsErrors('7777', error);
            });
        
    };

    //retorna los datos de una historia
    function getHistory(idPerson){
        var httpResponse = serviceHistories.getHistoryFromId(idPerson);
        httpResponse.then(
            function(response){
                if(response.msg == '3002'){
                    $scope.historyData =   response.data[0];                    
                }else{
                    $scope.validTreatmentsErrors(response.msg, response);    
                }
            },function(error){
                    $scope.validHistoriesErrors('7777',error);                
            });
    }

    //retorna datos de un profesional
    function getProfessional(idEmployee){
        var httpResponse = serviceEmployees.getEmployee(idEmployee);
        httpResponse.then(
            function(response){
                if(response.msg == '3002'){
                    $scope.employeedData = response.data[0];
                }else{
                    $scope.validTreatmentsErrors(response.msg, response);    
                }
            },function(error){
                $scope.validHistoriesErrors('7777',error);                
        });
    }

    function getSessions(idTreatment){
        var httpResponse = serviceSessions.getSessions(idTreatment);
        httpResponse.then(
            function(response){
                if(response.msg == '3002'){
                    $scope.sessionsData = response.data;
                    console.dir($scope.sessionsData);
                }else{
                    $scope.validTreatmentsErrors(response.msg, response);    
                }
            },function(error){
                $scope.validHistoriesErrors('7777',error);                
        });   
    }


    //obtiene el detalle de las sesiones del tratamiento
    $scope.getSesionsTreatment = function(idTreatment){
        console.log('[Debug] Lamada a metodo getSesionsTreatment');

    };

    //Guarda un tratamiento
    $scope.saveTreatment = function(treatmentData){
        console.log('[Debug] Lamada a metodo saveTreatment');
        var httpPromise = serviceTreatments.saveTreatment(treatmentData);
        httpPromise.then(
        function(response){
            if(response.msg == '3000'){
                $location.path('/presentar-tratamiento/' + response.data);
            }else if(response.msg == '3001'){
                $location.path('/presentar-tratamiento/' + 
                                            response.data.id_tratamiento);
            }else{
                $scope.validTreatmentsErrors(response.msg, response.data);                
            }
        },function(error){
            $scope.validTreatmentsErrors(7777, error);
        });

    };

    //Valida el fomulario de tratamientos
    $scope.validDataTreatmentForm = function(idPerson, idEmployee, 
                                                        treatmentData){
        console.log('[Debug] Lamada a metodo validTreatmentForm');
        //creamos el objeto a enviar
        if(!idPerson){
            alert('Ingrese un nombre y seleccionelo de la lista');
        }

        var myTreatment = treatmentData;
        myTreatment['id_paciente'] = idPerson
        myTreatment['id_personal'] = idEmployee;
        // normalizamos el arreglo y contamos los campos
        var old = myTreatment.motivo_tratamiento.toLowerCase();
        myTreatment.motivo_tratamiento = toTitleCase(old);

        //variable de condicion antes de evaluar objeto
        var condition = true;

        //Valores minimos de los campos
        var minimalValues = {
            'id_paciente': '10',
            'id_personal': '10',
            'motivo_tratamiento': '5',
            'nro_sesiones': '1',
            'costo': '1',
            'descuento': '1'
        };

        $i = 0;
        if(myTreatment.costo > 0 
                    && myTreatment.nro_sesiones > 0 
                    && myTreatment.descuento > -1){
            //comprobamos la cantidad de datos
            angular.forEach(minimalValues, function(value, key){
                if(myTreatment[key] && condition){
                    $i++;
                    if(myTreatment[key].length < value){
                        condition = false;
                    }
                }
            });
    
        }else{
            alert('Los Valores de sesiones costos y ' +
                                    ' Descuentos no pueden ser Cero.');
            condition = false;
        }
        //evaluamos los errores
        if($i == 6){
            condition ? $scope.saveTreatment(myTreatment) :
                                $scope.validTreatmentsErrors('2005',{});
        }else{
            $scope.validTreatmentsErrors('2000',{});
        }
    };

    //Elimina un tratamiento sin sesiones hasta 1 hora despues
    $scope.deleteTreatment = function(idTreatment){
        console.log('[Debug] Lamada a metodo deleteTreatment');

    };


    //añade una sesion al tratamiento
    $scope.addSession = function(idTreatment){
        console.log('[Debug] Lamada a metodo addSession');

    };

    //Elimina una sesion del tratamiento
    $scope.deleteSession = function(session){
        console.log('[Debug] Lamada a metodo deleteSession');

    };

    //prepara el formulario para la edicion o un registro nuevo de los trata
    //mientos por defecto una de las variables es null cuando la otra tiene valo
    //@param idTreatment (int) si es un numero lo que se hace es editar el trar
    //@param idHistori (int) si es cero se listan las historias en el formulario
    // sino puede ser el numero de cedula del paciente por defecto el idTratment es Cero
    $scope.prepareFormTreatment = function(idTreatment){
        console.log('[Debug] llamada a metodo prepareFormTreatment');

        //validaciones de edicion para que no modifiquen los autocopmpletes


        //genera un diccionario clave valor de los clientes
        //@param JSON datos clientes
        //@return JSON datos calve valor value:1722919725,display:'Eduardo Villota'
        $scope.keyValueCustomer = function(searchText){
            var obj = [];
            angular.forEach($scope.lstHistoriesData, function(value, key){
                var nombres = angular.lowercase(searchText);
                var cliente = angular.lowercase(value.nombres);
                if(cliente.indexOf(nombres) > 0){
                    obj.push({value : value.id_paciente, 
                            display: value.nombres});
                }else if (cliente.indexOf(nombres) ===   0){
                    obj.push({value : value.id_paciente, 
                            display: value.nombres});
                }
            }); 
            return obj;
        }

        //Asigna los datos al oibjeto para que paraezcan la informacion
        $scope.chageCustomerItem = function(item){
            angular.forEach($scope.lstHistoriesData, function(value, key){
                if(item && item.value === value.id_paciente){
                    $scope.historyData = value;                    
                }

                if(!item){
                 $scope.historyData = {};   
                }
            });
        };

        //genera un diccionario clave valor de los empleados
        //@param JSON datos empleado
        //@return JSON datos clav val value:1722919725,display:'Eduardo Villota'
               //genera un diccionario clave valor de los empleados
        //@param JSON datos empleado
        //@return JSON datos clav val value:1722919725,display:'Eduardo Villota'
        $scope.keyValueEmployee = function(searchText){
            var myObj = [];
            angular.forEach($scope.lsEmployeesData, function(value, key){
                var nombres = angular.lowercase(searchText);
                var employeed = angular.lowercase(value.nombres);
                if(employeed.indexOf(nombres) > 0){
                    myObj.push({value : value.id_personal, 
                            display: value.nombres});
                }else if (employeed.indexOf(nombres) ===   0){
                    myObj.push({value : value.id_personal, 
                            display: value.nombres});
                }
            }); 
            return myObj;
        }

        //Asigna los datos al oibjeto para que paraezcan la informacion
        $scope.chageEmployeeItem = function(item){
            angular.forEach($scope.lsEmployeesData, function(value, key){
                if(item && item.value === value.id_personal){
                    $scope.employeedData = value;                    
                }
                if(!item){
                 $scope.employeedData = {};   
                }
            });
        };

        $scope.loadData = function(){
             //traemos el listado de historias
            var httpResponse = serviceHistories.getHistories();
               httpResponse.then(
                   function(response){
                       if(response.msg == '3002'){
                            $scope.lstHistoriesData = response.data;
                       }else{
                           $scope.validTreatmentsErrors(response.msg, 
                                                              response.data);
                       }
                   },function(error){
                       $scope.validTreatmentsErrors('7777', error);
                   });
               delete httpResponse;
               
               //Traer listado de personal
               var httpResponse = serviceEmployees.getEmployees();
               httpResponse.then(
                   function(response){
                       if(response.msg == '3002'){
                           $scope.lsEmployeesData = response.data;
                       }else{
                           $scope.validTreatmentsErrors(response.msg, response);
                       }
                   },function(error){
                       $scope.validTreatmentsErrors('7777', error);
                   });
        }

     if(idTreatment){
        //Verifica campos nulos si lo son no coloca active en el label
        $scope.isInputTreatmentNull = function (data){
            if(typeof(data) === 'string'){
                return 'active';
            }
        };

        //comprobamos que reciba un tratamiento y lo edita como solo se
        //recibe il id del tratamiento buscamos los datos
        $scope.auTreatmentDisable = function(){
            return true;
        };
        
        //Recupera los datos y selecciona el item del empleado
        function selectPerson(idPerson){
            var httpResponse = serviceHistories.getHistoryFromId(idPerson);
            httpResponse.then(
                function(response){
                    if(response.msg == '3002'){
                        $scope.historyData = response.data[0];
                        //seleccionamos el item de la lista del autocomplete
                        $scope.selectePersondItem = {
                            'value': $scope.historyData.id_paciente,
                            'display': $scope.historyData.nombres
                        };
                    }else{
                        $scope.validTreatmentsErrors(response.msg ,response.data);
                    }
                }, function(error){
                    $scope.validTreatmentsErrors('7777', error);
                });
        }

        //Recupera los datos y selecciona el item del paciente
        function selectEmployee(idEmployee){
            var httpResponse = serviceEmployees.getEmployee(idEmployee);
            httpResponse.then(
                function(response){
                    if(response.msg == '3002'){
                        $scope.employeedData = response.data[0];
                        //seleccionamos el item de la lista del autocomplete
                        $scope.selecteEmployeeItem = {
                            'value': $scope.employeedData.id_personal,
                            'display': $scope.employeedData.nombres
                        };
                    }else{
                        $scope.validTreatmentsErrors(response.msg ,
                                                        response.data);
                    }
                }, function(error){
                    $scope.validTreatmentsErrors('7777', error);
                });
        }



        //recupera los datos del tartamietnio
        var httpResponse = serviceTreatments.getTreatment(idTreatment);
        httpResponse.then(
            function(response){
                if(response.msg == '3002'){
                   $scope.tratamiento = response.data[0];
                    //recuperamos los datos del paciente y empleado
                    selectPerson($scope.tratamiento.id_paciente);
                    selectEmployee($scope.tratamiento.id_personal);
                   if($scope.tratamiento.iva == "1"){
                        $scope.tratamiento.iva = true;
                   }else{
                    $scope.tratamiento.iva = false;
                   }
                }else{
                    $scope.validTreatmentsErrors(response.msg,response.data);
                    $location.path('/listar-tratamientos');
                }
            }, function(error){
                $scope.validTreatmentsErrors('7777', error);
            }
            );
       }else{
        $scope.loadData();
       }
    
    
    };

    //Funcion que inicia el init del controller
    $scope.init();
    

       // md-selected-item="au.selectedItem"
       // md-search-text-change="au.searchTextChange(ctrl.searchText)" 
       // md-selected-item-change="au.selectedItemChange(item)" 
       // md-item-text="item.display" 
       // 

    //Funcion encargada de presentar los errores en pantalla
    $scope.validTreatmentsErrors = function(error, data){
        var statusDetail = showStatus(error, data);    
        Materialize.toast( statusDetail['message'],  2500);
    }

    
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