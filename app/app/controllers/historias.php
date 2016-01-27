<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');


class Historias extends MY_Controller {
	/**
	 * Controlador encargado de proveer JSON API para hgistorias
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


	protected $Table_ = 'historia';
	protected $Result_;
	protected $CatalogoVistas_;
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

	 /************************************************************************
	 * Obtiene un listado de historias o una historia
	 * @param (int) opcional identificador de la historia se pasa auto desde url
	 * @return (JSON) Listado de hisotrias
	 ************************************************************************/
	public function getHistories($idHistory = 0){
		//variable de respuesta
		$response = array(
				'status' => 'Success' );

		//confirmamos el Id de la historia sino listamos todo
		if($this->uri->segment(3)){
			$this->Query_ = "SELECT * from historia WHERE id_historia = " . 
															$idHistory . "
											Order by nombres DESC;";
		}else{
			$this->Query_ = " SELECT hst.id_historia, 
					hst.id_paciente , hst.nombres,
					(SELECT count(id_tratamiento) FROM tratamiento AS trt 
					WHERE trt.id_paciente = hst.id_paciente) AS `tratamientos`,
					hst.telefono, hst.mail , hst.nombre_referente ,
					timestampdiff(year,hst.fecha_nacimiento,curdate()) AS `edad`,
					concat(month(hst.creado), '-' , year(hst.creado)) as creado
					FROM historia AS hst  Order by hst.nombres ASC;";
		}
		
		//ejecuta la consulta
		$this->Result_ = $this->db->query($this->Query_);

		//comprobamos los posibles errores en las consultas
		if($this->Result_->num_rows() > 0){
			$response['msg'] = '3002';
			$response['data'] = $this->Result_->result_array();
		}elseif($idHistory){
			$response['msg'] = '2001';
		}else{
			$response['msg'] = '2002';
		}
		//enviamos respuesta
		$this->rest->_responseHttp($response,200);
	}

	/*************************************************************************
	 * Registra una historia en el sistema
	 * @method setHistoria()
	 * @param (array) arreglo con los datos de la historia a crear 
	 * @return (JSON) Estado de la peticion http 200 y 201
	 ************************************************************************/
	public function saveHistory(){
		if( $this->rest->_getRequestMethod() != "POST"){
			$this->rest->_responseHttp('Entrada no autorizada, favor vuelva a '.
													 base_url() ,406);
		}
		#variable de respuesta
		$response = array(
			'status' => 'Success');
	
		$history = json_decode(file_get_contents("php://input"),true);

		# true crear False Actualizar
		if(!$history['id_historia']){
			$status = $this->_validData($history);

			#validamos sino se retorna el error
			if($status == 1){
				$this->db->insert($this->Table_,$history);
				$response['msg'] = '3000';
				$response['data'] = $this->db->insert_id();

			}else{
				$response['msg'] = $status;
			}
		}else{
			#quitamos los datos inecesarios para la validacion
			$validateHistory = $history;
			unset($validateHistory['id_historia']);
			unset($validateHistory['creado']);
			
			#validamos
			$status = $this->_validData(validateHistory);

			#comprobamos que el DNI no este en otra historia unico
			$IdPerson = true;
			$this->Query_ = 'SELECT id_paciente FROM historia WHERE id_paciente' . 
							' = ' . $history['id_historia'] ;
			$Result_ = $this->db->query($this->Query_);
			if($Result_->num_rows() > 0){
				$IdPerson = false;
			}

			if($status == 1){
				if($IdPerson){
					$this->db->where('id_historia',$history['id_historia']);
					$this->db->update($this->Table_, $validateHistory);
					$response ['msg'] = '3001';
					$response ['data'] = $history['idHistory'];				
				}else{
					$response['msg'] = '2006';
					$response['data'] = $this->Result_->result_array();
				}

			}else{
				$response['msg'] = $status;
			}

		}

		//enviamos respuesta
		$this->rest->_responseHttp($response,200);
	}

	
	/*************************************************************************
	 * Obtiene un reporte PDF de la hisotoria solicitada
	 * @method getHistoryReport
	 * @param (int) identificador de la historia
	 * @return (JSON) Objeto JS con los detalles de una historia
	 ************************************************************************/
	public function getPDFHistory($id_historia){
		#arreglo de vistas de envio datos y recoleccion
		$data = array(
			'historia' => array(),
			'antecedentes' => array(),
			'tratamientos' => array()
			);
		#comprobamos el parametro
		if(isset($id_historia)){
			#obtenemos la historia
			$this->db->where('id_historia',$id_historia);
			$this->Query_ = $this->db->get($this->Table_);
			$history = $this->Query_->result_array();
			if($this->Query_->num_rows() > 0){
				$data['historia'] = $history[0];
				#obtenemos los antecedentes
				$this->db->where('id_paciente',$history[0]['id_paciente']);
				$this->Query_ = $this->db->get('antecedente');
				$data['antecedentes'] = $this->Query_->result_array();	
				#ontenemos los tratamientos
				$this->Query_ = 'SELECT
					trt.id_tratamiento,
					per.nombres as personal,
				    trt.nro_sesiones,
				    trt.creado,
				    (SELECT count(id_sesion) 
				FROM sesion 
				WHERE id_tratamiento = trt.id_tratamiento) as sesiones_realizadas,
				    trt.motivo_tratamiento
				FROM tratamiento as trt
				LEFT JOIN personal as per USING(id_personal)
				LEFT JOIN historia as hst USING(id_paciente)
				WHERE id_paciente = ' . $history[0]['id_paciente'] . ';';
				$this->Result_= $this->db->query($this->Query_);
				$data['tratamientos'] = $this->Result_->result_array();
				$this->CatalogoVistas_['reporte-historia'] = $data;
				$this->_mostrarHTML($this->CatalogoVistas_);
			}else{
				print('<h1>La historia que Busca no Existe</h1>');	
			}

		}else{
			print('<h1>No se ha especificado un identificado de Historia</h1>');
		}

		
	}


	/*************************************************************************
	 * Validar los datos de hisotoria
	 * @method _checkData
	 * @param (array) arreglo con los datos de historia
	 * @return (array) status
	 ************************************************************************/
	private function _validData($history){
		#status 1 significa que todo esta bien
		$status = 1;
		#valida los 5 primeros datos
		$i = 0;
		$minimalLen = array(
						'id_paciente'=>'9',
						'nombres'=>'4',
						'telefono'=>'6',
						'fecha_nacimiento'=>'9',
						'mail' => '4',
						'direccion' => '5',
						'nombre_referente' => '-1',
						'telefono_referente' => '-1',
						'mail_referente' => '-1',
						'nombre_familiar' => '-1',
						'telefono_familiar' => '-1',
						'direccion_familiar' => '-1');
		#comprobamos que el arreglo tenga datos
		if((count($history)) > 0) {
			foreach ($history as $key => $value) {
				$i++;
				#comprobamos las longitudes
				if(($minimalLen[$key]) < (strlen($value))){
					 $status = 1 ;
				}else{
					 $status  = 2005;					
					break;
				}
			}
			#comprobamos que al menos nos deb los 6 primeros campos
			if ($i > 5){
				return $status;
			}else{
				$status = 2000;
				return $status;
			}
		}else{
			#si el arreglo esta vacio se retorna error
			$status = 4000;
			return $status;
		}

	}
}