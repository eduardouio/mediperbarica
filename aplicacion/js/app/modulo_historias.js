/*****************************************************************************
  Modulo de historias
  http://mediperbarica.com.ec/hash/historias
  Copyright 2014 Mediperbarica Todos los derechos reservados
  @autor: Eduardo Villota
  @date: 20-03-2015 00:23
 _    _  _       _                _ 
| |  | |(_)     | |              (_)            
| |__| | _  ___ | |_  ___   _ __  _   __ _  ___ 
|  __  || |/ __|| __|/ _ \ | '__|| | / _` |/ __|
| |  | || |\__ \| |_| (_) || |   | || (_| |\__ \
|_|  |_||_||___/ \__|\___/ |_|   |_| \__,_||___/

 ****************************************************************************/

var mediperbaricaApp = angular.module('mediperbaricaApp', ['ngRoute']);


/* ---------------------------------------------------------------------------
 __    ___    __  
|__)|  || /\ /__` 
|  \\__/|/~~\.__/ 
                  
----------------------------------------------------------------------------*/
mediperbaricaApp.config(function($locationProvider, $routeProvider){
	
	$locationProvider.html5Mode.enabled;

	$routeProvider
	.when('/',
{		templateUrl : host + 'tplhtml/templates/lista-historias-tpl.html',
		controllerAs : 'ctrlListar',
		controller : 'ListarController'
	})
	.when('/crear',{
		templateUrl : host + 'tplhtml/forms/frm-historia-tpl.html',
		controllerAs : 'editCtrl',
		controller: 'EditController'
	})
		.when('/editar/:historiaID',{
		templateUrl : host + 'tplhtml/forms/frm-historia-tpl.html',
		controllerAs : 'editCtrl',
		controller: 'EditController'
	})
		.when('/asignar-antecedente/:historiaID',{
		templateUrl : host + 'tplhtml/forms/frm-antecedente-tpl.html',
		controllerAs : 'asgantCtrl',
		controller: 'AsignarAntecendeteController'
	})
		.when('/acerca',{
		templateUrl : host + 'tplhtml/templates/acerca-app-tpl.html',
		controller: 'AcercaController'
	})
		.when('/error-server',{
		templateUrl : host + 'tplhtml/templates/error-server-tpl.html',
		controllerAs : 'errCtrl',
		controller: 'errroServer'
	})
		.when('/presentar/:historiaID',{
		templateUrl : host + 'tplhtml/templates/presentar-historia-tpl.html',
		controllerAs : 'presentCtrl',
		controller: 'PresentController'
	})
		.otherwise({ redirectTo: '/' });
});


/* ---------------------------------------------------------------------------
 ___   _______  __        __  
|__/\ /  `|/  \|__)\ //\ /__` 
| /~~\\__,|\__/|  \ |/~~\.__/ 

----------------------------------------------------------------------------*/
mediperbaricaApp.factory('services', [ '$http','$location',
													function($http,$location){
	
	var serviceBase = host + 'index.php/';
	var obj = {};
	//Metodo que obtiene las historias
	obj.getHistorias = function(){
		console.log('[Debug] => Se llama a la funcion getHistoria');
		console.log('[Debug] => ' + serviceBase + 'getHistoria');
		return $http.get(serviceBase + 'historias/getHistoryData');
	};
	//Metodo que retorna una historia
	obj.getHistoria = function (id_historia) {
		return $http.get(serviceBase + 'historias/getHistoryData/' + id_historia);
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
					alert('Ya existe un registro con el mismo numero ' + 
						  'de Cedula en el sistema!');
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

/* ---------------------------------------------------------------------------
 __  __    _____  __          ___ __  __  
/  `/  \|\ |||__)/  \|   |   |__ |__)/__` 
\__,\__/| \|||  \\__/|___|___|___|  \.__/ 

----------------------------------------------------------------------------*/

/* ---------------------------------------------------------------------------
controlador encargado de listar las historias
----------------------------------------------------------------------------*/
mediperbaricaApp.controller('ListarController', function($scope, $rootScope, 
															services){
	console.log("[Debug] => Se llama al controlador ListarController");
		services.getHistorias().then(function (data){
		$scope.historias = data.data.data;
		$rootScope.dataInicial = $scope.historias;
	});

});

/* ---------------------------------------------------------------------------
Controlador encargado de Crear Editar Elimianar
----------------------------------------------------------------------------*/
mediperbaricaApp.controller('EditController', function( $scope, 
							$rootScope, $location, $routeParams, services){	

	console.log($rootScope.dataInicial);
	console.log('[Debug] => Se incia la carga de editController');
	var historiaID = ($routeParams.historiaID) ? 
										parseInt($routeParams.historiaID) : 0;
	$rootScope.title = (historiaID > 0) ? 'Edit Historia' : 'Add Historia';
	//se analiza se se desea editar una historia o crear una nueva
	if(historiaID > 0){	
		console.log("[Debug] => Se llama al controlador ListarController");
		services.getHistoria(historiaID).then(function (data){
		$scope.historia = data.data.data[0];
		console.dir($scope.historia);
	});
	}else{
		$location.path('/crear');
	}


	//Guada una historia
	$scope.saveHistoria = function (historia){
		console.log('[Debug] => Se llama a saveHistoria de EditController');
		//Validamos los datos ingresados
		services.insertHistoria(historia);
	};

	//Modifica una historia
	$scope.editHistoria = function (historia){
		console.log('[Debug] informacion enviada al sevicio updateHistoria');
		console.dir(historia);
		services.updateHistoria(historia);
	};


	/*************************************************************************
	Metodo encargado de limpiar el $scope, Se comparan los valores 
	de los objetos 	historia
	@return (boolean)
	*************************************************************************/
	$scope.isClean = function (){
		return angular.equals(original, $scope.historia);
	};

	/**	
	MEtodo encargado de eliminar un registro de historia
	@return str(historiaID)
	*/
	$scope.deleteHistoria = function(historia){
		//alert('otra vez me pide poner ===');
		if(confirm("Esta Seguro de Eliminar la Historia : " + $scope._id + 
					' de ' + $scope.nombres) === true)
		$location.path('/');
			services.deleteHistoria(historia._id);
	};

	$scope.clearForm = function(){
		console.log('[Debug] Limpiar Formulario Historias');
		$scope.historia = {};
	};

	$scope.validForm = function(historia){
		console.log('[Debug] Se validan los capos de la historia');
		console.dir(historia);
		//se normaliza el arreglo de historia
		angular.forEach(historia, function(value,key){
		 // alert('==!');
			if (!historia[key] && historia[key] !== '0' && historia[key] != 0){
				historia[key] = '';
				}
				//se pone la primera en mayuscula menos los mails
				var myhistoria = historia[key];
				if(key != 'mail_referente'){
					if(key != 'mail'){
						historia[key] = myhistoria.toLowerCase();
						historia[key] = toTitleCase(myhistoria);
					}
				}
		});
		console.dir(historia);
		console.log('[Debug] Se comprueba el arreglo');

		var condicion = false;
		var longitudes_minimas = {
						'id_paciente': 9,
						'nombres': 4,
						'telefono':6,
						'fecha_nacimiento': 9,
						'mail' : 4,
						'direccion' : 4
		};
		if(historia){
			var cantidad = Object.keys(historia).length;
			console.log('[Debug] Se Comprueba si existe el arreglo');
			condicion = (cantidad > 5) ? true : false;
			console.log('[Debug] Estado de La condicion ' + condicion + 
						' cantidad de arreglo ' + cantidad);
			if(condicion){
				angular.forEach(longitudes_minimas, function(value, key){
					myhistoria = historia[key];
					if((myhistoria.length > longitudes_minimas[key]) && 
															condicion == true){
						console.log('funciona ' + key);
					}else{
						condicion = false;
					}
				});
			}
		}
		console.log('Se termina de Evaluar la condicion valor ' + condicion);
		if(condicion){
			if(historiaID > 0){
				console.log('[Debug] se validan y se los envia a editHistoria');
				console.dir(historia);
				$scope.editHistoria(historia);
			}else{
				console.log('[Debug] se valida datos y se envia saveHistoria');
				console.dir(historia);
				$scope.saveHistoria(historia);
			}
		}else{
			alert('Uno De Los Datos No Existe O Es Muy Corto!');
		}
	};
	console.log('[Debug] => Se termina la carga de editController');
});

/* ---------------------------------------------------------------------------
Controlador encargado de Presentar las historias
----------------------------------------------------------------------------*/
mediperbaricaApp.controller('PresentController', function($scope, 
							$rootScope, $location, $routeParams, services){
	var historiaID = ($routeParams.historiaID) ? 
										parseInt($routeParams.historiaID) : 0;
	console.log('Se determina el valor del id de la historia' + historiaID);
	if(historiaID > 0){	
		console.log("[Debug] => Se llama al controlador ListarController");
		services.getHistoria(historiaID).then(function (data){
		$scope.historia = data.data.data[0];
		console.dir($scope.historia);
		//recuperamos los posibles antecedentes
		services.getAntecedentes($scope.historia['id_paciente'])
		.then(function (data){
		console.log('[Debug] se obtiene el objeto lista antecedentes');
		getListadoAntecedentes = data.data;
		console.dir(getListadoAntecedentes);
		var cantidad = Object.keys(getListadoAntecedentes.data).length;
		if(cantidad > 0){
			console.log('[Debug] Cantidad de Aantecedentes encontrado ' + 
						cantidad);
			$scope.listaAntecedentes = getListadoAntecedentes.data;
		}else{
			console.log('[Debug] Se vacia en arreglo de antecedentes por ' + 
						'seguridad cantidad desde la BD ' + cantidad);
			$scope.listaAntecedentes = {};
			}
		});
	});
	}else{
		$location.path('/presentar/error');
	}

	//muestra el registro anterior
	$scope.berofeHistory = function(historiaID){
		var next = parseInt($routeParams.historiaID);
		next++;
		$location.path('/presentar/' + next);		
	};

	//muestra el registro siguiente
	$scope.afterHistory = function(historiaID){
		var after = parseInt($routeParams.historiaID);
		after--;
		$location.path('/presentar/' + after);		

	};

});

/* ---------------------------------------------------------------------------
Controlador encargado de Asignar un antecedente a la historia
----------------------------------------------------------------------------*/
mediperbaricaApp.controller('AsignarAntecendeteController', function($scope, 
							services, $routeParams,$location, $rootScope){
	console.log('[Debug] llama al controlador  AsignarAntecendeteController');
	var getListadoAntecedentes = {};
	var historiaID = ($routeParams.historiaID) ? 
										parseInt($routeParams.historiaID) : 0;
	console.log('Se determina el valor del id de la historia' + historiaID);

	if(historiaID > 0){	
		//recuperamos los datos de la historia
		services.getHistoria(historiaID).then(function (data){
		console.log('[Debug] se obtiene el objeto historia');
		$scope.historia = data.data.data[0];
		console.dir($scope.historia);
		
		//recuperamos los posibles antecedentes
		services.getAntecedentes($scope.historia['id_paciente'])
		.then(function (data){
		console.log('[Debug] se obtiene el objeto lista antecedentes');
		getListadoAntecedentes = data.data;
		console.dir(getListadoAntecedentes);
		var cantidad = Object.keys(getListadoAntecedentes.data).length;
		if(cantidad > 0){
			console.log('[Debug] Cantidad de Aantecedente s encontrado ' + 
				cantidad);
			$scope.listaAntecedentes = getListadoAntecedentes.data;
		}else{
			console.log('[Debug] Se vacia en arreglo de antecedentes por ' + 
						'seguridad cantidad desde la BD ' + cantidad);
			$scope.listaAntecedentes = {};
			}
		});
		console.log('[Debug] Resultado de la consulta de antecedentes ==>');
		console.dir($scope.listaAntecedentes);

	});
	}else{
		$location.path('/presentar/error');
	}

	$scope.validateAntecedenteForm = function(antecedente){
		console.log('[Debug] Se inicia la validacion del antecedente');
		console.dir(antecedente);
		//se normaliza el arreglo del antecedente
		if(antecedente){
			console.dir(antecedente);
			angular.forEach(antecedente, function(value,key){
				antecedente[key] = key.toLowerCase();
				antecedente[key] = toTitleCase(value);
			});
			antecedente['id_paciente'] = $scope.historia['id_paciente'];
		}

		//se normaliza el arreglo de historia
		angular.forEach(antecedente, function(value,key){
		console.log('[Debug] se asigna valores vacios a los elementos ' + 
					'faltantes');
			if (!antecedente[key]){
				antecedente[key] = '';
				}
			});

		console.log('[Debug] se captaliza el arreglo');
		console.dir(antecedente);

		var condicion = false;
		var longitudes_minimas = {
						'id_paciente': 9,
						'tipo': 4,
						'detalle':4
		};
		if(antecedente){
			var cantidad = Object.keys(antecedente).length;
			console.log('[Debug] Se Comprueba si existe el arreglo');
			condicion = (cantidad > 2) ? true : false;
			console.log('[Debug] Estado de La condicion ' + condicion + 
						' cantidad de arreglo ' + cantidad);
			if(condicion){
				angular.forEach(longitudes_minimas, function(value, key){
					myantecedente = antecedente[key];
					if((myantecedente.length > longitudes_minimas[key]) && 
															condicion === true){
						console.log('funciona ' + key);
					}else{
						condicion = false;
					}
				});
			}
		}
		console.log('[Debug] estado fuinal de la condicion ' + condicion);
		//Si existe el antecedente se lo edita caso contrario se lo crea
		if(condicion){
			if(antecedente.id_antecedente){
				console.log('[Debug] Se manda a ediatr en antecedente');
				console.dir(antecedente);
				services.updateAntecedente(antecedente);
			}else{
				console.log('[Debug] se validan los datos y se los manda a ' + 
							'insertAntecedente');
				console.dir(antecedente);
				services.insertAntecedente(antecedente);
			}
		}else{
			//condicion = false;
			console.log('[Debug] no se puede pasar la validacion a las ' +
						'pripiedades del objeto antecedente');
			alert('Uno De Los Datos No Existe O Es Muy Corto!');
		}
	};

	//Edita el valor del antecdete
	$scope.editAntecedente = function(id_antecedente){
		console.log('[Debug] se llama a la funcion de editar para el ' +
					'antecedente ' + id_antecedente);
		$scope.antecedente = {};
		services.getAntecedente(id_antecedente).then(function (data){
			var antecedenteLista = data.data;
			console.dir(antecedenteLista);
			$scope.antecedente = antecedenteLista.data[0];
			});
	};
});

/* ---------------------------------------------------------------------------
Controlladores para manejo de los errores
----------------------------------------------------------------------------*/
mediperbaricaApp.controller('errroServer', function($scope, services){});


/* ---------------------------------------------------------------------------
Controlador necesario para presentar hacerca de
----------------------------------------------------------------------------*/
mediperbaricaApp.controller('AcercaController', function($scope, services){});