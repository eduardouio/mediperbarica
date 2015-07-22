<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/*****************************************************************************
 * Controlador encargado de manejar los tratamientos
 *  
 * @author eduardouio7@gmail.com
 * @version 1.0
 * @copy Mediperbarica 2015
 * 
 * listarTratamientos()
 * setTratamiento()
 * getTRatamiento()
 * updateTratamiento()
 * 
 ****************************************************************************/
class Tratamientos extends MY_Controller {

	protected $Table_ = 'tratamiento';
	protected $Controller_ = 'tratamientos';
	protected $Result_;
	protected $CatalogoVistas_;
	protected $Pagina_;
	protected $Query_;
	protected $ModuloAngular_ = array('modulo' => 'tratamientos.js' );

	/**
	 * Metodo encargado de iniciar las librerias y el controller
	 * @method __construct
	 * @return (void)
	 */
	function __construct(){
		parent::__construct();
		$this->load->library('rest');
		$this->_checkSesion($this->session->all_userdata());
	}

	/*************************************************************************
	* Muestra la pagina de inicio y sus librerias
	* @method index
	* @return void	  
	 ************************************************************************/
	public function index()
	{	
		$this->CatalogoVistas_['cabecera'] = array();
		$this->CatalogoVistas_['sidebar'] = array('title' => 'Tratamientos');
		$this->CatalogoVistas_['menu'] = array('tratamientos' => 'active');
		$this->CatalogoVistas_['contenidos'] = array();		
		$this->_mostrarHTML($this->CatalogoVistas_);
	}

	

}