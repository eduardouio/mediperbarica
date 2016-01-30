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
	 * Funcion encargada de traer los tratamientos o un tratamiento
	 *@param (int) identificadot de tratamientos
	 *@return (JSON) Envio de respuesta resrvidor
	 */
	public function getTreatments($idTraetment = 0){
        #variable de respuesta 
        $response = array('status' => 'Success');
        #verificamos el parametro antes de armar la consulta
        if($this->uri->segment(3)){
        	$this->Query_ = 'SELECT * from tratamiento 
        					WHERE id_tratamiento = ' . $idTraetment;
        }else{
			$this->Query_ = 'SELECT
					trt.id_tratamiento,
					per.nombres as personal,
					hst.nombres as paciente,
					hst.telefono,
				    trt.nro_sesiones,
						(SELECT count(id_sesion) 
							FROM sesion 
							WHERE id_tratamiento = trt.id_tratamiento) as sesiones_realizadas,
						(SELECT fecha 
							FROM sesion 
				            WHERE id_tratamiento = trt.id_tratamiento 
				            ORDER BY fecha DESC limit 1) as ultima_sesion,
				        trt.costo,
						(SELECT SUM(valor) from cobro where id_factura = 
								(SELECT id_factura 
									from factura 
				                    where id_tratamiento = trt.id_tratamiento )) as pagos
				FROM tratamiento as trt
				LEFT JOIN personal as per USING(id_personal)
				LEFT JOIN historia as hst USING(id_paciente);';
        }
        #ejecutamos la consulta
        $this->Result_ = $this->db->query($this->Query_);
        #comprobamos los resultados
        if($this->Result_->num_rows() > 0){
        	$response['msg'] = '3002';
        	$response['data'] = $this->Result_->result_array();
        }elseif($idTraetment != 0){
        	$response['msg'] = '2001';
        }else{
        	$response['msg'] = '2002';
        }
        #enviamos las respuesta al navegador
        $this->rest->_responseHttp($response,$this->CodeHttp_);
	}

	/**
	 * Guarda y modifica un tratamiento, cuando se modifica un tratamiento
	 * no se permite asignar a otro paciente el mismo tratamiento
	 * para esto se crea una nueva validacion el tratamiento, eliminando el
	 * idde paciente con una parametro opcional
	 * @param (array) tratamiento a crear o modificar
	 * @return (JSON) respuesta del server
	 */
	public function saveTreatment(){
		if($this->rest->_getRequestMethod() != 'POST'){
			$this->_notAuthorized();
		}
		#variable de respuesta
		$response = array('status' => 'Succes');

		$treatment = json_decode(file_get_contents('php://input'),true);
		#true crear false guardar
		if(!$treatment['id_tratamiento']){
			$status = $this->_validData($treatment);
			if($status == 1){
				$this->db->insert($this->Table_, $treatment);
				$response['msg'] = '3000';
				$response['data'] = $this->db->insert_id();
			}else{
				$response['msg'] = $status;
			}
		}else{
			#editar
			$oldTraetment = $treatment;
			#verificamos que existe el tratamiento
			$this->db->where('id_tratamiento', $oldTraetment['id_tratamiento']);
			$this->Result_ = $this->db->get($this->Table_);
			if($this->Result_->num_rows() > 0 ){
				unset($treatment['id_tratamiento']);
				unset($treatment['id_paciente']);
				$status = $this->_validData($treatment,true);
				if($status == 1){
					$this->db->where('id_tratamiento', $oldTraetment['id_tratamiento']);
					$this->db->update($this->Table_, $treatment);
					$response['msg'] = '3001' ;
					$response['data'] = $oldTraetment; 
				}else{
					$response['msg'] = $status;
				}
			}else{
				$response['msg'] = '2001' ;
			}
		}
		#envio de respuesta
		$this->rest->_responseHttp($response, $this->CodeHttp_);
	}

	/**
	 * elimina un tratamiento siempre que no tenga sesiones
	 * @param (int) idetificador del tratamiento
	 * @return (JSON) respuesta del servidor
	 */
	public function deleteTreatment($idTraetment){
		#variable de respuesta
		$response = array('status' => 'Success');
		#comprobamos el parametro para eliminar
		if(isset($idTraetment)){
			$this->db->where('id_tratamiento',$idTraetment);
			$this->Result_ = $this->db->get($this->Table_);
			#comprobamos si existe
			if($this->Result_->num_rows() > 0){
				$treatment = $this->Result_->result_array();
				#consultamos las sesiones
				$this->db->where('id_tratamiento',$idTraetment);
				$this->Result_ = $this->db->get($this->Table_);
				if($this->Result_->num_rows() > 0){
					#error en eliminar
					$response['msg'] = '2004';
					$response['data'] = $this->Result_->result_array();
				}else{
					#eliminamos
					$this->db->where('id_tratamiento',$idTraetment);
					$this->db->delete($this->Table_);
					$response['msg'] = '3003';
					$response['data'] = $treatment;
				}
			}else{
				$response['msg'] = '2001';
			}
		}else{
			$response['msg'] = '4000';
		}

		#envio de respuesta
		$this->rest->_responseHttp($response,$this->CodeHttp_);
	}

	/**
	 * Funcion de validacion de datos de tratamiento
	 * @param (array) tratamiento
	 * @param (boolean) validacion parta editar o crear
	 * @return (int) code status
	 */
	protected function _validData($tratamiento,$edit = false){
		$params = array(
			'id_paciente'=>'9',
			'id_personal'=>'9',
			'motivo_tratamiento'=>'10',
			'nro_sesiones'=>'1',
			'costo'=>'2',
			'descuento'=>'-1',
			'notas'=>'-1'
			);
		if($edit){
			unset($params['id_paciente']);
			return($this->_validUserData($params,$tratamiento,4));
		}

		return($this->_validUserData($params,$tratamiento,5));

	}
}