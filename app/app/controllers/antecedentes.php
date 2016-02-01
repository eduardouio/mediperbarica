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
	 * Obtiene un listado de antecedentes o antecedente
	 * @param [(int)] id_antecedente opcional
	 * @return (JSON) respuesta
	 */
	public function getAntecedents($idHistory){
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
		if(!$antecedent['id_antecedente']){
			#validamos he insertamos el antecedente en la base de datos
			$status = $this->_validData($antecedente);
			if($status == 1){
				$this->db->insert($this->Table_, $antecedente);
				$response['msg'] = '3000';
				$response['data'] = $this->db->insert_id();
			}else{
				$response['msg'] = $status;
			}
			#modificacion de antecedente
		}else{
			$oldAntecedent = $antecedent;
			unset($oldAntecedent['id_antecedente']);
			unset($oldAntecedent['creado']);
			$status = $this->_validData($oldAntecedent);
			if($status == 1){
				#actualiza,os antecedente
				$this->db->where('id_paciente',$oldAntecedent['id_paciente']);
				$this->db->update($this->Table_,$oldAntecedent);
				$response['msg'] = '3001';
				$response['data'] = $oldAntecedent;
			}else{
				$response['msg'] = $status;
			}
		}
		#enviamos la respuesta
		$this->rest->_responseHttp($response,$this->CodeHttp_);
	}

	/**
	 * Funcion encargada de eliminar un antecedente, solo se pueden 
	 * eliminar los antecedentes hasta 120 segundos despues de insertarlos
	 * @param (int) id_antecedente para eliminar
	 * @return (JSON) respuesta
	 */
	public function deleteAntecedent($idAntecedent){
		#variables de respuesta
		$response = array('status'=>'Success');
		$time = date("Y-m-d h:i:s");		
		if(isset($idAntecedent)){
			$this->db->where('id_antecedente',$idAntecedent);
			$this->Result_ = $this->db->get($this->Table_);
			#recuperamos el antecdente si existe se borra sino error
			if($this->Result_->num_rows() > 0){
				$antecedent = $this->Result_->result_array();
				#validamos el tiempo para eliminar antecedentes
				$timeA = strtotime($time);
				$timeB = strtotime($antecedent[0]['creado']);
				#Valor en segundos
				$interval = ($timeA - $timeB);
				if($interval < 43200 ){
					$this->db->where('id_antecedente',$idAntecedent);
					$this->db->delete($this->Table_);
					$response['msg'] = '3003';					
				}else{
					#tiempo exedido se mustran los segundos
					$response['msg'] = '2007';
					$response['data'] = $interval;
				}
			}else{
				$response['msg'] = '2001';
			}			
		}else{
			#falta parametro id antecedent
			$response['msg'] = '4000';
		}

		#enviar los datos
		$this->rest->_responseHttp($response,200);

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
