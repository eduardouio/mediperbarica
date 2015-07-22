<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Inicio extends MY_Controller {

	protected $Table_ = 'historia';
	protected $Controller_ = 'welcome';
	protected $Result_;
	protected $CatalogoVistas_;
	protected $Pagina_;
	protected $Query_;
	private $CodeHTTP = 200;
	private $ContentType = 'application/json';

		/*************************************************************************
	 *  Funcion Contructora inicializa librerias
	 * @method __construct()
	 * @return (void)
	 ************************************************************************/
	public function __construct(){
		parent::__construct();
		$this->_checkSesion($this->session->all_userdata());
		$this->load->library('form_validation');
	}

	public function index()
	{

		$this->CatalogoVistas_['cabecera'] = array();
		#$this->CatalogoVistas_['sidebar'] = array('title' => 'inicio');
		$this->CatalogoVistas_['menu'] = array('inicio' => 'active');
		#$this->CatalogoVistas_['alertas'] = array();
		$this->CatalogoVistas_['admin_home'] = array('historias' => $this->countHistorias());		
		$this->_mostrarhtml($this->CatalogoVistas_,'historias.js');
	}

	
	/**
	 * Retorna en numero de historias registradas en el sistema
	 */
	private function countHistorias(){
		$query = $this->db->get('historia');
		return $query->num_rows();
	}
}