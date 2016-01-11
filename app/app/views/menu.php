
      <div class="container"><a href="<?php print base_url()?>index.php/inicio" data-activates="nav-mobile" class="button-collapse top-nav waves-effect waves-light circle hide-on-large-only"><i class="mdi-navigation-menu"></i></a></div>
      <ul id="nav-mobile" class="side-nav fixed">
        <li class="logo"><a id="logo-container" href="<?php print base_url()?>index.php/inicio" class="brand-logo">
        <img src="<?php print base_url()?>images/img/logo_blanco.png" heigth="90" width="90">
            </a></li>
        <li class="search">
          <div class="search-wrapper card">
            <input id="search"><i class="material-icons">buscar</i>
            <div class="search-results">
              
            </div>
          </div>
        </li>
        <li class="no-padding">
          <ul class="collapsible collapsible-accordion">
            <li class="bold"><a class="collapsible-header  waves-effect waves-teal">Historias</a>
              <div class="collapsible-body">
                <ul>
                  <li><a href="#/listar-historias">Listar Historias</a></li>
                  <li><a href="grid.html">Crear Hisotirias</a></li>
                  <li><a href="grid.html">Buscar Hisotiria</a></li>
                </ul>
              </div>
            </li>
            <li class="bold"><a class="collapsible-header  waves-effect waves-teal">Tratamientos</a>
              <div class="collapsible-body">
                <ul>
                  <li><a href="navbar.html">Listar Tratamientos</a></li>
                  <li><a href="pagination.html">Crear Tratamiento</a></li>
                  <li><a href="preloader.html">Buscar Tratamiento</a></li>
                </ul>
              </div>
            </li>
            <li class="bold"><a class="collapsible-header  waves-effect waves-teal">Sesiones</a>
              <div class="collapsible-body">
                <ul>
                  <li><a href="collapsible.html">Iniciar Sesion</a></li>
                  <li><a href="dialogs.html">Listar Sesiones</a></li>
                  <li><a href="dropdown.html">Buscar Sesion</a></li>
                </ul>
              </div>
            </li>
            <li class="bold"><a class="collapsible-header  waves-effect waves-teal">Facturación</a>
              <div class="collapsible-body">
                <ul>
                  <li><a href="collapsible.html">Listar Facturas</a></li>
                  <li><a href="dialogs.html">Reporte Facturaciones</a></li>
                  <li><a href="dropdown.html">Crear Factura</a></li>
                  <li><a href="dropdown.html">Buscar Factura</a></li>
                </ul>
              </div>
            </li>
            <li class="bold"><a class="collapsible-header  waves-effect waves-teal">Usuarios</a>
              <div class="collapsible-body">
                <ul>
                  <li><a href="collapsible.html">Crear Nuevo Usuario</a></li>
                  <li><a href="dialogs.html">Cambiar Contraseña</a></li>
                  <li><a href="dropdown.html">Cerrar Sesion</a></li>
                </ul>
              </div>
            </li>
            <li class="bold"><a class="collapsible-header  waves-effect waves-teal">Personal</a>
              <div class="collapsible-body">
                <ul>
                  <li><a href="collapsible.html">Listar Personal</a></li>
                  <li><a href="dialogs.html">Ingresar Personal</a></li>
                  <li><a href="dropdown.html">Buscar Personal</a></li>
                </ul>
              </div>
            </li>
          </ul>
        </li>
      </ul>
      <nav>
    <div class="container">
    <div class="nav-wrapper">
      <a href="#" class="brand-logo">Medicina Hiperbarica</a>
      <ul id="nav-mobile" class="right hide-on-med-and-down">
        <li><a>Usuario</a></li>
        <li><a ng-click="logon()" ng-controller="loginController" >Salir</a></li>
      </ul>
    </div>
    </div>
  </nav>
    </header>