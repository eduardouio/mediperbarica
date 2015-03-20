<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Welcome extends CI_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -  
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in 
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see http://codeigniter.com/user_guide/general/urls.html
	 */
	public function index()
	{
		$this->load->view('cabecera');
		$this->load->view('alertas');
		$this->load->view('totales');
        $this->load->view('frm_personal');
		$this->load->view('widget_tratamientos');
		$this->load->view('widget_pacientes');
		$this->load->view('pie');
	}

	

	/**
	* Se encrarga de recibir la informacion y genera la pantalla de salia
	* Todos los valores se guardan en una variable de clase $Pagina_
	* Es este metodo el que decide que vistas mostrar a partir de los paramtros recibidos
	*
	* @param array $catalogo array con las plantillas necesarias y su informacion
	**/
	private function mostrarhtml($catalogo){
		$vistas;
		$this->Pagina_;
		foreach ($catalogo as $arreglos => $nombres) {
			$vistas[] = $arreglos;
			}
		foreach ($vistas as $nombre) {
			$this->Pagina_ = $this->Pagina_ . $this->load->view($nombre,$catalogo[$nombre],true);
			}
		$this->Pagina_ = $this->Pagina_ . $this->load->view('pie','',true);
		print $this->Pagina_;
		}
}