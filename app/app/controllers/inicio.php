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
		$this->CatalogoVistas_['menu'] = array();
		$this->CatalogoVistas_['contenidos'] = array();
		$this->_mostrarhtml($this->CatalogoVistas_,'historias.js');
	}

	
}