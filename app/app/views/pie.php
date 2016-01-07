   </div><!-- End Page Content -->
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
<script src="<?php echo base_url();?>js/app/app.js"></script>
<script src="<?php echo base_url();?>js/app/appRoutes.js"></script>
<script src="<?php echo base_url();?>js/app/appFactories.js"></script>
<script src="<?php echo base_url();?>js/app/appControllers.js"></script>
<script src="<?php echo base_url();?>js/app/appStatusMsg.js"></script>
</html>