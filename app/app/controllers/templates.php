<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');


class Templates extends MY_Controller {
	/**
	 * Controlador encargado de devolver las plantillas con datos para
	 * los modales y alertas de ser necesario
	 * @author eduardouio7@gmail.com
 	 * @version 1.0
 	 * @copy Mediperbarica 2015
	 *
	 *
	 * Propiedades Globales de la Clase
	 * (str)$Table_ => registra el nombre de la tabla en la base de datos
	 * (str)$Copntroller => nombre del controlador usado para las rutas
	 * (array)$Result_ => Guarda las respuestas de la base de datos
	 * (array)$CatalogoVistas_ relaciona las vista scon los contenidos
	 * (array) $Pagina_ => El vontenido HTML de la pagina completa
	 *
	 * SE CODIFICAN LO ERRORES VER ARCHIVO LISTADO DE ERRORES EN LA RAIZ DEL 
	 * PROYECTO
	 *
	 */

	protected $Result_;
	protected $CatalogoVistas_;
	protected $Pagina_;
	protected $Query_;

	/*************************************************************************
	 *  Funcion Contructora inicializa librerias
	 * @method __construct()
	 * @return (void)
	 ************************************************************************/
	public function __construct(){
		parent::__construct();
		$this->_checkSesion();
	}

	/*************************************************************************
	* Retorna la plantilla para el modal presentar historia
	* @method getTplPresentHistory()
	* @return str(html)
	 ************************************************************************/
	public function getTplPresentHistory()
	{	
		if($this->rest->_getRequestMethod()!= "POST"){
			$respuesta = array(
				'message' => 'Estas entrando por GET HDP!'
			);
			$this->rest->_responseHttp($respuesta,'406');
		}
		// Se crea un diccionario con las respuestas
		$response = array('status' => 'success');
		$idPerson = json_decode(file_get_contents("php://input"),true);
		
		//Se completan los datos de la historia
		$this->Query_ = 'SELECT 
							* FROM historia 
							WHERE id_paciente = \'' . $idPerson . '\'';
		$this->Result_ = $this->db->query($this->Query_);
		$response['data']['history'] = $historia = $this->Result_->result_array();

		//Se completa la lista de Antecedentes
		$this->Query_ = 'SELECT 
						id_antecedente, 
						tipo, 
						detalle 
						FROM antecedente 
						WHERE id_paciente = \'' . $idPerson . '\'';
		$this->Result_ = $this->db->query($this->Query_);
		$response['data']['antecendt'] = $this->Result_->result_array();

		//Se completa el listado de tratamientos
		$this->Query_ = 'SELECT 
						trt.id_tratamiento, 
						trt.creado,
						per.nombres, 
						trt.motivo_tratamiento, 
						trt.nro_sesiones,
						(SELECT count(id_sesion) 
							FROM sesion 
							WHERE id_tratamiento = trt.id_tratamiento) AS 
							sesiones_realizadas,
						((trt.nro_sesiones)-(SELECT count(id_sesion) 
							FROM sesion 
							WHERE id_tratamiento = trt.id_tratamiento)) AS 
						sesiones_pendientes
						FROM tratamiento as trt 
						LEFT JOIN personal as per USING(id_personal)
						WHERE id_paciente = \'' . $idPerson . '\'' . 'ORDER BY 
						trt.id_tratamiento DESC;';
		$this->Result_ = $this->db->query($this->Query_);
		$response['data']['treatments'] = $this->Result_->result_array();

		//Consultamos las ultimas sesiones del tratamiento
		$id_tratamiento = $response['data']['treatments'][0]['id_tratamiento'];
		$this->Query_ = 'SELECT
						 ses.id_sesion,
						 ses.id_tratamiento,
						 ses.fecha,
						 ses.hora,
						 per.nombres
						 FROM sesion AS ses
						 LEFT JOIN personal  AS per USING (id_personal)
						 WHERE id_tratamiento = ' . $id_tratamiento ;
		$this->Result_ = $this->db->query($this->Query_);
		$response['data']['sessions'] = $this->Result_->result_array();

		//recuperamos las sesiones del ultimo tratamiento
		$response['msg'] = '1005';

		print(var_dump($response));

		
	}

}