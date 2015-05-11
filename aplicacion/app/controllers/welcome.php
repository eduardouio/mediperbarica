<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Welcome extends CI_Controller {

	protected $Table_ = 'historia';
	protected $Controller_ = 'welcome';
	protected $Result_;
	protected $CatalogoVistas_;
	protected $Pagina_;
	protected $Query_;
	private $CodeHTTP = 200;
	private $ContentType = 'application/json';

	public function index()
	{

		$this->CatalogoVistas_['cabecera'] = array();
		#$this->CatalogoVistas_['sidebar'] = array('title' => 'inicio');
		$this->CatalogoVistas_['menu'] = array('inicio' => 'active');
		#$this->CatalogoVistas_['alertas'] = array();
		$this->CatalogoVistas_['admin_home'] = array('historias' => $this->countHistorias());		
		$this->_mostrarhtml($this->CatalogoVistas_);
	}

	
	/**
	 * Retorna en numero de historias registradas en el sistema
	 */
	private function countHistorias(){
		$query = $this->db->get('historia');
		return $query->num_rows();
	}

	/**
	* Se encrarga de recibir la informacion y genera la pantalla de salia
	* Todos los valores se guardan en una variable de clase $Pagina_
	* Es este metodo el que decide que vistas mostrar a partir de los paramtros recibidos
	*
	* @param array $catalogo array con las plantillas necesarias y su informacion
	**/
	private function _mostrarhtml($catalogo){
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