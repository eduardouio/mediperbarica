<h2><a href="http://medicinahiperbarica.com.ec/">Medicina Hiperbarica S.A.</a></h2>

<b>Nombre proyecto:</b> Mediperbrica<br>
<b>Autor:</b> Eduardo Villota<br>
<b>Descripcion del proyecto:</b> Se encarga de manejar las sesiones de 
tratamiento con oxigeno, 
la facturacion el manejo de las citas y el control de los inventarios.<br>

<h3>Descripción:</h3>
<img src="http://medicinahiperbarica.com.ec/sites/all/themes/nexus/logo.png"></img><br>
<p>Proyecto enfocado en la administración de tratamientos y segumiento de 
sessiones a pacientes que contratan estos servicios, la aplicación es sencilla no maneja informacion contable 
tan especifica solamente cubre la facturación a futuro se implementará de ser necesario.</p>

<h3>Tecnologías:</h3>
<p>
La tecnológia con las que esta elaborada la aplicacion en cada una de sus fases son:
<ul>
<li><b>Backend:</b> Lenguaje de programación PHP, framework Codeignitger V2</li>
<li><b>FrontEnd:</b> Lenguaje de programación JS, framework Angular JS</li>
<li><b>Plantillas:</b> Las plantillas fueron basadas en el framework CSS materializecss</li>
<li><b>Base De Datos:</b> Base de Datos MySQL</li>
</ul>
</p>

<h3>Diseño Aplicación:</h3>
<p>
    <b>El backend</b> tiene implemnetado el modelo MVC que provee Codeigniter, sin embargo solo uno de los controladores
    adopta esta caracteristica (el principal) ya que despliega la SPA completa.<br>
    Los demas controllers tienen son proveedores de datos JSON con sus respectivas restricciones de session y 
    validaciones en las peticiones HTTP
</p>
<p>
    <b>El FrontEnd</b> Esta construido con plantillas basadas en el framework materializecss, y la parte dinámica fue 
    programada con el framework angular usando su arquitectura de factorias, controllers y rutes, algunos componentes
    como el autocomplete y otros estan basados en angular material y no en materializecss esto por facilidad de manejo 
    entre los componentes de la aplicación.
</p>
<p>
    <b>Base De Datos</b> La Base de datos lleva un registro de las modificaciones de los cambios a las tablas, para evitar 
    perdida de informacion, trabaja con un modelo ER en forma normal 3
</p>
<p>
    <b>Manejo de Errores</b> Todos los errores de la aplicación son interprestados por el Frontend pero son emitidos
    por el servidor cada uno de los errores esta compueto por un ['msg] y ['data] luego el front end lo clasifica
    y muestra al usuario con un titulo, descripcion y de ser posible los detalles de los errores
    , los errores estan
    codificados de acuerdo al siguiente standar
    <ul>
        <li><b>Errores Http Normales:</b> 406 ; 404; 500, se a aumentado 100 para no conexion y 600 para DB</li>
        <li> <b>Errores de Aplicacion:</b> Estos erroes estan numerados a partir del 2000, idican un error 
            ocurrido al momento de que la aplicación intentaba realizar una accion ejemplo: valores vacios, regitro
        inexistente etc. para ver mas detalles de los errores ve a </li>
        <li><b>Advertencias:</b> Las advertencias son estados en los que se informa al usuario de algo importante
        ejemplo, registros duplicados sesion iniciada o terminada</li>
        <li><b>Mensajes Aplicacion:</b> No son errores pero son mensajes importantes como confirmación de acciones
        por parte del server.</li>
        <li><b>Erroes Depuración: </b>Estos Errores solo sirven para depurar y solo hay uno de momento "4000" 
        este error indica que auna funcion no se le pasó un parametro que esta esperaba.</li>
    </ul>
Para obtener mas informacion de los errores ver archivo
<a href="https://github.com/eduardouio/mediperbarica/blob/master/app/js/app/appStatusMsg.js" >
    https://github.com/eduardouio/mediperbarica/blob/master/app/js/app/appStatusMsg.js
</a>
</p>
<p>
    <b>Desarrollador:</b> Eduardo Villota <eduardouio7@gmail.com>
</p>