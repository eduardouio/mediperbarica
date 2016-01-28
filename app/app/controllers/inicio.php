<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Inicio extends MY_Controller {

	protected $Table_ = 'historia';
	protected $CatalogoVistas_;
	public $Pagina_;
	private $CodeHTTP = 200;
	private $ContentType = 'application/json';

		/*************************************************************************
	 *  Funcion Contructora inicializa librerias
	 * @method __construct()
	 * @return (void)
	 ************************************************************************/
	public function __construct(){
		parent::__construct();
		$this->_checkSession($this->session->all_userdata());
		$this->load->library('form_validation');
	}

	public function index()
	{

		$this->CatalogoVistas_['cabecera'] = array();
		$this->CatalogoVistas_['menu'] = array();
		$this->CatalogoVistas_['contenidos'] = array();
		$this->_mostrarhtml($this->CatalogoVistas_);
	}

	
}