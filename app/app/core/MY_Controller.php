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
	public function _checkSesion(){
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
     * Redirecciona Login
     */
    protected function _redirectLoginPage(){
        header('Status: 301 Moved Permanently', false, 301);
        header('Location: ' . base_url());
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
