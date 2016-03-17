<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/*****************************************************************************
 * Objeto que manejoa las sesiones de los tratamientos
 * @author eduardouio7@gmail.com
 * @version 1.0
 * @copy Mediperbarica 2015
 * 
 * Listado de Metodos creados
 * __construct()
 * getSessions(idAntecedent)
 * saveSession(idAntecedent)
 * deleteSession(idAntecedet)
 * _validData(session)
 *
 * SE CODIFICAN LO ERRORES VER ARCHIVO LISTADO DE ERRORES EN LA RAIZ DEL 
 * PROYECTO
 ****************************************************************************/
class Sesiones extends MY_Controller {

	protected $Table_ = 'sesion';
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
	 * Lista las sesiones de un tratamiento o todas
	 * @param (int) idTreatment
	 * @return (array) Response
	 */
	public function getSessions($idTreatment){
		# variable de respuesta
		$response = array('status' => 'Succes');		
		if(isset($idTreatment)){
			$this->Query_ = 'SELECT ses.*, per.nombres, equi.nombre
							FROM sesion as ses
							LEFT JOIN personal AS per USING(id_personal) 
							LEFT JOIN equipo AS equi USING(id_equipo) 
							WHERE id_tratamiento = ' . $idTreatment;
			
			$this->Result_ = $this->db->query($this->Query_);

			if($this->Result_->num_rows() > 0){
				$response['msg'] = '3002';
				$response['data'] = $this->Result_->result_array();
			}else{
				$response['msg'] = '2002';
			}
		}else{
			$response['msg'] = '4000';
		}
		#enviamos la respuesta
		$this->rest->_responseHttp($response,$this->CodeHttp_);
	}


	/**
	 * Guarda o etida una sesion
	 * @param (array) sesion
	 * @return (JSON) datos de respuesta
	 */
	public function saveSession(){
		if($this->rest->_getRequestMethod() != 'POST'){
			$this->_notAuthorized();
		}
		$response = array('status' => 'Success');
		#recuperamos los datos de sesion enviados por el user
		$session = json_decode(file_get_contents('php://input'),true);
		#true crear false editar
		if(!$session['id_sesion']){
			$status = $this->_validData($session);
			if($status == 1){
				$this->db->insert($this->Table_, $session);
				$response['msg'] = '3000';
				$response['data'] = $this->db->insert_id(); 
			}else{
				$response['msg'] = $status;
			}
		}else{
			#verificamos que exista la sesion
			$this->db->where('id_sesion',$session['id_sesion']);
			$this->Result_ = $this->db->get($this->Table_);
			if($Result_->num_rows() > 0){
				unset($session['id_sesion']);
				$status = $this->_validData($session);
				if($status == 1){
					$this->db->where('id_sesion',$session['id_sesion']);
					$this->db->update($this->Table_, $session);
					$response['msg'] = '3001';
					$response['data'] = $session;
				}else{
					$response['msg'] = $status;
				}
			}else{
				#no existe
				$response['msg'] = '2001';
			}
		}

		#enviamos la respuesta
		$this->rest->_responseHttp($response,$this->CodeHttp_);
	}

	/**
	 * Elimina una sesion del mismo dia
	 *@param (int) identificador de sesion
	 *@return (JSON) respuesta server
	 */
	public function deleteSession($idSession){
		$response = array('status' => 'Success');
		if(isset($idSession)){
			$this->db->where('id_sesion',$idSession);
			$this->Result_ = $this->db->get($this->Table_);
			if($this->Result_->num_rows() > 0){
				$this->db->where('id_sesion',$idSession);
				$this->db->delete($this->Table_);
				$response['msg'] = '3003';
				$response['data'] = $this->Result_->result_array();
			}else{
				$response['msg'] = '2001';
			}
		}else{
			$response['msg'] = '4000';
		}
		#enviamos los resultados
		$this->rest->_responseHttp($response,$this->CodeHttp_);
	}

	/**
	 * Funcion de validacion de datos de sesion
	 * @param (array) sesion
	 * @return (int) code status
	 */
	protected function _validData($sesion){
		$params = array(
			'id_personal'=>'9',
			'id_tratamiento'=>'0',
			'id_equipo'=>'3',
			'fecha'=>'10',
			'notas'=>'-1'
			);

		return($this->_validUserData($params,$sesion,4));

	}
}