Medicina Hiperbarica S.A.

Nombre proyecto: Mediperbrica
Autor: Eduardo Villota
Descripcion del proyecto: Se encarga de manejar las sesiones de tratamiento con oxigeno, la facturacion el manejo de las citas y el control de los inventarios.

Estructura y orden de las vistas

1 cabecera
2 totales
3 alertas
4 widget_tratamientos
5 widget_pacientes
6 Pies


Procedimientos:
 1.- Sistema de Menus 
 la plantilla tiene un menu superior a la derecha este menu es controlado por codeigniter, tambien se tiene un menu a la izquierda sidebar, este menu es controlado por angular codeigniter carga los menus de la izquierda para que se acomplen y funcionen el la plantilla cargada estos menus son configurados por el sistema de vistas de codeigniter, la sidebar carga las plantillas el work space de clase css boostrap col-md-12 mismo que se puede dividir en 12 columnas o usarlas de acuerdo convenga.

 2.- Acciones Presentar, Editar, Eliminar, Asignar
 Estas assiones se encuentran dentro del workspace de angular por lo que hay que ver si se las puede llamar desde las vistas

Anotaciones:

1.- Tener en cuenta que se hay ocaciones en las que los pacientes desea que se emita la factura a otro nombre (para esto habra que crear un nuevo paciente)

2.- se debe crear dos entidades para manejar a los clientes y a los pacientes en el caso de las historias clinicas se registran en una nueva tabla para que solo se herede los datos del cleinte en caso de que el se convierta en paciente, si no solo sera un cliente a quien se le emite las facturas.

3.- configura el pie de pagina para que carge solo los archivos js necesarios para el funcionamiento de la pagina que se esta mostrando, para que sto sea posible escribir cada controlador en un fichrero diferente 

