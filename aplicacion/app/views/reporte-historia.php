<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Historia M&eacute;dica Mediperbarcica</title>
  </head>
    
    <style type="text/css">
.tg  {border-collapse:collapse;border-spacing:0;}
.tg td{font-family:Arial, sans-serif;font-size:14px;padding:5px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;}
.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:5px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;}
.tg .tg-4kyz{font-size:20px;text-align:center}
.tg .tg-a6gn{font-weight:bold;font-size:100%;text-align:right}
.tg .tg-34fq{font-weight:bold;text-align:right}
.tg .tg-jr4o{font-weight:bold;font-size:18px;text-align:right}
.tg .tg-2sfh{font-weight:bold;background-color:#efefef}
.tg .tg-hgcj{font-weight:bold;text-align:center}

.container {
    width: 970px;
    margin-right: auto;
    margin-left: auto;
    padding-left: 50px;
    padding-top: 30px;
    padding-right: 15px;
}
.pie-pagina{
  text-align: center;
}
</style>
<body class="container">
<table class="tg" style="undefined;table-layout: fixed; width: 874px">
<colgroup>
<col style="width: 164px">
<col style="width: 119px">
<col style="width: 33px">
<col style="width: 56px">
<col style="width: 105px">
<col style="width: 87px">
<col style="width: 145px">
<col style="width: 71px">
<col style="width: 94px">
</colgroup>
  <tr>
    <th colspan="9">
    <img src="<?php echo base_url();?>img/logo_blanco.png" width = "100" style="float:left; margin:0px;" >
    <h2>HISTORIA M&Eacute;DICA</h2>
    Reporte de historia de Medicina Hiperbarica S.A.</th>
  </tr>
  <tr>
    <td class="tg-a6gn" colspan="4">Fecha:</td>
    <td class="tg-031e" colspan="2"><?php print $historia['creado'];?></td>
    <td class="tg-34fq">Historia:</td>
    <td class="tg-jr4o" colspan="2"><?php print $historia['id_historia'];?></td>
  </tr>
  <tr>
    <td class="tg-2sfh" colspan="9">DATOS PERSONALES DEL PACIENTE:<br><br></td>
  </tr>
  <tr>
    <td class="tg-34fq">Nombres y Apellidos:<br></td>
    <td class="tg-031e" colspan="5"><?php print $historia['nombres'];?></td>
    <td class="tg-34fq">Edad:</td>
    <td class="tg-031e" colspan="2"><?php print $historia['fecha_nacimiento'];?></td>
  </tr>
  <tr>
    <td class="tg-34fq">Nro. De Cédula:</td>
    <td class="tg-031e"><?php print $historia['id_paciente'];?></td>
    <td class="tg-34fq" colspan="2">Email:<br></td>
    <td class="tg-031e" colspan="2"><?php print $historia['mail'];?></td>
    <td class="tg-34fq">Teléfono:</td>
    <td class="tg-031e" colspan="2"><?php print $historia['telefono'];?></td>
  </tr>
  <tr>
    <td class="tg-34fq">Dirección:<br></td>
    <td class="tg-031e" colspan="8"><?php print $historia['direccion'];?></td>
  </tr>
  <tr>
    <td class="tg-2sfh" colspan="9">INFORMACIÓN MEDICO REFERENTE:<br><br></td>
  </tr>
  <tr>
    <td class="tg-34fq">Nombres:<br></td>
    <td class="tg-031e" colspan="5"><?php print $historia['nombre_referente'];?></td>
    <td class="tg-34fq">Teléfono:</td>
    <td class="tg-031e" colspan="2"><?php print $historia['telefono_referente'];?></td>
  </tr>
  <tr>
    <td class="tg-34fq">Email:</td>
    <td class="tg-031e" colspan="8"><?php print $historia['mail_referente'];?></td>
  </tr>
  <tr>
    <td class="tg-2sfh" colspan="9">INFORMACIÓN EN CASO DE FAMILIAR:<br><br></td>
  </tr>
  <tr>
    <td class="tg-34fq">Nombres:<br></td>
    <td class="tg-031e" colspan="5"><?php print $historia['nombre_familiar'];?></td>
    <td class="tg-34fq">Teléfono:</td>
    <td class="tg-031e" colspan="2"><?php print $historia['telefono_familiar'];?></td>
  </tr>
  <tr>
    <td class="tg-34fq">Dirección:<br></td>
    <td class="tg-031e" colspan="8"><?php print $historia['direccion_familiar'];?></td>
  </tr>
  <tr>
    <td class="tg-2sfh" colspan="9">ANTECEDENTES MÉDICOS:<br><br></td>
  </tr>
  <?php
  foreach ($antecedentes as $key) {
    print ('<tr><td class="tg-34fq" style="color:#044078">Tipo Antecedente:<br></td>');
    print('<td class="tg-031e" colspan="8" style="color:#044078">' . $key['tipo'] . '</td></tr>');
    print('<tr><td class="tg-34fq">Descripción:<br></td>');
    print('<td class="tg-031e" colspan="8">' . $key['detalle'] . '<br/><br/></td></tr>');
  }
  ?>
  <tr>
    <td class="tg-2sfh" colspan="9">HISTORIA DE TRATAMIENTOS:<br><br></td>
  </tr>
  <tr>
    <td class="tg-34fq">Fecha:</td>
    <td class="tg-031e"></td>
    <td class="tg-34fq" colspan="2">Sesiones:</td>
    <td class="tg-031e"></td>
    <td class="tg-34fq">Doctor:</td>
    <td class="tg-031e" colspan="3"></td>
  </tr>
  <tr>
    <td class="tg-34fq">Motivo Tratamiento:<br></td>
    <td class="tg-031e" colspan="8"></td>
  </tr>
  <tr>
    <td class="tg-2sfh" colspan="9">FIRMAS:<br><br></td>
  </tr>
  <tr>
    <td class="tg-031e" colspan="3"><br><br><br><br></td>
    <td class="tg-031e" colspan="4"></td>
    <td class="tg-hgcj" colspan="2" rowspan="2"><br><?php print $historia['creado'];?><br></td>
  </tr>
  <tr>
    <td class="tg-hgcj" colspan="3"><?php print $historia['nombres'];?><br>CI:<?php print $historia['id_paciente'];?></td>
    <td class="tg-hgcj" colspan="4">MEDIPERBARICA S.A.<br>RUC:1792552044001</td>
  </tr>
</table>
  </body>
</html>