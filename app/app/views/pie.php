 <footer class="page-footer">
      <div class="container">
        <div class="row">
          <div class="col l6 s12">
          </div>
          <div class="col l6 s12">
            </a>
          </div>
      </div>


      <div class="footer-copyright">
        <div class="container">
        © 2014-2015 Mediperbarica, Todos los derechos reservados
        <a class="grey-text text-lighten-4 right" href="http://medicinahiperbarica.com.es">eduardouio7@gmail.com</a>
        </div>
      </div>
    </footer>

<script type="text/javascript">
  
  var host = '<?php print(base_url()); ?>';
	var httpResult = {};

// Funciones Auxiliares
// Retorna la cantidad de metodos y propiedades de un objeto
	function inspeccionar(obj)
{
  var msg = '';
  for (var property in obj)
  {
    if (typeof obj[property] == 'function')
    {
      var inicio = obj[property].toString().indexOf('function');
      var fin = obj[property].toString().indexOf(')')+1;
      var propertyValue=obj[property].toString().substring(inicio,fin);
      msg +=(typeof obj[property])+' '+property+' : '+propertyValue+' ;\n';
    }
    else if (typeof obj[property] == 'unknown')
    {
      msg += 'unknown '+property+' : unknown ;\n';
    }
    else
    {
      msg +=(typeof obj[property])+' '+property+' : '+obj[property]+' ;\n';
    }
  }
  return msg;
}
</script>

    <!--  Scripts-->
    <script src="<?php print base_url();?>js/jquery-2.1.4.min.js"></script>
    <script>if (!window.jQuery) { document.write('<script src="http://materializecss.com/bin/jquery-2.1.1.min.js"><\/script>'); }
    </script>
    <script src="<?php print base_url();?>js/jquery.timeago.min.js"></script>
    <script src="<?php print base_url();?>js/prism.js"></script>
    <script src="<?php print base_url();?>js/jade/lunr.min.js"></script>
    <script src="<?php print base_url();?>js/jade/search.js"></script>
    <script src="<?php print base_url();?>bin/materialize.js"></script>
    <script src="<?php print base_url();?>js/init.js"></script>
<!-- Librerias de Angular Adicionales-->
  <script type="text/javascript" src="<?php echo base_url();?>js/angular.js"></script>
  <script src="<?php echo base_url();?>js/angular-animate.min.js"></script>
  <script src="<?php echo base_url();?>js/angular-aria.min.js"></script>
  <script type="text/javascript" src="<?php echo base_url();?>js/angular-route.js"></script>
  <script type="text/javascript" src="<?php echo base_url();?>js/angular-resource.js"></script>
  <script src="<?php echo base_url();?>js/angular-material.min.js"></script>
  <script src="<?php echo base_url();?>js/angular-autocomplete.js"></script>
  <script src="<?php echo base_url();?>js/angular-sanitize.js"></script>

<script src="<?php echo base_url();?>js/app/appStatusMsg.js"></script>
<script src="<?php echo base_url();?>js/app/app.js"></script>
<script src="<?php echo base_url();?>js/app/appRoutes.js"></script>
<script src="<?php echo base_url();?>js/app/appFactories.js"></script>
<script src="<?php echo base_url();?>js/app/appControllers.js"></script>
<script type="text/javascript">
    //alert('cadena de la cosina mia =>' + toTitleCase('cadena de la cosina mia') );
// REtorna la primera letra de cada palabra en ayuscula
function toTitleCase(str)
{
    return str.replace(/\w\S*/g, function(txt){return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();});
}
</script>


  </body>
</html>