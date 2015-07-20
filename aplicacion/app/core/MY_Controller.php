<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
*	_ __ ___   ___  __| (_)_ __   ___ _ __| |__   __ _ _ __(_) __ _ 
* | '_ ` _ \ / _ \/ _` | | '_ \ / _ \ '__| '_ \ / _` | '__| |/ _` |
* | | | | | |  __/ (_| | | |_) |  __/ |  | |_) | (_| | |  | | (_| |
* |_| |_| |_|\___|\__,_|_| .__/ \___|_|  |_.__/ \__,_|_|  |_|\__,_|
*                        |_|                                       
*/
class MY_Controller extends CI_Controller{
	
	public function __construct() {
       parent::__construct();
    }
	
//Muestra el estado de la sesion en pantalla
	public function _showSession(){
		print(var_dump($this->session->userdata));
	}

	//chequea el estado de una sesion
	// return boolean
	public function _checkSesion($sessionID){
        
	}

	  /*************************************************************************
    * Carga los datos en las plantillas HTML y las Imprime  
    * @method _mostrarHTML()
    * @param (array) arreglo con el listado de vistas y datos
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

        $this->Pagina_ = $this->Pagina_ . $this->load->view('pie',
        											$this->ModuloAngular_,true);
        
        print $this->Pagina_;
        }

}
