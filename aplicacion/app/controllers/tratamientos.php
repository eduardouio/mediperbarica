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
	protected $ModuloAngular_ = 'tratamientos.js';

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
		$this->_mostrarHTML($this->CatalogoVistas_, $this->ModuloAngular_);
	}

	/**
	 * Obtiene una lista o un tratamiento
	 * @param (int) id_tratamoiento
	 * @return (array)
	 */
	public function getTreatments($id_tratamiento = 0){
		$this->Query_ = 'SELECT trt.id_tratamiento, trt.id_paciente, 
							hist.nombres , hist.telefono ,trt.id_personal, 
							pers.nombres AS medico, trt.motivo_tratamiento, 
							trt.nro_sesiones,
							(SELECT COUNT(*) FROM sesion AS ses WHERE 
								trt.id_tratamiento = ses.id_tratamiento) 
							AS sesiones,
							(trt.nro_sesiones) AS pendientes, trt.creado
							FROM tratamiento AS trt
							JOIN personal AS pers using(id_personal)
							JOIN historia AS hist using(id_paciente)
							';
		//Validamos la consulta para un tratamiento
		if($id_tratamiento != 0){	
		$this->Query_ = $this->Query_ . ' WHERE trt.id_tratamiento = ' . 
														$id_tratamiento ;
		}
		//ejecuta la consulta
		$this->Query_ = $this->Query_ . ' ORDER BY trt.id_tratamiento DESC' . ';'; 
		$this->Result_ = $this->db->query($this->Query_);
		$this->checkData($this->Result_);
		
	}

	/**
	 * Funcion encagada de comprobar que el arreglo tenga datos
	 * @param (array) drespuesta SQL
	 * @return (JSON) responde con data
	 */
	private function checkData($resource){
		//variable de respuesta
		$response = array(
						'status' => 'Success');
		//enviamos una respuesta dependiendo de la coneccion
		if($resource->num_rows() > 0){
			$response['msg'] = '1005';
			$response['data'] = $this->Result_->result_array();
		}else{
			$response['msg'] = '1007';
		}
		//enviamos respuesta
		$this->rest->_responseHttp($response,200);
	}
}