<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/*****************************************************************************
 * Objeto que los usuarios del sistema
 * @author eduardouio7@gmail.com
 * @version 1.0
 * @copy Mediperbarica 2015
 * 
 * Listado de Metodos creados
 * __construct()
 * getAntecedents([id_antecedente])
 * saveAntecedent(antecendete)
 * deleteAntecedent(id_antecedente)
 * _validData(antecedente)
 *
 * SE CODIFICAN LO ERRORES VER ARCHIVO LISTADO DE ERRORES EN LA RAIZ DEL 
 * PROYECTO
 ****************************************************************************/
class User extends MY_Controller {

	protected $Table_ = 'antecedente';
	protected $CodeHttp_ = 200;
	protected $Result_;
	protected $Query_;

	
	/*************************************************************************
	 *  Funcion Contructora inicializa librerias
	 * @method __construct()
	 * @return (void)
	 ************************************************************************/
	public function __construct(){
		parent::__construct();
		$this->_checkSession();
	}

	
	/**
	 * Funcion de validacion de datos de antecedente
	 * @param (array) antecedente
	 * @return (int) code status
	 */
	public function _validData($antecedente){
		$params = array(
			'id_paciente'=>'9',
			'tipo'=>'4',
			'detalle'=>'4'
			);

		return($this->_validUserData($params,$antecedente,3));

	}
}