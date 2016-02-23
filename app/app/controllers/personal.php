<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Personal extends My_Controller {
	/**
	 * Controlador encargado de proveer JSON API para personal
	 * @author eduardouio7@gmail.com
 	 * @version 1.0
 	 * @copy Mediperbarica 2015
	 *
	 *
	 * Propiedades Globales de la Clase
	 * (str)$Table_ => registra el nombre de la tabla en la base de datos
	 * (array)$Result_ => Guarda las respuestas de la base de datos
	 * (array)$CatalogoVistas_ relaciona las vista scon los contenidos
	 * (array) $Query_ => Texto de las consultas SQL a la BD
	 * 
	 * ERRORES CODIFICADOS VER DOCUMENTACION
	 */

	protected $Table_ = 'personal';
	protected $Result_;
	protected $CatalogoVistas_;
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
	 * Obtiene un listado de los empleados o empleado
	 * @param [(str)] identidicador Empleado
	 * @return (JSON) listado empleados
	 */
	public function getEmployees($idEmployee = 0){
		#variable de respuesta
		$response = array('status' => 'Success');

		#confirmamos el idEmployee si registro unico no listado
		if(!$this->uri->segment(3)){
			$this->Query_ = 'SELECT 
				per.id_personal,
				per.nombres,
				per.cargo,
			    per.celular,
			    per.telefono_fijo,
			    per.mail,
			    per.creado,
			    per.direccion,
			    per.notas,
			    (SELECT count(id_sesion) FROM sesion WHERE id_personal = per.id_personal) as tratamientos,
			    (SELECT count(id_tratamiento) FROM tratamiento WHERE id_personal = per.id_personal) as sesiones
			FROM personal as per;';
		}else{
			$this->Query_ = 'SELECT 
				per.id_personal,
				per.nombres,
				per.cargo,
			    per.celular,
			    per.mail,
			    per.creado,
			    per.direccion,
			    per.notas,
			    (SELECT count(id_sesion) FROM sesion WHERE id_personal = per.id_personal) as tratamientos,
			    (SELECT count(id_tratamiento) FROM tratamiento WHERE id_personal = per.id_personal) as sesiones
			FROM personal as per WHERE per.id_personal = ' . $idEmployee . ';';
		}

		#ejecutamos la consulta
		$this->Result_ = $this->db->query($this->Query_);
		#comprobamos errores en la consulta 
		if($this->Result_->num_rows() > 0){
			$response['msg'] = '3002';
			$response['data'] = $this->Result_->result_array();
		}elseif($idEmployee){
			$response['msg'] = '2001';
		}else{
			$response['msg'] = '2002';
		}

		#enviamos la respuesta
		$this->rest->_responseHttp($response,200);

	}

	/**
	 * Guarda un empleado para actualizar el arreglo de empleado tiene un campo
	 * adicional para saber update = true
	 * @param (array) employed
	 * @return (array) status
	 */
	public function saveEmployee(){
		#comprobamos que solo llegen por POST
		if($this->rest->_getRequestMethod() != 'POST'){
			$this->_notAuthorized();
		}

		#variable de respuesta
		$response = array('status' => 'Success' );
		#recuperamos los datos del enpleado
		$employee = json_decode(file_get_contents("php://input"),true);
		
		#true crear false actualizar
		if(!$employee['update']){
			#comprobamos que no exista
			$this->db->where('id_personal',$employee['id_personal']);
			$this->Result_ = $this->db->get($this->Table_);
			if($this->Result_->num_rows() > 0){
				$response['msg'] = '1000';
				$response['data'] = $this->Result_->result_array();
			}elseif($this->_validData($employee) == 1){
				#insertamos el registro
				$this->db->insert($this->Table_,$employee);
				$response['msg'] = '3000';
				$response['data'] = $this->db->insert_id();
			}else{
				$response['msg'] = $this->_validData($employee);
			}	
		}else{
			#comprobamos las longitudes
			$status = $this->_validData($employee);
			#actualizar primero validamos
			if($status == 1){
				$this->db->where('id_personal',$employee['id_personal']);
				$this->db->update($this->Table_, $employee);
				$response['msg'] = '3001';
				$response['data'] = $employee; 
			}else{
				$response['msg'] = $status;
			}

		}
		#presentamos los resultados
		$this->_responseHttp($response,200);
	}

	/**
	 * Elimina un empleado sin registros dependientes
	 * @param (str) id_empleado
	 * @return (JSON) resultados
	 */
	public function deleteEmployee($idEmployee){
		#variable para resultados
		$response = array('status' => 'Success');
		$data = array();
		#validamos los parametros
		if(!isset($idEmployee)){
			$response['msg'] = '4000';
		}else{
			#comprobamos que exista el registro
			$this->db->where('id_personal',$idEmployee);
			$this->Result_ = $this->db->get($this->Table_);
			if($this->Result_->num_rows() > 0){
				#verifica que no tenga sesiones
				$this->db->where('id_personal',$idEmployee);
				$this->Result_ = $this->db->get('sesion');
				$session = $this->Result_->num_rows();
				$data['sessions'] = $this->Result_->result_array();
				
				#verifica que no tenga tratamientos
				$this->db->where('id_personal',$idEmployee);
				$this->Result_ = $this->db->get('tratamiento');
				$treatments = $this->Result_->num_rows();
				$data['treatments'] = $this->Result_->result_array();

				if($session > 0 || $treatments > 0){
					$response['msg'] = '2004';
					$response['data'] = $data;
				}else{
					$this->db->where('id_personal',$idEmployee);
					$this->db->delete($this->Table_);
					$response['msg'] = '3003';
				}
			}else{
				$response['msg'] = '2001';
			}		
		}

		#mostramos los resultados
		$this->rest->_responseHttp($response,200);
	}

	/**
	 * Valida los datos del empleado
	 * @param (array) employee
	 * @return (int) codigo de estado 
	 */
	private function _validData($employee){
		$params = array(
			'id_personal' => 9,
			'nombres' => 4,
			'cargo' => 4,
			'direccion' => 5,
			'telefono_fijo' => -1,
			'celular' => -1,
			'mail' => -1,
			'notas' => -1,
			);

		return $this->_validUserData($params,$employee,4);
	}
}