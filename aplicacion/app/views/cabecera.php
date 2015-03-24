<!doctype html>
<html lang="es" ng-app="mediperbaricaApp">
<head>
	<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Mediperbarica</title>
  <link rel="stylesheet" type="text/css" href="<?php echo base_url();?>css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="<?php echo base_url();?>css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="<?php echo base_url();?>css/dashboard/dashboard.css">
  <link rel="stylesheet" type="text/css" href="<?php echo base_url();?>css/themes/blue.css">
  <!--
  <link rel="stylesheet" type="text/css" href="css/themes/green.css">
  <link rel="stylesheet" type="text/css" href="css/themes/red.css">
  -->
  <script type="text/javascript" src="<?php echo base_url();?>js/angular.js"></script>
  <script type="text/javascript" src="<?php echo base_url();?>js/angular-route.js"></script>
  <script type="text/javascript" src="<?php echo base_url();?>js/jquery-2.1.3.js"></script>
  <script type="text/javascript" src="<?php echo base_url();?>js/bootstrap.js"></script>
</head>
<body>
  <div id="page-wrapper">
    <!-- Sidebar -->
    <div id="sidebar-wrapper">
      <ul class="sidebar">
        <li class="sidebar-main">
          <a href="#">
            MEDIPERBARICA
            <span class="menu-icon glyphicon glyphicon-home"></span>
          </a>
        </li>
        <li class="sidebar-title"><span>MENU</span></li>
        <li class="sidebar-list">
          <a href="#pacientes">Pacientes <span class="menu-icon fa fa-user"></span></a>
        </li>
         <li class="sidebar-list">
          <a href="#tratamientos">Tratamientos <span class="menu-icon fa fa-support"></span></a>
        </li>
        <li class="sidebar-list">
          <a href="#clientes">Clientes <span class="menu-icon fa fa-briefcase"></span></a>
        </li>
        <li class="sidebar-list">
          <a href="#facturacion">Facturación <span class="menu-icon fa fa-money"></span></a>
        </li>
        <li class="sidebar-list">
          <a href="#usuarios">Usuarios <span class="menu-icon fa fa-cog"></span></a>
        </li>
        <li class="sidebar-list">
          <a href="#personal"> Personal<span class="menu-icon fa fa-plus"></span></a>
        </li>
        <li class="sidebar-list">
          <a href="#acerca">Acerca <span class="menu-icon fa fa-barcode"></span></a>
        </li>
      </ul>
      <div class="sidebar-footer">
        <div class="col-xs-4">
          <a href="http://twitter.com/eduardouio" target="_blank">
            EVillota
          </a>
        </div>
        <div class="col-xs-4">
          <a href="#" target="_blank">
            &copy; 2015
          </a>
        </div>
        <div class="col-xs-4">
          <a href="#">
            Mediperbarica
          </a>
        </div>
      </div>
    </div>

    <!-- End Sidebar -->

    <div id="content-wrapper">
      <div class="page-content">

        <!-- Header Bar -->

        <div class="row header">
          <div class="col-xs-12">
            <div class="meta pull-left">
              <div class="page">
                Medicina Hiperb&aacute;rica S.A.
              </div>
              <div class="breadcrumb-links">
                Tratamientos De Medicina Hiperb&aacute;rica
              </div>
            </div>
            <div class="user pull-right">
              <div class="item dropdown">
                <a href="#" class="dropdown-toggle">
                  <img src="<?php echo base_url();?>img/avatar.jpg">
                </a>
                <ul class="dropdown-menu dropdown-menu-right">
                  <li class="dropdown-header">
                    Nombre de Usuario
                  </li>
                  <li class="link">
                    <a href="#">
                      Alertas Importantes
                    </a>
                  </li>
                  <li class="divider"></li>
                  <li class="link">
                    <a href="#">
                      Salir Sistema
                    </a>
                  </li>
                </ul>               
              </div>
            </div>
          </div>
        </div>
        <!-- End Header Bar -->
