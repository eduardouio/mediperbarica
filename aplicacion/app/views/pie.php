   </div><!-- End Page Content -->
      <small>
      <p class="pull-right pie-pagina"> <b>Dir:</b>
        Av. Eloy Alfaro N29-235 E Italia OF 112 <b>Edf:</b>Fortune Plaza
        <b>Telf:</b> (593) 2 380 1608 <b>Mail:</b>mediperbarica@gmail.com<br>
        <b>Desarrollado Por:</b> 
        <a href="http://twitter.com/eduardouio" target="_blank">Eduardo Villota</a>
        &copy; Mediperbarica 2015</p>
      </small>
    </div><!-- End Content Wrapper -->
  </div><!-- End Page Wrapper -->
</body>
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
//alert('cadena de la cosina mia =>' + toTitleCase('cadena de la cosina mia') );
// REtorna la primera letra de cada palabra en ayuscula
function toTitleCase(str)
{
    return str.replace(/\w\S*/g, function(txt){return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();});
}

</script>
<script src="<?php echo base_url();?>js/app/modulo_errores.js"> </script>
<script src="<?php echo base_url();?>js/app/modulo_<?php print($modulo);?>"></script>
</html>