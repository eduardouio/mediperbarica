
    <div class="row">
      <div class="col s4">
        <p>&nbsp;</p>
      </div>
      <div class="col s4">
        <div class="login-body container" ng-controller = "loginController">
    <article class="container-login center-block">
    <section class="alert alert-warning" ng-show="userData.alerta">
        {{userData.alerta}}
    </section>
        <section>
            <div class="tab-content tabs-login col-lg-12 col-md-12 col-sm-12 cols-xs-12">
                <div id="login-access" class="tab-pane fade active in">
                <img src="http://medicinahiperbarica.com.ec/sites/all/themes/nexus/logo.png" class="text-center" align="right" alt="mediperbarica_logo">
                <br>
                    <h3>Mediperbarica</h3>     
                    <br>                
                    <form accept-charset="utf-8" role="form" class="form-horizontal" ng-submit="validForm(userData)">
                        <div class="form-group ">
                            <label for="login" class="sr-only">Usuario</label>
                                <input type="text" class="form-control" name="username" id="login_value" 
                                    placeholder="User" tabindex="1" value="" required ng-model="userData.username" />
                        </div>
                        <div class="form-group ">
                            <label for="password" class="sr-only">Password</label>
                                <input type="password" class="form-control" name="password" id="password"
                                    placeholder="Password" value="" tabindex="2" ng-model="userData.password" required/>
                        </div>
                        
                                <input type="checkbox" id="recordar"/> <label for="recordar">Recordarme</label>
                        <br/>
                        <div class="form-group ">               
                                <button type="submit" id="submit" class="btn btn-lg btn-primary">Entrar</button>
                        </div>
                    </form>         
                </div>
            </div>
        </section>
    </article>
</div>
      </div>
      <div class="col s4">
        <p>&nbsp;</p>      </div>

    </div>
          

