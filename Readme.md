Medicina Hiperbarica S.A.

Nombre proyecto: Mediperbrica
Autor: Eduardo Villota
Descripcion del proyecto: Se encarga de manejar las sesiones de tratamiento con oxigeno, la facturacion el manejo de las citas y el control de los inventarios.

Estructura y orden de las vistas

1 cabecera
2 sidebar
3 menu
4 alertas
6 Pies

####################################################################################################################################
Procedimientos:
 
 1.- Sistema de Menus 
 	El sistema de menu esta divido

 2.- Acciones Presentar, Editar, Eliminar, Asignar
 Estas assiones se encuentran dentro del workspace de angular por lo que hay que ver si se las puede llamar desde las vistas

###################################################################################################################################
 Funcionamiento de Controladores

  1.- controlador Historial
	  Este controlador este controlador trabaja para que los menus de la parte izquierda se muestren de acuerdo a las propiedades del controlador en este caso del historial, la sidebar apunta a acciones sobbre las historias, el menu pone el foco en item historias, por defecto se llama al controllador de angular encargado de mostrar la lista la url de llamada se la registra en el enlace unicial de esta forma angular debe cargar estos contenidoss de manera automatica:
			Diccionario:
				menu.php => { $controllador}
				

######################################################################################################################################
Anotaciones:

1.- Tener en cuenta que se hay ocaciones en las que los pacientes desea que se emita la factura a otro nombre (para esto habra que crear un nuevo paciente)

2.- se debe crear dos entidades para manejar a los clientes y a los pacientes en el caso de las historias clinicas se registran en una nueva tabla para que solo se herede los datos del cleinte en caso de que el se convierta en paciente, si no solo sera un cliente a quien se le emite las facturas.

3.- configura el pie de pagina para que carge solo los archivos js necesarios para el funcionamiento de la pagina que se esta mostrando, para que sto sea posible escribir cada controlador en un fichrero diferente 

