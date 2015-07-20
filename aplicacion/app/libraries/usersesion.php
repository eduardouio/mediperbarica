<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

/**
* 
*/
class Usersesion{
	//Muestra el estado de la sesion en pantalla
	public function _showSession(){
		$data_user = array(
			'usuario' => 'Eduardo',
			'logueado' => True);
		$this->session->set_userdata($data_user);
		print (var_dump($this->session->userdata));
	}

	//Inicia una nueva sesion
	// return array
	public function _startSession($data){

	}

	//cierra la sesion de un usuario
	// return boolean
	public function _closeSession($user){

	}

	//chequea el estado de una sesion
	// return boolean
	public function _checkSesion($sessioID){

	}
}
