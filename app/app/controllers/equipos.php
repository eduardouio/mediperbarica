<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/*****************************************************************************
 * Objeto que maneja los equipos
 * @author eduardouio7@gmail.com
 * @version 1.0
 * @copy Mediperbarica 2015
 * 
 * Listado de Metodos creados
 * __construct()
 * getMachines([idMAchine])
 * saveMachine(Machine)
 * deleteMachine(idMachine)
 * _validData(Machine)
 *
 * SE CODIFICAN LO ERRORES VER ARCHIVO LISTADO DE ERRORES EN LA RAIZ DEL 
 * PROYECTO
 ****************************************************************************/
class Equipos extends MY_Controller {

	protected $Table_ = 'equipo';
	protected $CodeHttp_ = 200;
	protected $Result_;
	protected $Query_;

	/**
	 * Funcion constructora inicializa librerias y comprueba sesion
	 * @return (void)
	 */
	public function __construct(){
		parent::__construct();
		$this->_checkSession();
	}


	/**
	 * Metodo encargado de listar los equipos
	 * @param [($idMachine)] identificador maquina
	 * @return (JSON) resutaldos
	 *
	 */
	public function getMachines($idMachine = 0){
		#variable de respuesta
		$response = array('status' => 'Success');
		$this->Query_ = 'SELECT eqp.id_equipo,
						eqp.nombre,
						eqp.marca,
						eqp.modelo,
						(SELECT count(id_sesion) 
							FROM sesion 
							WHERE id_equipo = eqp.id_equipo) as sesiones,
	    				eqp.notas
						FROM equipo as eqp ';
		#confirmamos Idde equipoa
		if($this->uri->segment(3)){
			$this->Query_ = $this->Query_ . 'WHERE id_equipo = ' . $idMachine ;
		}

		#ejecutamos la consulta
		$this->Result_ = $this->db->query($this->Query_);
		if($this->Result_->num_rows() > 0){
			$response['msg'] = '3002';
			$response['data'] = $this->Result_->result_array();
		}elseif($idMachine){
			$response['msg'] = '2001';
		}else{
			$response['msg'] = '2002';
		}
		#enviamos respuesta
		$this->rest->_responseHttp($response,$this->CodeHttp_);

	}	

	/**
	 * Guarda un equipo
	 * @param (array) equipo a guardar
	 * @return (array) estado de la respuesta
	 */
	public function saveMachine(){
		if($this->rest->_getRequestMethod() != 'POST'){
			$this->_notAuthorized();
		}
		#variable de respuesta
		$response = array('status' => 'Success');
		$machine = json_decode(file_get_contents('php://input'),true);

		#true crear false actualizar
		if(!$machine['id_equipo']){
			$status = $this->_validData($machine);
			if($status == 1){
				$this->db->insert($this->Table_,$machine);
				$response['msg'] = '3000';
				$response['data'] = $this->db->insert_id();
			}else{
				$response['msg'] = $status;
			}
		}else{
			#actualiza comprobamos que exista el equipo
			$this->db->where('id_equipo',$machine['id_equipo']);
			$this->Result_ = $this->db->get($this->Table_);
			if($this->Result_->num_rows() > 0){
7777777777777
				unset()
				$status = $this->_validData($machine);
				$this->db->where('id_equipo',$machine['id_equipo']);
			}else{
				$response['msg'] = '2001';
			}

		}

		#enviamos respuestas
		$this->rest->_responseHttp($response, $this->CodeHttp_);

	}

	/**
	 * Elimina un equipo
	 *  @param idMachine equipo a eliminar
	 *  @return (JSON) resultado del proceso
	 */
	public function deleteMachine($idMachine){
		#variable de respuesta
		$response = array('status' => 'Success');
		#verifca parametro
		if(isset($idMachine)){
			#Comprobamos que exista el equipo
			$this->db->where('id_equipo',$idMachine);
			$this->Result_ = $this->db->get($this->Table_);
			if($this->Result_->num_rows() > 0 ){
				$machine = $this->Result_->result_array();
				#verficicar que el equipo no tenga sesiones antes de borrar
				$this->db->where('id_equipo',$idMachine);
				$this->Result_ = $this->db->get('sesion');	
				if($this->Result_->num_rows > 0){
					$response['msg'] =  '2004';
					$response['data'] = $this->Result_->result_array();
				}else{
					$this->db->where('id_equipo',$idMachine);
					$this->db->delete($this->Table_);
					$response['msg'] = '3003' ;
					$response['data'] =  $machine;
				}

			}else{
				$response['msg'] = '2001';
			}

		}else{
			$response['msg'] = '4000';
		}
		#enviamos respuestas
		$this->rest->_responseHttp($response, $this->CodeHttp_);

	}


	/**
	 * Valida los datos de la maquina
	 * @param (array) datos de la maquinba
	 * @return (int) codigo de validacion
	 */
	protected function _validData($machine){
		$params = array(
			'nombre'=>'5',
			'nro_serie'=>'4',
			'marca'=>'4',
			'modelo'=>'-1',
			'notas' => '-1',);
		return $this->_validUserData($params,$machine,1);
	}
	
}