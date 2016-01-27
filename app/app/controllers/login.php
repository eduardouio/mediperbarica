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
class Login extends MY_Controller {

	protected $Table_ = 'user';
	protected $Controller_ = 'login';
	protected $MySession_ = array();
	protected $CatalogoVistas_;
	protected $Result_;
	public $Pagina_;
	protected $Query_;
	protected $ModuloAngular_ = 'login.js';

	/**
	 * Metodo encargado de iniciar las librerias y el controller
	 * @method __construct
	 * @return (void)
	 */
	function __construct(){
		parent::__construct();
	}

	/*************************************************************************
	* Muestra la pagina de inicio y sus librerias
	* @method index
	* @return void	  
	 ************************************************************************/
	public function index()
	{	
		if($this->session->userdata('logueado')){
			$this->_redirectPage();
		}else{
			$this->CatalogoVistas_['cabecera'] = array();
			$this->CatalogoVistas_['login'] = array();		
			$this->_mostrarHTML($this->CatalogoVistas_,$this->ModuloAngular_);
		}
	}

	/**
	 * Se hace la recepcion de datos
	 */
	public function go(){
		if($this->rest->_getRequestMethod() != 'POST'){
			$this->rest->_responseHttp('Permiso Denegado!','406');
		}

		$user = json_decode(file_get_contents('php://input'),true);
		$respuesta['code'] = $this->_validData($user);
		$this->rest->_responseHttp($respuesta,'200');
		
	}

	/**
	 * Cierra la sesion del usuarios
	 */
	public function logout(){
		$this->session->sess_destroy();
	}

	/**
	 * Se validan los datos recibidos
	 */
	protected function _validData($data){
		//comprobamos que exista el usuario y el password
		$this->db->where('username',$data['username']);
		$this->Result_ = $this->db->get($this->Table_);
		if ($this->Result_->num_rows() == 1){
			$query = $this->Result_->result_array();
			$userData = $query[0];
			//Comprobamos en pasword e iniciamos sesion
			if($userData['password'] == $data['password']){
				unset($userData['password']);
				unset($userData['creado']);
				unset($userData['last_login']);
				$userData['logueado'] = 1;
				//escribimos la base de datos el ultimo logueo
				$this->db->where('username',$data['username']);
				$misession = array(
					'last_login' => $this->session->userdata('last_activity'));
				$query = $this->db->update($this->Table_,$misession);
				//colocamos los datos de sesion en la cookie
				$this->session->set_userdata($userData);
				return 3000;
			}else{
				//erro de contrasenia
				$data = array(
					'logueado' => 0
					);
				$this->session->set_userdata();
				return 3002;
			}
		}else{
			return 3002;
		}
	}

	//Redirecciona a la pagina principal del sitio
	protected function _redirectPage(){
		header('Status: 301 Moved Permanently', false, 301);
		header('Location: '. base_url() . 'index.php/inicio');
	}

}