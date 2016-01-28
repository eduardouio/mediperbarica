<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/*****************************************************************************
 * Objeto que manejoa los antecedentes de las historias
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
class Antecedentes extends MY_Controller {

	protected $Table_ = 'historia';
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
	 * Obtiene un listado de antecedentes o antecedente
	 * @param [(int)] id_antecedente opcional
	 * @return (JSON) respuesta
	 */
	public function getMedicalAntecedents($idHistory){
		#variable de respuesta
		$response = array('status' => 'Success' );
		if(isset($idHistory)){
			#se consulan los antecedentes de una historia
			$this->Query_ = 'SELECT * FROM antecedente WHERE id_paciente = ' . $idHistory . ';';		
			$this->Result_ = $this->db->query($this->Query_);
			#validacion de resultados
			if($this->Result_->num_rows() > 0){
				$response['msg'] = '3002';
				$response['data'] = $this->Result_->result_array();
			}else{
				$response['msg'] = '2002';
			}
			
		}else{
			$response['msg'] = 4000;
		}

		#enviamos las respuesta
		$this->rest->_responseHttp($response,$this->CodeHttp_);
	}

	/**
	 * Guarda y actualiza un antecedente (el actualizado tiene id_antecedente)
	 * @param antecendete
	 * @return JSON estado de la peticion 200 y 201
	 */
	public function saveAntecedent(){
		#validamos el acceso a la funcion
		if($this->rest->_getRequestMethod() != 'POST'){
			$this->_notAuthorized();
		}

		#variable de respuesta
		$response = array('status' => 'Success');

		$antecedent = json_decode(file_get_contents("php://input"),true);
		#falso editamos verdadero creamos
		hay que eliminar el id_antecedente antes de mandar a validar
		if(!$antecedent['id_antecedente']){
			$status = $this->_validData($antecedente)

		}else{

		}



		#enviamos la respuesta
		$this->rest->_responseHttp($response,$this->CodeHttp_);
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

	};
}