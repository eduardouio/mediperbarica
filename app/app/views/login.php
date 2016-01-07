<style type="text/css">
    @import url("http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,700italic,400,300,700");

body {
    font-family: Open Sans;
    font-size: 14px;
    line-height: 1.42857;
    background: #333333;
    height: 350px;
    padding: 0;
    margin: 0;
}
.container-login {
    min-height: 0;
    width: 480px;
    color: #333333;
    margin-top: 40px;
    padding: 0;
}
.center-block {
    display: block;
    margin-left: auto;
    margin-right: auto;
}
.container-login > section {
    margin-left: 0;
    margin-right: 0;
    padding-bottom: 10px;
}
#top-bar {
    display: inherit;
}
.nav-tabs.nav-justified {
    border-bottom: 0 none;
    width: 100%;
}
.nav-tabs.nav-justified > li {
    display: table-cell;
    width: 1%;
    float: none;
}
.container-login .nav-tabs.nav-justified > li > a,
.container-login .nav-tabs.nav-justified > li > a:hover,
.container-login .nav-tabs.nav-justified > li > a:focus {
    background: #ea533f;
    border: medium none;
    color: #ffffff;
    margin-bottom: 0;
    margin-right: 0;
    border-radius: 0;
}
.container-login .nav-tabs.nav-justified > .active > a,
.container-login .nav-tabs.nav-justified > .active > a:hover,
.container-login .nav-tabs.nav-justified > .active > a:focus {
    background: #ffffff;
    color: #333333;
}
.container-login .nav-tabs.nav-justified > li > a:hover,
.container-login .nav-tabs.nav-justified > li > a:focus {
    background: #de2f18;
}
.tabs-login {
    background: #ffffff;
    border: medium none;
    margin-top: -1px;
    padding: 10px 30px;
}
.container-login h2 {
    color: #ea533f;
}
.form-control {
    background-color: #ffffff;
    background-image: none;
    border: 1px solid #999999;
    border-radius: 0;
    box-shadow: 0 1px 1px rgba(0, 0, 0, 0.075) inset;
    color: #333333;
    display: block;
    font-size: 14px;
    height: 34px;
    line-height: 1.42857;
    padding: 6px 12px;
    transition: border-color 0.15s ease-in-out 0s, box-shadow 0.15s ease-in-out 0s;
    width: 100%;
}
.container-login .checkbox {
    margin-top: -15px;
}
.container-login button {
    background-color: #ea533f;
    border-color: #e73e28;
    color: #ffffff;
    border-radius: 0;
    font-size: 18px;
    line-height: 1.33;
    padding: 10px 16px;
    width: 100%;
}
.container-login button:hover,
.container-login button:focus {
    background: #de2f18;
    border-color: #be2815;
}

.pull-right{
    color:#fff;
}
</style>
<div class="login-body container" ng-controller = "loginController">
    <article class="container-login center-block">
    <section class="alert alert-warning" ng-show="user.alerta">
        {{user.alerta}}
    </section>
        <section>
            <ul id="top-bar" class="nav nav-tabs nav-justified">
                <li class="active"><a href="#login-access">Bienvenido</a></li>
                <li><a>Medicina Hiperb&aacute;rica S.A.</a></li>
            </ul>
            <div class="tab-content tabs-login col-lg-12 col-md-12 col-sm-12 cols-xs-12">
                <div id="login-access" class="tab-pane fade active in">
                <img src="http://medicinahiperbarica.com.ec/sites/all/themes/nexus/logo.png" class="text-center" align="right" alt="mediperbarica_logo">
                <br>
                    <h2><i class="glyphicon glyphicon-log-in"></i> Inicio de Sesi&oacute;n</h2>     
                    <br>                
                    <form accept-charset="utf-8" role="form" class="form-horizontal" ng-submit="validForm(user)">
                        <div class="form-group ">
                            <label for="login" class="sr-only">Usuario</label>
                                <input type="text" class="form-control" name="username" id="login_value" 
                                    placeholder="User" tabindex="1" value="" required ng-model="user.username" />
                        </div>
                        <div class="form-group ">
                            <label for="password" class="sr-only">Password</label>
                                <input type="password" class="form-control" name="password" id="password"
                                    placeholder="Password" value="" tabindex="2" ng-model="user.password" required/>
                        </div>
                        <div class="checkbox">
                                <label class="control-label" for="remember_me">
                                    <input type="checkbox" name="remember_me" value="1" tabindex="3" /> Recordarme
                                </label>
                        </div>
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