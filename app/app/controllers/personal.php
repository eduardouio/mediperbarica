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

		#true crear fase actualizar
		if(!$employee['update']){
			#comprobamos que no exista
			$this->db->where('id_personal',$employee['id_personal']);
			$this->Result_ = $this->db->get($this->Table_);
			
			


		}else{

		}
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