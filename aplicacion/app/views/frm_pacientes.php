<!-- Inicio de contenedor de la app de Personal-->
<div>
<div class="col-lg-8" style="border:1.5px solid #ccc;">
      <div class="form-horizontal" name="frmPersonal">
<fieldset>
    <p class="text-primary">Registro Paciente E Historia Médica</p>
<!-- Text input-->
<div class="form-group">
  <span class="col-md-2 control-label" >Cédula:</span>  
  <div class="col-md-4">
  <input name="id_paciente" ng-model="id_paciente" placeholder="Cedula/Pasaporte" class="form-control input-md" type="text" maxlength="10">
  <div ng-show="!id_paciente">
  <small class="text-danger">Requerido</small>
  <br> <p class="label label-info">Debe contener 10 digitos en caso de pasaporte completar con Ceros</p>
  </div>
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <span class="col-md-2 control-label">Nombres:</span>  
  <div class="col-md-5">
  <input name="nombres" ng-model="nombres" placeholder="Ingrese los nombres" class="form-control input-md" type="text" maxlength="40">
    <div ng-show="!nombres">
      <small class="text-danger">Requerido</small>
      <br> <p class="label label-info">Ingresar al menos nombre y apellido</p>
  </div>
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <span class="col-md-2 control-label">Telefono:</span>  
  <div class="col-md-4">
  <input name="telefono" ng-model="telefono" placeholder="Teléfono" class="form-control input-md" type="text" maxlength="10">
  <div ng-show="!nombres">
      <small class="text-danger">Requerido</small>
  </div>
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <span class="col-md-2 control-label">Fecha Nacimiento (aaaa-mm-dd):</span>  
  <div class="col-md-4">
  <input name="fecha_nacimiento" ng-model="fecha_nacimiento" placeholder="1984-04-19" class="form-control input-md" type="date" maxlength="10">
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <span class="col-md-2 control-label">Mail:</span>  
  <div class="col-md-5">
  <input name="mail" ng-model="mail" placeholder="algo@algo.ext" class="form-control input-md" type="email" maxlength="45">
    <div ng-show="!mail">
      <small class="text-danger">Requerido</small>
    <br> <p class="label label-info">El mail será usado para envio de citas</p>
  </div>
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <span class="col-md-2 control-label">Direccion:</span>  
  <div class="col-md-6">
  <input name="direccion" ng-model="direccion" placeholder="Ciudad,Dirección,Edificio" class="form-control input-xx" type="text" maxlength="120">
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <span class="col-md-2 control-label">Motivo Tratamiento:</span>  
  <div class="col-md-8">
  <input name="motivo_tratamiento" ng-model="motivo_tratamiento" placeholder="Motivo Del Tratamiento" class="form-control input-xx" type="text" maxlength="360">
  <div ng-show="!motivo_tratamiento">
      <small class="text-danger">Requerido</small>
  </div>
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <span class="col-md-2 control-label">Examen Físico:</span>  
  <div class="col-md-8">
  <input name="examen_fisico" ng-model="examen_fisico" placeholder="Examen Físico" class="form-control input-xx" type="text" maxlength="360">
  <div ng-show="!examen_fisico">
      <small class="text-danger">Requerido</small>
  </div>
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <span class="col-md-2 control-label">Manejo:</span>  
  <div class="col-md-8">
  <input name="manejo" ng-model="manejo" placeholder="Manejo" class="form-control input-xx" type="text" maxlength="180">
  </div>
</div>

<hr>
<span class="help-block"> <b>Referencias Familiares En Caso De Acompañante:</b></span>
<!-- Text input-->
<div class="form-group">
  <span class="col-md-2 control-label">Nombres:</span>  
  <div class="col-md-5">
  <input name="nombre_familiar" ng-model="nombre_familiar" placeholder="Ingrese Los Nombres Del Familiar" class="form-control input-md" type="text" maxlength="40">
    <div ng-show="!nombre_familiar">
      <br> <p class="label label-info">Ingresar al menos nombre y apellido</p>
  </div>
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <span class="col-md-2 control-label">Telefono:</span>  
  <div class="col-md-4">
  <input name="telefono_familiar" ng-model="telefono_familiar" placeholder="Teléfono Del Familiar" class="form-control input-md" type="text" maxlength="10">
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <span class="col-md-2 control-label">Direccion:</span>  
  <div class="col-md-6">
  <input name="direccion_familiar" ng-model="direccion_familiar" placeholder="Ciudad,Dirección,Edificio" class="form-control input-xx" type="text" maxlength="50">
  </div>
</div>

<hr>
</fieldset>
<div class="form-group">
    <span class="col-md-2 control-label">
        <button ng-click="validarFrmPersonal()" class="btn btn-primary"> Guardar Registro </button>
    </span>
</div>
</div>
</div>
    <div class="col-lg-4">
        <p href="#" class="text-primary">Acciones de Registro</p>
        <a class="btn btn-primary" ng-click="limpiarForm()"><span class="glyphicon glyphicon-plus"></span>
            &nbsp;&nbsp;Nuevo Registro&nbsp;
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