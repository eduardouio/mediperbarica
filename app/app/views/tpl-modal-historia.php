<?php
$history = $data['history'][0];
$status = 0;
$lastStatus = 0;
$antecedent = $data['antecedent'];
$treatments = $data['treatments'];
$sessions = $data['sessions'];
$lastTreatmentid = 0;
?>
<div class="container">
<div id="modal1" class="modal modal-fixed-footer">
<div class="modal-content">
            <div class="row">
         <div class="col s8">
               <h5 class="left-align">
                <?php print$history['nombres']; ?> 
                &nbsp;&nbsp;
                  <b class="blue-text text-darken-3">Historia:</b>
                   <?php print$history['id_historia'];?>
               </h5>               
            </div>
          <div class="col s4">
               <h5 class="left-align">
                <b class="blue-text text-darken-3">28 Años</b>
               </h5>               
            </div>
         </div>
   
      <table class="bordered card-panel">
         <tr>
            <td><b>ID</b></td>
            <td><?php print $history['id_paciente']?></td>
            <td><b>Telef:</b></td>
            <td><?php print $history['telefono']?></td>
            <td><b>Fecha Nac:</b></td>
            <td><?php print $history['fecha_nacimiento']?></td>
         </tr>
         <tr>
            <td><b>Email:</b></td>
            <td><?php print $history['mail']?></td>
            <td><b>Nombre Ref:</b></td>
            <td><?php print $history['nombre_referente']?></td>
            <td><b>Telf Ref:</b></td>
            <td><?php print $history['telefono_referente']?></td>
         </tr>
         <tr>
            <td colspan="2"><b class="teal-text text-lighten-3">Datos Familiar</b></td>
         </tr>
         <tr>
            <td><b>Nombre:</b></td>
            <td><?php print $history['nombre_familiar']?></td>
            <td><b>Telf:</b></td>
            <td><?php print $history['telefono_familiar']?></td>
         </tr>
        <tr>
            <td colspan="2"><b class="red-text text-red">Antecedentes Médicos:</b></td>
         </tr>
         <?php
         foreach ($antecedent as $row){
            print('<tr>');
            print('<td colspan="2"><b>' . $row['tipo'] . ':</b></td>');
            print('<td colspan="4">' . $row['detalle'] . '</td>');
            print('</tr>');
               }
         ?>
         <tr>
            <td colspan="2"><b class="green-text text-green">Tratamientos:</b></td>
         </tr>
          <?php
          $c = 0;
         foreach ($treatments as $row){
            print('<tr>');
            print('<td class="teal-text"><b>ID:</b></td>');
            print('<td class="teal-text">' . $row['id_tratamiento'] . '</td>');
            print('<td><b>Motivo:</b></td>');
            print('<td>' . $row['motivo_tratamiento'] . '</td>');
            print('<td><b> Sesiones:</b></td>');
            print('<td>' . $row['nro_sesiones'] . '</td>');
            print('</tr>');
            print('<tr>');
            print('<td><b>Ses Rea:</b></td>');
            print('<td>' . $row['sesiones_realizadas'] . '</td>');
            print('<td><b>Personal:</b></td>');
            print('<td>' . $row['nombres'] . '</td>');
            print('<td><b> Satus:</b></td>');
            $status = ($row['nro_sesiones'] - $row['sesiones_realizadas']);
            if($status > 0 ){
              print('<td class="green-text">Activo</td>');
            }else{
              print('<td class="orange-text">Terminado</td>');
            }
            print('</tr>');
            if($c == 0){
            $lastTreatmentid = $row['id_tratamiento'];
            $lastStatus = $status;
          }
            $c++;
          }
         ?>
         <tr>
            <td colspan="2"><b class="green-text text-green">Ultimas Sesiones:</b></td>
         </tr>
          <?php
         foreach ($sessions as $row){ 
                print('<tr>');
                print('<td class="teal-text"><b>ID:</b></td>');
                print('<td class="teal-text">' . $row['id_sesion'] . '</td>');
                print('<td><b>Fecha:</b></td>');
                print('<td>' . $row['fecha'] . ' / ' . $row['hora'] . '</td>');
                print('<td><b> Personal:</b></td>');
                print('<td>' . $row['nombres'] . '</td>');
                print('</tr>');
                }
         ?>
      </table>
   </div>
         
         <div class="modal-footer">
    <div class="row">
<div class="col s1 offset-s11">
          <span class="left-align btn red" onclick="cerrarModal()">
          Cerrar
          </span>
      </div>

    </div>
          
</div>
</div>
      </div>
  </div>
  <script type="text/javascript">
  $('#modal1').openModal();
  function cerrarModal(){
   $('#modal1').closeModal();
  }
  </script>