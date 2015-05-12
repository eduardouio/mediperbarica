<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/*****************************************************************************
 * Objeto que manejoa los antecedentes de las historias
 * @author eduardouio7@gmail.com
 * @version 1.0
 * @copy Mediperbarica 2015
 * 
 * Listado de Metodos creados
 * __construct()
 * getAntecedentes()
 * getAntecedente()
 * setAntecedente()
 * updateAntecedente()
 * _checkDataAntecedente()
 *
 * SE CODIFICAN LO ERRORES VER ARCHIVO LISTADO DE ERRORES EN LA RAIZ DEL 
 * PROYECTO
 ****************************************************************************/
class Antecedentes extends CI_Controller {

	protected $Table_ = 'historia';
	protected $Controller_ = 'historias';
	protected $Result_;
	protected $Query_;

	
	/*************************************************************************
	 *  Funcion Contructora inicializa librerias
	 * @method __construct()
	 * @return (void)
	 ************************************************************************/
	public function __construct(){
		parent::__construct();
		$this->load->library('form_validation');
		$this->load->library('rest');
	}


	 /************************************************************************
	 * Obtiene un listado de antecedentes de una historia
	 * @method getAntecedentes
	 * @param (int) identificador del antecedente a obtener
	 * @return (JSON) Objeto JS con el listado de antecedentes o vacio
	 ************************************************************************/
	public function getAntecedentes($pacienteId = 0){
		//Se verifica la lonjutus del id paciente
		if (strlen($pacienteId) > 9){
			$this->db->where('id_paciente',$pacienteId);
			$this->Result_ = $this->db->get('antecedente');			
			$response = array('status'=>'Ok',
							  	'msg'=>'2005',
								'data' => $this->Result_->result_array());
			$this->rest->_resposeHttp(json_encode($response), 200);
		} else{
			$response = array('status'=>'Ok',
							  	'msg'=>'2001',
								'data' => $this->Result_->result_array());
			$this->rest->_resposeHttp(json_encode($response), 200);
		}			
	}


	 /************************************************************************
	 * Retorna un antecedente completo al navegador
	 * @method getAntecedente
	 * @param (int) identificador del antecedente
	 * @return (JSON) Objeto JS con un antecedente o vacio
	 ************************************************************************/
	public function getAntecedente($antecedenteId = 0){
		//Se comprueba el antecedenteId
		if (strlen($antecedenteId) > 0){
			$this->db->where('id_antecedente',$antecedenteId);
			$this->Result_ = $this->db->get('antecedente');			
			$response = array('status'=>'Ok',
							  	'msg'=>'2005',
								'data' => $this->Result_->result_array());
			$this->rest->_resposeHttp(json_encode($response), 200);
		} else{
			$response = array('status'=>'Ok',
							  	'msg'=>'2004',
								'data' => $this->Result_->$antecedenteId);
			$this->rest->_resposeHttp(json_encode($response), 200);
		}			
	}


	/*************************************************************************
	 * Crea un antecedente
	 * @method setAntecedente
	 * @param (array) arreglo con los datos para crear un nuevo antecedente
	 * @return (JSON) Estado de la peticion http 200 y 201
	 ************************************************************************/
	public function setAntecedente(){
		if( $this->rest->_getRequestMethod() != "POST"){
			$this->rest->_resposeHttp('','406');
		}

		$antecedente = json_decode(file_get_contents("php://input"),true);
		# comprobamos que esten todos los campos
		$validar = $this->_checkDataAntecedente($antecedente,true);
		if ($validar){
			#comprobamos que el id del Registro no exista
			$this->db->where('tipo', $antecedente['tipo']);
			$query = $this->db->get('antecedente');
			$result = ($query->num_rows() > 0 ) ? true : false;
			if(!$result){
				$this->db->insert('antecedente',$antecedente);
				$this->db->where('id_antecedente',$this->db->insert_id());
				$newAntecedente = $this->db->get('antecedente');
				$newAntecedenteArray = $newAntecedente->result_array();
				$this->db->where('id_paciente',
									$newAntecedenteArray[0]['id_paciente']);
				$historia = $this->db->get($this->Table_);
				$historiaID = $historia->result_array();

				$response = array('status'=>'Success',
								'id_historia' => $historiaID[0]['id_historia'],
								'msg'=> '2002',
								'data' => $antecedente);
				$this->rest->_resposeHttp(json_encode($response), 201);	
			}else{
				$antecedente_old = $query->result_array();
				$this->db->where($antecedente_old[0]['id_paciente']);
				$historia = $this->db->get($this->Table_);
				$historiaID = $historia->result_array();

				$response = array('status'=>'Ok',
								'id_historia' => $historiaID[0]['id_historia'],
							  	'msg'=>'2000',
								'data' => $query->result_array());
				$this->rest->_resposeHttp(json_encode($response), 200);	
			}

		} else{
			$response = array('status'=>'Ok',
							  'msg'=>'2001'
								);
			$this->rest->_resposeHttp(json_encode($response), 200);
		}
	}

	/*************************************************************************
	 * Actualizar un antecedente
	 * @method updateAntecedente
	 * @param (array) arreglo que contiene los nuevos datos y el old_id
	 * @return (JSON) Estado de la peticion http 200 y 201
	 ************************************************************************/
	public function updateAntecedente(){
		if( $this->rest->_getRequestMethod() != "POST"){
			$this->rest->_resposeHttp('','406');
		}

		$antecedente = json_decode(file_get_contents("php://input"),true);
		# comprobamos que esten todos los campos
		$validate = $antecedente;
		unset($validate['id_paciente']);
		unset($validate['creado']);
		$validar = $this->_checkDataAntecedente($validate,false);
		if ($validar){
			$this->db->where('id_paciente',$antecedente['id_paciente']);
			$this->db->limit(1);
			$query = $this->db->get($this->Table_);
			$historia = $query->result_array();

			#se actualiza el antecedete
			$this->db->where('id_antecedente',$antecedente['id_antecedente']);
			$this->db->update('antecedente',$validate);
			$response = array('status'=>'Success',
								'id_historia' => $historia[0]['id_historia'],
								'msg'=> '2003',
								'data' => $antecedente);
			$this->rest->_resposeHttp(json_encode($response), 201);	
		} else{
			$response = array('status'=>'Ok',
							  'msg'=>'2001');
			$this->rest->_resposeHttp(json_encode($response), 200);
		}

	}

	/*************************************************************************
	 * Valida los datos de un antecedente
	 * @method (_checkDataAntecedente)
	 * @param (array) objeto con los datos del antecedente
	 * @param (boolean) indica si se crea o se edita un antecedente
	 * @return boolean
	 ************************************************************************/
	private function _checkDataAntecedente($antecedente,$opcion){
		//print('objeto recibido en validacion');
		//print(var_dump($antecedente));
		$condicion = false;
		$i = 0;
		$longitudes_minimas = array();
		if($opcion){
		$longitudes_minimas = array(
						'tipo'=>'4',
						'detalle'=>'6',
						'id_paciente'=>'9');
		}else{
			$longitudes_minimas = array(
						'tipo'=>'4',
						'detalle'=>'6',
						'id_antecedente'=>'0');
		}

		if((count($antecedente)) > 0) {
			foreach ($antecedente as $key => $value) {
				$i++;
				if(($longitudes_minimas[$key]) < (strlen($value))){
					$condicion = true;
				}else{
					$condicion = false;
					break;
				}
			}
			#comprobamos que al menos nos deb los 3 primeros campos
			if ($i > 2){
				return $condicion;			
			}else{
				return false;
			}
		}

	}

}