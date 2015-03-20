<div class="col-lg-8" style="border:1.5px solid #ccc;">
      <form class="form-horizontal" method="post" id="frm_personal" onsubmit="guardarForm('#frm_personal')">
<fieldset>
    <p class="text-primary">Registro de Nuevo Personal</p>
<!-- Text input-->
<div class="form-group">
  <span class="col-md-2 control-label" for="cedula">C&eacute;dula:</span>  
  <div class="col-md-4">
  <input id="cedula" name="cedula" placeholder="Cedula" class="form-control input-md" required="required" type="text" maxlength="10">
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <span class="col-md-2 control-label" for="nombres">Nombres:</span>  
  <div class="col-md-5">
  <input id="nombres" name="nombres" placeholder="Ingrese los nombres" class="form-control input-md" required="required" type="text" maxlength="40">
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <span class="col-md-2 control-label" for="telefono">Telefono:</span>  
  <div class="col-md-4">
  <input id="telefono" name="telefono" placeholder="022226906" class="form-control input-md" type="text" maxlength="10">
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <span class="col-md-2 control-label" for="celular">Celular:</span>  
  <div class="col-md-4">
  <input id="celular" name="celular" placeholder="0992936569" class="form-control input-md" type="text" maxlength="10">
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <span class="col-md-2 control-label" for="mail">Mail:</span>  
  <div class="col-md-5">
  <input id="mail" name="mail" placeholder="algo@algo.ext" class="form-control input-md" required="required" type="email" maxlength="45">
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <span class="col-md-2 control-label" for="direccion">Direccion:</span>  
  <div class="col-md-6">
  <input id="direccion" name="direccion" placeholder="Ciudad,Direccion,Edificio" class="form-control input-md" type="text" maxlength="180">
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <span class="col-md-2 control-label" for="notas">Notas:</span>  
  <div class="col-md-8">
  <input id="notas" name="notas" placeholder="Notas Adicionales" class="form-control input-md" type="text" maxlength="180">
  <span class="help-block">Horarios de atencion, Tipos de pacientes, etc.</span>  
  </div>
</div>
</fieldset>
<div class="form-group">
    <span class="col-md-2 control-label" for="notas">
        <input type="submit" value="Guardar Registro" class="btn btn-primary" onclick="guardarForm('#frm_personal')">
    </span>
</div>
</form>
</div>
    <div class="col-lg-4">
        <p class="text-primary">Acciones de Registro</p>
        <a href="#" class="btn btn-info"><span class="glyphicon glyphicon-plus"></span>
            &nbsp;&nbsp;Nuevo Regstro&nbsp;&nbsp;
        </a>
        <br><br>
        <a href="#" class="btn btn-info"><span class="glyphicon glyphicon-list"></span>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Listar Todo&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </a>
        <br><br>
        <a href="#" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span>
            Cerrar Formulario
        </a>
        <br><br>
    </div>
