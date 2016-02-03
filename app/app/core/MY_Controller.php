<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
*	_ __ ___   ___  __| (_)_ __   ___ _ __| |__   __ _ _ __(_) __ _ 
* | '_ ` _ \ / _ \/ _` | | '_ \ / _ \ '__| '_ \ / _` | '__| |/ _` |
* | | | | | |  __/ (_| | | |_) |  __/ |  | |_) | (_| | |  | | (_| |
* |_| |_| |_|\___|\__,_|_| .__/ \___|_|  |_.__/ \__,_|_|  |_|\__,_|
*                        |_|                                       
*/
class MY_Controller extends CI_Controller{

	public $Pagina_;

	public function __construct() {
       parent::__construct();
       #$this->_checkSesion();
    }
	
//Muestra el estado de la sesion en pantalla
	public function _showSession(){

	}

	/**
     * Cheque la sesion cuando se carga un controlador 
     * @param (array) arreglo de session
     * @return (bool) existe la sesion 
     */
	public function _checkSession(){
        if($this->session->userdata('logueado')){
            //si existe retorna 1
            return 1;  
        } else{
            //redirecciona al login
            $this->session->sess_destroy();
            $this->_redirectLoginPage();
        }
	}

    /**
     * Valida los datos de los formularios contra una matriz
     * @param  (array) $params requisitos minimos
     * @param (array) $userData valores ingresados por user
     * @param (int) $items cantidad de items obligatorios
     * @return (int) codigo de estado
     */
    public function _validUserData($params,$userData,$items){
        #status 1 todo esta bien y contador para datos obligatorios
        $status = 1;
        $i = 0;
        print(var_dump($params));
        print(var_dump($userData));
        print(var_dump($items));

        #comprobamos que los datos del user tenga datos
        if(count($userData) > 0){
            foreach ($userData as $key => $value) {
                $i++;
                #comprobamos las longitudes
                if(!(($params[$key]) < (strlen($value)))){
                    return 2005;
                }
            }
            #comprobamos que se tenga la cantidad de items minima
            if($i == $items){
                return 1;
            }else{
                return 2000;
            }
        }else{
            #arreglo vacio
            return 4000;
        }
    }

    /**
     * Redirecciona Login
     */
    protected function _redirectLoginPage(){
        header('Status: 301 Moved Permanently', false, 301);
        header('Location: ' . base_url());
    }

    public function _notAuthorized(){
        $this->rest->_responseHttp('Entrada No autorizada favor vuelva a ' .
                    base_url(),405);
    }

	  /*************************************************************************
    * Carga los datos en las plantillas HTML y las Imprime  
    * @method _mostrarHTML()
    * @param (array) arreglo con el listado de vistas y datos
    * @param (str) nombre del modulo angular
    * @return (void)
    *************************************************************************/
     function _mostrarHTML($catalogo){
        $vistas;
        $this->Pagina_;
        foreach ($catalogo as $arreglos => $nombres) {
            $vistas[] = $arreglos;
            }
        foreach ($vistas as $nombre) {
            $this->Pagina_ = $this->Pagina_ . $this->load->view($nombre,
                                                    $catalogo[$nombre],true);
            }
        $this->Pagina_ = $this->Pagina_ . $this->load->view('pie');
        print $this->Pagina_;
        }

}
