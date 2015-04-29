<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');


class Historias extends CI_Controller {
	/**
	 * Controlador encargado de gestionar la SPA de historias
	 *		El estado incial presenta un listado de las historias
	 * Peticiones a Responder
	 *
	 *	listar()
	 *	nuevo(ObjJSON)
	 *  buscar(param)
	 *	editar(ObjJSON) => menu de la lista de historias
	 *	asignarTratamiento(id_historia) => menu de la lista de historias
	 *  eliminar(id_historia) => menu de la lista de historias
	 *
	 * Propiedades Globales de la Clase
	 * (str)$Table_ => registra el nombre de la tabla en la base de datos
	 * (str)$Copntroller => nombre del controlador usado para las rutas
	 * (array)$Result_ => Guarda las respuestas de la base de datos
	 * (array)$CatalogoVistas_ relaciona las vista scon los contenidos
	 * (array) $Pagina_ => El vontenido HTML de la pagina completa
	 */

	protected $Table_ = 'historia';
	protected $Controller_ = 'historias';
	protected $Result_;
	protected $CatalogoVistas_;
	protected $Pagina_;
	protected $Query_;
	private $CodeHTTP = 200;
	private $ContentType = 'application/json';


	public function __construct(){
		parent::__construct();
		$this->load->library('form_validation');
	}

	/**
	 * Se muestra SPA historias 
	 */
	public function index()
	{	
		$this->CatalogoVistas_['cabecera'] = array();
		$this->CatalogoVistas_['sidebar'] = array('title' => 'Historias');
		$this->CatalogoVistas_['menu'] = array('historias' => 'active');
		$this->CatalogoVistas_['alertas'] = array();
		$this->CatalogoVistas_['contenidos'] = array();
		
		$this->_mostrarhtml($this->CatalogoVistas_);
	}

	 /**
	 * Obtiene un listado de historias o una historia
	 * @param $id_historia = 0 
	 */
	public function getHistoria($id_historia = 0){

	$this->Query_ = " SELECT hst.id_historia, 
		hst.id_paciente ,
		hst.nombres,
		(SELECT count(id_tratamiento) FROM tratamiento AS trt 
			WHERE trt.id_paciente = hst.id_paciente) AS `tratamientos`,
		hst.telefono,
		hst.mail ,
		timestampdiff(year,hst.fecha_nacimiento,curdate()) AS `edad`,
		hst.direccion ,
		concat(month(hst.creado), '-' , year(hst.creado)) as creado
		FROM historia AS hst;";
		$this->Result_ = $this->db->query($this->Query_);
		print json_encode($this->Result_->result_array());
	}

	/**
	 * Registra una historia en el sistema
	 * @param (array)$historia
	 */
	public function setHistoria(){
		if( $this->_getRequestMethod() != "POST"){
			$this->_resposeHttp('','406');
		}

		$historia = json_decode(file_get_contents("php://input"),true);
		# comprobamos que esten todos los campos
		if ($this->_checkData($historia)){
			#comprobamos que el id del Registro no exista
			$this->db->where('id_paciente', $historia['id_paciente']);
			$query = $this->db->get($this->Table_);
			$result = ($query->num_rows() > 0 ) ? true : false;
			if(!$result){
				$this->db->insert($this->Table_,$historia);
				$response = array('status'=>'Success',
								'msg'=> 'Historia Creada Correctamente',
								'data' => $historia);
				$this->_resposeHttp(json_encode($response), 201);	
			}else{
				$response = array('status'=>'Ok',
							  'msg'=>'Ya existe un registro con el mismo numero de Cedula en el sistema',
								'data' => $query->result_array());
				$this->_resposeHttp(json_encode($response), 200);	
			}

		} else{
			$response = array('status'=>'Ok',
							  'msg'=>'Uno de los campos no esta completo o no existe'
								);
			$this->_resposeHttp(json_encode($response), 200);
		}

	}

	/**
	 * Actualiza una historia
	 * @param (int)$id_historia
	 * @param (array)$historia.com/
	 */
	public function deleteHistoria(){

	}

	################ Funciones privadas para el funcionamiento ###############
	/**
	* Crea la plantilla de la pagina guaradandolas en una sola variable
	* @param array $catalogo array con las plantillas necesarias 
	* y su informacion
	**/
	private function _mostrarhtml($catalogo){
		$vistas;
		$this->Pagina_;
		foreach ($catalogo as $arreglos => $nombres) {
			$vistas[] = $arreglos;
			}
		foreach ($vistas as $nombre) {
			$this->Pagina_ = $this->Pagina_ . $this->load->view($nombre,
													$catalogo[$nombre],true);
			}
		$this->Pagina_ = $this->Pagina_ . $this->load->view('pie','',true);
		
		print $this->Pagina_;
		}

	/**
	 * Verifica el tipo de peticion que hace el nacvegador
	 * http://es.wikipedia.org/wiki/Anexo:C%C3%B3digos_de_estado_HTTP
	 */
	private function _getRequestMethod(){
		return  $_SERVER['REQUEST_METHOD'];
	}

	/**
	 * Envia las respuestas http mal navegador
	 */
	private function _resposeHttp($data,$status){
		$this->CodeHTTP = ($status) ? $status : 200;
		$this->_setHeaders();
		echo $data;
		exit;
	}

	/**
	 * Coloca las cabeceras http en las repuestas
	 */
	private function _setHeaders(){
		header("HTTP/1.1 " . $this->CodeHTTP . " " . $this->_getStatusMessage());
		header("Content-Type: $this->ContentType");
	}


	private function _getStatusMessage(){
		$status = array(
			200 => 'Ok' , 
			201 => 'Created' , 
			204 => 'No Content' , 
			404 => 'Not Found' , 
			406 => 'Not Acceptable' , 
			);
		return ($status[$this->CodeHTTP] ? $status[$this->CodeHTTP] : $status[500]);
	}

	/**
	 * Chequea la conexion a la base de datos
	 * @return boolean
	 */
	private function _checkDb(){
		if ($this->db){
			echo 'Algo';
		}
	}

	/**
	 * Funcion encargada de verificar los datos ingresados por el usuario
	 * @param array(historia)
	 * @return boolean
	 */
	private function _checkData($historia){
		$condicion = false;
		$i = 0;
		$longitudes_minimas = array(
						'id_paciente'=>'9',
						'nombres'=>'4',
						'telefono'=>'6',
						'fecha_nacimiento'=>'9',
						'mail' => '5',
						'direccion' => '8',
						'nombre_familiar' => '0',
						'telefono_familiar' => '0',
						'direccion_familiar' => '0');

		foreach ($historia as $key => $value) {
			$i++;
			#print ($longitudes_minimas[$key]) . " <<<<<<" . (strlen($value)) . "\n";
			if(($longitudes_minimas[$key]) < (strlen($value))){
				$condicion = true;
			}else{
				$condicion = false;
				break;				
			}
		}
		#comprobamos que al menos nos deb los 6 primeros campos
		if ($i > 5){
			return $condicion;			
		}else{
			return false;
		}
}

}