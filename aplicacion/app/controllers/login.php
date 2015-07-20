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
	}

	/*************************************************************************
	* Muestra la pagina de inicio y sus librerias
	* @method index
	* @return void	  
	 ************************************************************************/
	public function index()
	{	
		//comprobamos que no existe la sesion sino llamamos al form
		print(var_dump($this->session->userdata()));
		print(var_dump($this->session->userdata('logueado')));
		if($this->session->userdata('logueado') == 1){
			$this->_redirectPage();
		}else{
			$this->CatalogoVistas_['cabecera'] = array();
			$this->CatalogoVistas_['login'] = array();		
			$this->_mostrarHTML($this->CatalogoVistas_);
		}
	}

	//Se verifican los datos y se inicia sesion
	public function go(){
			if($_POST){
				if($this->input->post('username') != '' || $this->input->post('password') != ''){
					$this->MySession_['username'] = $this->input->post('username');
					$this->MySession_['password'] = $this->input->post('password');
					$this->_validData($this->MySession_);
				}else{
					//unno de los campos en blanco
					$this->_showError(1000);
				}
			}else{
				//no entra por post se muestra en form
				$this->index();
			}
	}

	// valida el usuario y contrasenia
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
				$this->_redirectPage();
			}else{
				//erro de contrasenia
				$data = array(
					'logueado' => 0
					);
				$this->session->set_userdata();
				$this->_showError(3000);	
			}
		}else{
			//no existe el usuario
			$this->_showError(2000);
		}
	}	

	//Muestra un error durante el inicio de sesion
	protected function _showError($codigo){
		print('Estamos en problemas ' + $codigo);
	}

	//Redirecciona a la pagina principal del sitio
	protected function _redirectPage(){
		header('Status: 301 Moved Permanently', false, 301);
		header('Location: http://127.0.0.1/aplicacion/index.php/inicio');
	}

}