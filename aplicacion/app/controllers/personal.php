<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
	

/**
* Clase encargada de administrar a al personal
*/
class Personal extends CI_Controller {

	var $Data_;
	var $Table_ = 'personal';

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

	
	function registrar(){
		$postdata = file_get_contents("php://input");
		$this->Data_ = json_decode($postdata);
		$this->db->insert($this->Table_,$this->Data_);
		print($this->db->last_query());
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