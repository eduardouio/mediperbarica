/*******************************************************************************
*  Copyright 2014 Mediperbarica Todos los derechos reservados
*  @autor: Eduardo Villota
*  @date: 11-05-2016 23:44
*  @version 0.2
* 
* Introduccion: Modulo Encargado de Manejar las solicitudes al servidor, GET
* y POST maneja solicitudes asincronas
/******************************************************************************/

//Variable que define el index.php en las rutas para la interaccion HTTP
var serviceBase = host + 'index.php/';


/**-----------------------------------------------------------------------------
Factory Login
-----------------------------------------------------------------------------**/
mediperbaricaApp.factory('serviceLogin',['$http','$rootScope','$location', '$q',
	function($http, $rootScope, $location, $q){
		console.log('[Debug] Llamada a FAC serviceLogin');
		// variable que almacena los servicios de la factory
		var service = {};
		//funcion estandar para GET
		function httpGet(url){
		var deferred = $q.defer();
		var promise = deferred.promise;
		$http.post(serviceBase + url)
				.success(function(response){
					return deferred.resolve(response);
				})
				.error(function(response){
					return deferred.reject(response);
				})
			return promise;			
		}

		//funcion estandar para POST
		function httpPost(url,data){
		var deferred = $q.defer();
		var promise = deferred.promise;
		$http.post(serviceBase + url,data)
				.success(function(response){
					return deferred.resolve(response);
				})
				.error(function(response){
					return deferred.reject(response);
				})
			return promise;			
		}

		//funcion estandar para DELETE
		function httpDelete(url,data){
		var deferred = $q.defer();
		var promise = deferred.promise;
		$http.delete(serviceBase + url,data)
				.success(function(response){
					return deferred.resolve(response);
				})
				.error(function(response){
					return deferred.reject(response);
				})
			return promise;			
		}

		//Funcion encargada de validar los datos del login
		service.login = function(userData){
			console.log('[Debug] llamada funcion login');
			return httpPost('login/go', userData);
		};

		//Funcion encargada de cerrar la datos del login
		service.logon = function(){
			console.log('[Debug] llamada funcion logon');
			return httpGet('login/logout');
		}
		return service;
	}]);

/*------------------------------------------------------------------------------
Factory Historias
------------------------------------------------------------------------------*/
mediperbaricaApp.factory('serviceHistories', ['$http','$rootScope',	'$q',
	function($http, $rootScope, $q ){
        console.log('[Debug] Llamada a FAC serviceHistories');
        //valiables que almacenas los servicios
		var service = {};
        
        //funcion estandar para GET
        function httpGet(url){
        var deferred = $q.defer();
        var promise = deferred.promise;
        $http.get(serviceBase + url)
                .success(function(response){
                    return deferred.resolve(response);
                })
                .error(function(response){
                    return deferred.reject(response);
                })
            return promise;			
        }

        //funcion estandar para POST
        function httpPost(url,data){
        var deferred = $q.defer();
        var promise = deferred.promise;
        $http.post(serviceBase + url,data)
                .success(function(response){
                    return deferred.resolve(response);
                })
                .error(function(response){
                    return deferred.reject(response);
                })
            return promise;			
        }

		
        //Losta todas las historias de la base de datos
		service.getHistories = function(){
			console.log('[Debug] llamada funcion getHistories() ');
			return httpGet('historias/getHistories');	
			};

		//Funcion encargada de devolver una historia
		service.getHistory = function(idHistory){
			console.log('[Debug] llamada funcion getHistory()');
			return httpGet('historias/getHistories/' + idHistory);
		};

		//Funcion encargada de guardar una historia
		service.saveHistory = function(history){
			console.log('[Debug] llamada funcion setHistory()');
			return httpPost('historias/saveHistory/' , history);
		};

		//Funcion encargada de eliminar una historia
		service.deleteHistory = function(idHistory){
			console.log('[Debug] llamada funcion delHistory()');
			return httpGet('historias/deleteHistory/' + idHistory);
		};
		return service;
	}]);


/*------------------------------------------------------------------------------
* Factoria encargada de manejar los tratamientos
------------------------------------------------------------------------------*/
mediperbaricaApp.factory('serviceTreatments',['$http', '$q','$rootScope',
    function($http, $q, $rootScope){
        console.log('[Debug] llamada FAC serviceTreatments')
        var service = {};
        //funcion estandar para GET
        function httpGet(url){
        var deferred = $q.defer();
        var promise = deferred.promise;
        $http.get(serviceBase + url)
                .success(function(response){
                    return deferred.resolve(response);
                })
                .error(function(response){
                    return deferred.reject(response);
                })
            return promise;			
        }

        //funcion estandar para POST
        function httpPost(url,data){
        var deferred = $q.defer();
        var promise = deferred.promise;
        $http.post(serviceBase + url,data)
                .success(function(response){
                    return deferred.resolve(response);
                })
                .error(function(response){
                    return deferred.reject(response);
                })
            return promise;			
        }
        
        //lista todos los tratamientos
        service.getTratments = function(){
            console.log('[Debug] Llamada a metodo getTratments');
            return httpGet('tratamientos/getTreatments');
        };
        
        //lista un tratamiento
        service.getTreatment = function(idTreatment){
            console.log('[Debug] llamada a metodo getTreatment');
            return httpGet('tratamientos/getTreatments/' + idTreatment);
        };
        
        //lista los tratamientos de una persona
        service.getPersonTratments = function(idPerson){
          console.log('[Debug] Llamada a metodo getPersonTratments');
          return httpGet('tratamientos/getTreatments/' + idPerson);  
        };
        
        //guarda un tratamiento nuevo y con cambios
        service.saveTreatment = function(treatment){
            console.log('[Debug] Llamada a metodo saveTreatment');
            return httpPost('tratamientos/saveTreatment', treatment);
        };
        
        //elimina un tratamiento
        service.deleteTreatment = function(idTreatment){
            console.log('[Debug] Llamada a metodo deleteTreatment');
            return httpGet('tratamientos/deleteTreatment/' + idTreatment);
        };
    return service;                                        
}])

/*------------------------------------------------------------------------------
* Factory ecargada de manejar el personal
------------------------------------------------------------------------------*/
mediperbaricaApp.factory('serviceEmployees', ['$http','$q','$rootScope',
    function($http, $q, $rootScope){
        console.log('[Debug] Llamada a serviceEmployees');
        var service = {};
        //funcion estandar para GET
        function httpGet(url){
        var deferred = $q.defer();
        var promise = deferred.promise;
        $http.get(serviceBase + url)
                .success(function(response){
                    return deferred.resolve(response);
                })
                .error(function(response){
                    return deferred.reject(response);
                })
            return promise;			
        }

        //funcion estandar para POST
        function httpPost(url,data){
        var deferred = $q.defer();
        var promise = deferred.promise;
        $http.post(serviceBase + url,data)
                .success(function(response){
                    return deferred.resolve(response);
                })
                .error(function(response){
                    return deferred.reject(response);
                })
            return promise;	
        }
        
        //Lista el personal
        service.getEmployees = function(){
            console.log('[Debug] Llamada a methodo getEmployees');
            return httpGet('personal/getEmployees/');
        };
        //lista a un personal
        service.getEmployee = function(idEmployee){
            console.log('[Debug] Llamada a methodo getEmployee');
            return httpGet('personal/getEmployees/' + idEmployee);
        };
        //guarda la informacion de un personal
        service.saveEmploye = function(employee){
            console.log('[Debug] Llamada a methodo saveEmploye');
            return httpPost('personal/saveEmployee' , employee);
        };
        //elimina un personal
        service.deleteEmploye = function(idEmployee){
            console.log('[Debug] Llamada a methodo deleteEmploye');
            return httpGet('personal/deleteEmployee/' + idEmployee);
        };
        
      return service;  
    }]);
/*------------------------------------------------------------------------------
* Factory encargado de manejar datos de Antecedentes
------------------------------------------------------------------------------*/
mediperbaricaApp.factory('serviceAntecedets', ['$http','$q','$rootScope', 
    function($http,$q,$rootScope){
        console.log('[Debug] llamada a FAC serviceAntecedets');
        var service  = {};
        //funcion estandar para GET
        function httpGet(url){
        var deferred = $q.defer();
        var promise = deferred.promise;
        $http.get(serviceBase + url)
                .success(function(response){
                    return deferred.resolve(response);
                })
                .error(function(response){
                    return deferred.reject(response);
                })
            return promise;			
        }

        //funcion estandar para POST
        function httpPost(url,data){
        var deferred = $q.defer();
        var promise = deferred.promise;
        $http.post(serviceBase + url,data)
                .success(function(response){
                    return deferred.resolve(response);
                })
                .error(function(response){
                    return deferred.reject(response);
                })
            return promise;	
        }
        
        // Obtiene los antecedentes de una historia
        service.getAntecedents = function(idHistory){
            console.log('[Debug] llamada a metodo getAntecedents');
            return httpGet('antecedentes/getAntecedents/' + idHistory);
        };
        
        //Registra un antecedente
        service.saveAntecedent = function(antecedent){
            console.log('[Debug] llamada a metodo saveAntecedent');
            return httpPost('antecedentes/saveAntecedent' , antecedent);
        };
        
        //Elimina un antecedete
        service.deleteAntecedent = function(idAntecedent){
            console.log('[Debug] llamada a metodo deleteAntecedent');
            return httpGet('antecedentes/deleteAntecedent/' + idAntecedent);
        };
        
        //Elimina antecedentes de una historia
        service.deleteAntecedentsHistory = function(idPerson){
            console.log('[Debug] llamada a metodo deleteHistoryAntecedents');
            return httpGet('antecedentes/deleteAntecedentsHistory/' + idPerson);
        };
        
        return service;
}]);

/*------------------------------------------------------------------------------
* Factory encargado de manejar datos de los clientes
------------------------------------------------------------------------------*/
mediperbaricaApp.factory('serviceCustomers', ['$http', '$q', '$rootScope', 
    function($http, $q, $rootScope){
        console.log('[Debug] llamada a FAC serviceCustomers');
        var service = {};
        //funcion estandar para GET
        function httpGet(url){
        var deferred = $q.defer();
        var promise = deferred.promise;
        $http.get(serviceBase + url)
                .success(function(response){
                    return deferred.resolve(response);
                })
                .error(function(response){
                    return deferred.reject(response);
                })
            return promise;			
        }

        //funcion estandar para POST
        function httpPost(url,data){
        var deferred = $q.defer();
        var promise = deferred.promise;
        $http.post(serviceBase + url,data)
                .success(function(response){
                    return deferred.resolve(response);
                })
                .error(function(response){
                    return deferred.reject(response);
                })
            return promise;	
        }
        
    //metodo que trae la lista de clientes
    service.getCustomers = function(){
      console.log('[Debug] Llamada a metodo getCustomers');
        return httpGet('clientes/getCustomers');
    };
    //metodo que trae un cliente
    service.getCustomer = function(idCustomer){
      console.log('[Debug] Llamada a metodo getCustomer');
        return httpGet('clientes/getCustomers' + idCustomer);
    };
    //metodo que guarada o edita un cliente
    service.saveCustomer = function(customer){
      console.log('[Debug] Llamada a metodo saveCustomer');
        return httpPost('clientes/saveCustomer' , customer);
    };
    //metodo que elimina un cliente sin facturas
    service.deleteCustomer = function(idCustomer){
      console.log('[Debug] Llamada a metodo deleteCustomer');
        return httpGet('clientes/deleteCustomer/' + idCustomer);
    };
            
    return service;
}]);

/*------------------------------------------------------------------------------
* Factory encargado de manejar datos de las sesiones
------------------------------------------------------------------------------*/
mediperbaricaApp.factory('serviceSessions', ['$http', '$q', '$rootScope', 
    function($http, $q, $rootScope){
        console.log('[Debug] Llamda a FAC serviceSessions');
        var service = {};
        //funcion estandar para GET
        function httpGet(url){
        var deferred = $q.defer();
        var promise = deferred.promise;
        $http.get(serviceBase + url)
                .success(function(response){
                    return deferred.resolve(response);
                })
                .error(function(response){
                    return deferred.reject(response);
                })
            return promise;			
        }

        //funcion estandar para POST
        function httpPost(url,data){
        var deferred = $q.defer();
        var promise = deferred.promise;
        $http.post(serviceBase + url,data)
                .success(function(response){
                    return deferred.resolve(response);
                })
                .error(function(response){
                    return deferred.reject(response);
                })
            return promise;	
        }
        
        // lista las sesiones de un tratamiento
        service.getSessions = function(idTreatment){
            console.log('[Debug] llamda a metodo getSessions');
            return httpGet('tratamientos/getSessions/' + idTreatment);
        };
        
        // guarda o edita una sesion
        service.saveSession = function(session){
            console.log('[Debug] llamda a metodo saveSession');
            return httpPost('sesiones/saveSession' , session);
        };
        
        // elimina una sesion
        service.deleteSession = function(idSession){
            console.log('[Debug] llamda a metodo deleteSession');
            return httpGet('sesiones/deleteSession/' + idSession);
        };
        
    return service;
}]);

/*------------------------------------------------------------------------------
* Factory encargado de manejar datos de los equipos
------------------------------------------------------------------------------*/
mediperbaricaApp.factory('serviceMachines', ['$http', '$q' ,'$rootScope', 
    function($http, $q, $rootScope){
        console.log('[Debug] Llamada a FAC serviceMachines');
        var service = {};
     
        //funcion estandar para GET
        function httpGet(url){
        var deferred = $q.defer();
        var promise = deferred.promise;
        $http.get(serviceBase + url)
                .success(function(response){
                    return deferred.resolve(response);
                })
                .error(function(response){
                    return deferred.reject(response);
                })
            return promise;			
        }

        //funcion estandar para POST
        function httpPost(url,data){
        var deferred = $q.defer();
        var promise = deferred.promise;
        $http.post(serviceBase + url,data)
                .success(function(response){
                    return deferred.resolve(response);
                })
                .error(function(response){
                    return deferred.reject(response);
                })
            return promise;	
        }
            
        //trae un listado de todas las maquinas
        service.getMachines = function(){
            console.log('[Debug] llamada a metodo getMachines');
            return httpGet('equipos/getMachines');
        };
        
        //trae los detalles de una maquina
        service.getMachine = function(idMachine){
            console.log('[Debug] llamada a metodo getMachine');
            return httpGet('equipos/getMachines' + idMachine);
        };
        
        // crea o modifica una maquina
        service.saveMachine = function(machine){
            console.log('[Debug] llamada a metodo saveMachine');
            return httpPost('equipos/saveMachine', machine);
        };
        
        //elimina una maquina sin sesiones
        service.deleteMachine = function(idMachine){
            console.log('[Debug] llamada a metodo deleteMachine');
            return httpGet('equipos/deleteMachine' + idMachine);
        };
        
    return service;
}]);

/*------------------------------------------------------------------------------
* Factory encargado de manejar datos de los cobros
------------------------------------------------------------------------------*/
mediperbaricaApp.factory('serviceCollections', ['$http', '$q', '$rootScope', 
    function($http, $q, $rootScope){
        console.log('[Debug] Llamada a FAC serviceCollections');
        var service = {};
        
        //funcion estandar para GET
        function httpGet(url){
        var deferred = $q.defer();
        var promise = deferred.promise;
        $http.get(serviceBase + url)
                .success(function(response){
                    return deferred.resolve(response);
                })
                .error(function(response){
                    return deferred.reject(response);
                })
            return promise;			
        }

        //funcion estandar para POST
        function httpPost(url,data){
        var deferred = $q.defer();
        var promise = deferred.promise;
        $http.post(serviceBase + url,data)
                .success(function(response){
                    return deferred.resolve(response);
                })
                .error(function(response){
                    return deferred.reject(response);
                })
            return promise;	
        }
        
        //Lista los cobros de una factura
        service.getCollections = function(idInvoice){
            console.log('[Debug] llamada a metodo getCollections');
            return httpGet('cobros/getCollections/' + idInvoice);
        };
        
        //Guarda un cobro
        service.saveCollection = function(collection){
            console.log('[Debug] llamada a metodo saveCollection');
            return httpPost('cobros/saveCollection', collection);
        };
        
        //elimina un cobro
        service.deleteCollection = function(idCollection){
            console.log('[Debug] llamada a metodo deleteCollection');
            return httpGet('cobros/deleteCollection/' + idCollection);
        };
        
        return service;
}]);

/*------------------------------------------------------------------------------
* Factory encargado de manejar datos las facturas
------------------------------------------------------------------------------*/
mediperbaricaApp.factory('serviceInvoices', ['$http', '$q', '$rootScope', 
    function($http, $q, $rootScope){
        console.log('[Debug] llamda FAC serviceInvoices');
        var service = {};
        
        //funcion estandar para GET
        function httpGet(url){
        var deferred = $q.defer();
        var promise = deferred.promise;
        $http.get(serviceBase + url)
                .success(function(response){
                    return deferred.resolve(response);
                })
                .error(function(response){
                    return deferred.reject(response);
                })
            return promise;			
        }

        //funcion estandar para POST
        function httpPost(url,data){
        var deferred = $q.defer();
        var promise = deferred.promise;
        $http.post(serviceBase + url,data)
                .success(function(response){
                    return deferred.resolve(response);
                })
                .error(function(response){
                    return deferred.reject(response);
                })
            return promise;	
        }
    
        // Lista todas las facturas
        service.getInvoices = function(){
            console.log('[Debug] llamda a metodo getInvoices');
            return httpGet('facturas/getInvoices');
        };
        
        // devuelve una factura
        service.getInvoice = function(idInvoice){
            console.log('[Debug] llamda a metodo getInvoices');
            return httpGet('facturas/getInvoices/id_factura/' + idInvoice);
        };
        
        // lista las facturas de un cliente
        service.getCustomerInvoices = function(idCustomer){
            console.log('[Debug] llamda a metodo getCustomerInvoices');
            return httpGet('facturas/getInvoices/id_cliente/' + idCustomer);
        };
        
        //Lista las facturas de un tratamiento
        service.getTreatmentInvoices = function(idTreatment){
            console.log('[Debug] llamda a metodo getTreatmentInvoices');
            return httpGet('facturas/getInvoices/id_tratamiento/' + idTreatment);
        };
        
        // guarda  una factura
        service.saveInvoice = function(invoice){
            console.log('[Debug] llamda a metodo saveInvoice');
            return httpPost('facturas/saveInvoice' , invoice);
        };
        
        //anula una factura que no este cobrada
        service.invalidateInvoice = function(idInvoice){
            console.log('[Debug] llamda a metodo deleteInvoice');
            return httpGet('facturas/invalidateInvoice/' + idInvoice);
        };
        
    return service;
}]);

/*------------------------------------------------------------------------------
Factory Para carga de archivos HTML
------------------------------------------------------------------------------*/
mediperbaricaApp.factory('serviceLoadTemplates', ['$http','$rootScope','$location',
							'$q', 
	function($http, $rootScope, $location, $q){
		console.log('[Debug] Llamada a FAC serviceLoadTemplates');
		//valiables que almacenas los servicios
		var service = {};
		
		//funcion estandar para GET
		function httpPost(url,idPerson){
		var deferred = $q.defer();
		var promise = deferred.promise;
		$http.post(serviceBase + url , idPerson)
				.success(function(response){
					return deferred.resolve(response);
				})
				.error(function(response){
					return deferred.reject(response);
				})
			return promise;			
		}

		//Funcion encargada de listar las historias
		service.getTplPresentHistory = function(idPerson){
			console.log('[Debug] llamada funcion getTplPresentHistory() ');
			return httpPost('templates/getTplPresentHistory/', idPerson );	
			}

		return service;
	}]);