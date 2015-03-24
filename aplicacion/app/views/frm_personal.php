<!-- Inicio de contenedor de la app de Personal-->
<div  ng-controller="CtrlPersonalController">
<div class="col-lg-8" style="border:1.5px solid #ccc;">
      <div class="form-horizontal" name="frmPersonal">
<fieldset>
    <p class="text-primary">Registro de Nuevo Personal</p>
<!-- Text input-->
<div class="form-group">
  <span class="col-md-2 control-label" for="cedula">C&eacute;dula:</span>  
  <div class="col-md-4">
  <input name="id_personal" ng-model="id_personal" placeholder="Cedula" class="form-control input-md" type="text" maxlength="10">
  </div>
  <div ng-show="!id_personal">
  <small class="text-danger">Requerido</small>
  <br> <p class="label label-warning">Debe contener 10 digitos en caso de pasaporte completar con Ceros</p>
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <span class="col-md-2 control-label" for="nombres">Nombres:</span>  
  <div class="col-md-5">
  <input name="nombres" ng-model="nombres" placeholder="Ingrese los nombres" class="form-control input-md" type="text" maxlength="40">
  </div>
    <div ng-show="!nombres">
      <small class="text-danger">Requerido</small>
      <br> <p class="label label-warning">Ingresar al menos nombre y apellido</p>
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <span class="col-md-2 control-label" for="telefono">Telefono:</span>  
  <div class="col-md-4">
  <input name="telefono_fijo" ng-model="telefono_fijo" placeholder="022226906" class="form-control input-md" type="text" maxlength="10">
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <span class="col-md-2 control-label" for="celular">Celular:</span>  
  <div class="col-md-4">
  <input name="celular" ng-model="celular" placeholder="0992936569" class="form-control input-md" type="text" maxlength="10">
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <span class="col-md-2 control-label" for="mail">Mail:</span>  
  <div class="col-md-5">
  <input name="mail" ng-model="mail" placeholder="algo@algo.ext" class="form-control input-md" type="email" maxlength="45">
  </div>
    <div ng-show="!mail">
      <small class="text-danger">Requerido</small>
    <br> <p class="label label-warning">El mail será usado para envio de citas</p>
  </div>
</div>


<!-- Text input-->
<div class="form-group">
  <span class="col-md-2 control-label" for="direccion">Direccion:</span>  
  <div class="col-md-6">
  <input name="direccion" ng-model="direccion" placeholder="Ciudad,Direcci&oacute;n,Edificio" class="form-control input-md" type="text" maxlength="180">
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <span class="col-md-2 control-label" for="notas">Notas:</span>  
  <div class="col-md-8">
  <input name="notas" ng-model="notas" placeholder="Notas Adicionales" class="form-control input-md" type="text" maxlength="180">
  <span class="help-block">Horarios de atencion, Tipos de pacientes, etc.</span>  
  </div>
</div>
</fieldset>
<div class="form-group">
    <span class="col-md-2 control-label" for="notas">
        <button ng-click="validarFrmPersonal()" class="btn btn-primary"> Guardar Registro </button>
    </span>
</div>
</div>
</div>
    <div class="col-lg-4">
        <p href="#" class="text-primary">Acciones de Registro</p>
        <a class="btn btn-primary" ng-click="limpiarForm()"><span class="glyphicon glyphicon-plus"></span>
            &nbsp;&nbsp;Nuevo Registro&nbsp;&nbsp;
        </a>
        <br><br>
        <a href="#" class="btn btn-primary"><span class="glyphicon glyphicon-list"></span>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Listar Todo &nbsp;&nbsp;&nbsp;&nbsp;
        </a>
        <br><br>
        <a href="#" class="btn btn-danger" ng-click="cerrarForm"><span class="glyphicon glyphicon-remove"></span>
            Cerrar Formulario
        </a>
        <br><br>
        <div class="well well-info">
          <p class="alert alert-success">
            El registro para <b>{{nombres}}</b> se ha guardado correctamente!.

          </p>
        </div>

    </div>
</div>
<!--fin  contenedor de la app de Personal-->