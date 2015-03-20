<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Como recuperar los campos de un formulario con jQuery</title>
	<link rel="stylesheet" type="text/css" href="css/default.css"/>
</head>
<body>
	<div class="page">
		<div class="content">
			<h1>Como recuperar los campos de un formulario con jQuery</h1>
			<hr />
			<p class="description">En este demo vamos a utilizar unas rutinas para escribir los valores en nuestro formulario y luego las utilizaremos para recuperarlos.</p>
			<form id="formulario">
				<table>
					<tr>
						<td>Nombre:</td>
						<td><input type="text" data-campo="Nombre" /></td>
					</tr>
					<tr>
						<td>Edad:</td>
						<td><input type="text" data-campo="Edad" /></td>
					</tr>
					<tr>
						<td>Enumerado:</td>
						<td><select data-campo="Enumerado" data-proveedor="enumerado" data-predeterminado="1"></select></td>
					</tr>
					<tr>
						<td>Colección:</td>
						<td><select data-campo="Coleccion" data-proveedor="coleccion" data-predeterminado="1"></select></td>
					</tr>
					<tr>
						<td>AJAX:</td>
						<td><select data-campo="AJAX" data-proveedor="obtenerValores" data-predeterminado="1"></select></td>
					</tr>
					<tr>
						<td>Activo:</td>
						<td><input type="checkbox" data-campo="Activo" /> (marcar para indicar que está activo)</td>
					</tr>
					<tr>
						<td></td>
						<td><input type="button" value="Guardar" onclick="guardar()" /></td>
					</tr>
					<tr>
						<td></td>
						<td>
							<input type="button" value="<" onclick="anterior();" />
							<input type="button" value=">" onclick="siguiente();" />
							<input type="button" value="Nuevo" onclick="nuevo();" />
						</td>
					</tr>
				</table>
			</form>
		</div>
		<div class="footer">Eduardo Ferr&oacute;n { Zeion Software }</div>
	</div>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script>
		
		// en este ejemplo vamos a utilizar un arreglo para almacenar los registros que manejaremos
		var valores = [];
		
		// utilizaremos esta variable para movernos entre los registros
		var indice = -1;
		
		// este es un enumerado que utilizaremos como ejemplo
		var enumerado = {
			1: "Enumerado 1",
			2: "Enumerado 2",
			3: "Enumerado 3"
		};
		
		// esta es una colección que utilizaremos como ejemplo
		var coleccion = [
			{ Id: 1, Nombre: "Colección 1" },
			{ Id: 2, Nombre: "Colección 2" },
			{ Id: 3, Nombre: "Colección 3" }
		];
		
		// vamos a inicializar nuestro formulario:
		$(function(){
			// comenzamos con un nuevo registro
			nuevo();
		});
		
		// recupera los datos del registro en el índice activo y coloca la información en el formulario
		function preparar()
		{
			// si no hay registros, limpiamos el formulario
			if (indice < 0)
				prepararFormulario("#formulario");
			// verificamos si nos hemos salido del rango
			if (indice >= valores.length) return;
			// prepara el formulario con los datos del registro activo
			prepararFormulario("#formulario", valores[indice]);
		}
		
		// carga los datos del siguiente registro
		function siguiente()
		{
			// verifica que no salgamos del rango
			if (indice + 1 >= valores.length) return;
			// salta al siguiente registro
			indice++;
			preparar();
		}
		
		// carga los datos del registro anterior
		function anterior()
		{
			// verifica que no salgamos del rango
			if (indice <= 0) return;
			// salta al  registro anterior
			indice--;
			preparar();
		}
		
		// agrega un nuevo registro
		function nuevo()
		{
			// creamos un nuevo objeto y lo colocamos en el arreglo
			// (de momento solo tiene un atributo: el índice, que será también su identificador)
			var obj = { Id: valores.length };
			valores.push(obj);
			
			// salta al primer registro
			indice = obj.Id;
			preparar();
		}
		
		// guardar los campos del registro activo
		function guardar()
		{
			// recupera los datos del formulario
			var obj = procesarFormulario("#formulario");
			console.log(obj);
			
			// validar si hubo cambios
			// ...
			
			// actualizamos el registro en el arreglo
			var registro = valores[indice];
			$.extend(registro, obj);
		}
		
		// recupera los valores utilizando un módulo en el servidor
		function obtenerValores(callback, contexto)
		{
			try
			{
				// recuperamos la lista de valores con una consulta AJAX
				$.ajax(
					{
						url		: "ajax.php",			// el modulo que nos proveera de la informacion que solicitamos
						context	: contexto,				// un contexto u objeto con informacion complementaria, este no viaja al servidor
						success	: callback,				// que rutina se ejecuta si esto funciona
						error	: 						// que rutina se ejecuta si esto falla
							function (XMLHttpRequest, textStatus, errorThrown)
							{
								alert(errorThrown);
							}
					});
			}
			catch(ex)
			{
				alert(ex.description);
			}
		}
		
		
		
		/*
		 * Rutinas para el procesamiento de formularios.
		 */
		
		
		// inicializa el formulario con los campos del registro proporcionado
		function prepararFormulario(idFormulario, datos)
		{	
			console.log('-----------');
			console.log(idFormulario);
			console.log(datos);
			$(idFormulario).find("input, select, textarea").each(
			function()
			{
				var $me = $(this);
				var campo = $me.data("campo");
				var predeterminado = $me.data("predeterminado");
				var proveedor = $me.data("proveedor");
				
				// si no se especificó un campo, ignoramos el elemento
				if (!campo) return;
				
				// recupera el valor correspondiente según el registro de datos
				// (pon una cadena vacía si no se encontró el campo)
				var valor = datos && datos[campo] ? datos[campo] : "";
				
				// si no se encontró el valor, pero hay uno predeterminado
				if ($.trim(valor) == "" && predeterminado)
					valor = predeterminado;
					
				// si se ha especificado un proveedor para este campo y
				// aún no hemos procesado la colección
				if (proveedor && !$me.data("cargado"))
				{
					prepararColeccion(this, proveedor, datos);
					return;
				}
				
				// dependiendo de que tipo de control se trate
				switch ($me[0].nodeName.toUpperCase())
				{
					case "TEXTAREA":
						$me.text(valor);
						break;
					case "INPUT":
						var type = $me.attr("type").toUpperCase();
						if (type == "CHECKBOX" || type == "RADIOBUTTON")
						{
							// este caso es interesante, pues necesitamos saber si
							// podemos considerar el campo como VERDADERO
							var verdadero = $me.data("verdadero");
							
							// si no se especificó, consideraremos "true" como un valor verdadero
							if (typeof verdadero == "undefined")
								verdadero = "true";
							
							// estará marcado si los valores coinciden
							$me.prop("checked", valor.toString() == verdadero);
						}
						else
							$me.val(valor);
						break;
					default:
						$me.val(valor);
				}
			}).first(":visible").focus();
		}
		
		// procesa el proveedor especificado y coloca el resultado en la lista de opciones
		// para el elemento esspecificado
		function prepararColeccion(elemento, proveedor, datos)
		{
			// el proveedor viene como texto, así que lo evaluamos para averiguar
			// de que se trata
			try { proveedor = eval(proveedor); } catch (ex) { proveedor = false; }
			if (!proveedor) return;
			
			var $me = $(elemento);
			
			// si el proveedor es una función, necesitamos ejecutarla
			if (typeof proveedor == "function")
				proveedor(prepararColeccion_callback, { Elemento: elemento, Datos: datos });
			else if (Object.prototype.toString.call(proveedor) === '[object Array]')
			{
				// si se trata de un arreglo, procesamos cada registro y creamos una
				// opción para cada entrada
				
				// estos son los atributos que utilizaremos como parte de las opciones
				var valor = $me.data("valor");
				var texto = $me.data("texto");
				if (!valor) valor = "Id";
				if (!texto) texto = "Nombre";
				
				// ahora si, para cada entrada
				for (var i in proveedor)
					$me.append("<option value='" + proveedor[i][valor] + "'>" + proveedor[i][texto] + "</option>");
			}
			else if (typeof proveedor == "object")
			{
				// si se trata de un objeto, vamos a procesar todos sus atributos y los 
				// colocamos dentro del SELECT
				for (var k in proveedor)
					$me.append("<option value='" + k + "'>" + proveedor[k] + "</option>");
			}
			else
			{
				// en el último de los casos, agregamos una opción con el dato como cadena
				var valor = provee.toString();
				$me.append("<option value='" + valor + "'>" + valor + "</option>");
			}
			
			// si tenemos el objeto con los datos, colocamos el valor correspondiente
			if (datos)
			{
				var campo = $me.data("campo");
				if (datos[campo])
					$me.val(datos[campo]);
			}
			
			// marcamos el elemento, así no repetiremos eso una y otra vez
			$me.data("cargado", true);
		}
		
		// analiza el resultado y si logramos recuperar la colección,
		// procesamos los datos del elemento de nueva cuenta
		function prepararColeccion_callback(respuesta)
		{
			if (respuesta && this.Elemento)
				prepararColeccion(this.Elemento, respuesta, this.Datos);
		}
		
		// recupera un objeto con los datos en el formulario
		function procesarFormulario(idFormulario)
		{
			var datos = {};
			$(idFormulario).find("input, select, textarea").each(
			function()
			{
				var $me = $(this);
				var campo = $me.data("campo");
				
				// si no se especificó un campo, ignoramos el elemento
				if (!campo) return;
				
				// dependiendo de que tipo de control se trate
				var valor = undefined;
				switch ($me[0].nodeName.toUpperCase())
				{
					case "TEXTAREA":
					case "LABEL":
						valor = $me.text();
						break;
					case "INPUT":
						var type = $me.attr("type").toUpperCase();
						if (type == "CHECKBOX" || type == "RADIOBUTTON")
							valor = $me.prop("checked");
						else
							valor = $me.val();
						break;
					default:
						valor = $me.val();
				}
				
				// grabamos el valor en el objeto
				if (valor != undefined)
					datos[campo] = valor;
			});
			return datos;
		}
		
	</script>
</body>
</html>