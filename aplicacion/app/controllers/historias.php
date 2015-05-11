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
	 *
	 * SE CODIFICAN LO ERRORES VER ARCHIVO LISTADO DE ERRORES EN LA RAIZ DEL PROYECTO
	 *
	 */


	protected $Table_ = 'historia';
	protected $Controller_ = 'historias';
	protected $Result_;
	protected $CatalogoVistas_;
	protected $Pagina_;
	protected $Query_;
	protected $ModuloAngular_ = array('modulo' => 'historias.js' );


	public function __construct(){
		parent::__construct();
		$this->load->library('form_validation');
		$this->load->library('rest');
	}

	/**
	 * Se muestra SPA historias 
	 */
	public function index()
	{	
		$this->CatalogoVistas_['cabecera'] = array();
		$this->CatalogoVistas_['sidebar'] = array('title' => 'Historias');
		$this->CatalogoVistas_['menu'] = array('historias' => 'active');
		$this->CatalogoVistas_['contenidos'] = array();		
		$this->_mostrarhtml($this->CatalogoVistas_);
	}

	 /**
	 * Obtiene un listado de historias o una historia
	 * @param $id_historia = 0 
	 */
	public function getHistoria($historiaID = 0){
		//print(var_dump($historiaID));
		if ($historiaID == 0){
			$this->Query_ = " SELECT hst.id_historia, 
			hst.id_paciente ,
			hst.nombres,
			(SELECT count(id_tratamiento) FROM tratamiento AS trt 
				WHERE trt.id_paciente = hst.id_paciente) AS `tratamientos`,
			hst.telefono,
			hst.mail ,
			hst.nombre_referente ,
			timestampdiff(year,hst.fecha_nacimiento,curdate()) AS `edad`,
			hst.direccion ,
			concat(month(hst.creado), '-' , year(hst.creado)) as creado
			FROM historia AS hst
			Order by hst.creado DESC;";
			
		} else{
			$this->Query_ = "SELECT * from historia WHERE id_historia = " . $historiaID . ";";
		}	
			$this->Result_ = $this->db->query($this->Query_);
			$response = array('status'=>'Success',
								'msg'=> '1005',
								'data' => $this->Result_->result_array());

			$this->rest->_resposeHttp(json_encode($response),200);
	}

	/**
	 * Registra una historia en el sistema
	 * @param (array)$historia
	 */
	public function setHistoria(){
		if( $this->rest->_getRequestMethod() != "POST"){
			$this->rest->_resposeHttp('','406');
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
								'id_historia' => $this->db->insert_id(),
								'msg'=> '1002',
								'data' => $historia);
				$this->rest->_resposeHttp(json_encode($response), 201);	
			}else{
				$historia_old = $query->result_array();
				$response = array('status'=>'Ok',
								'id_historia' => $historia_old[0]['id_historia'],
							  	'msg'=>'1000',
								'data' => $query->result_array());
				$this->rest->_resposeHttp(json_encode($response), 200);	
			}

		} else{
			$response = array('status'=>'Ok',
							  'msg'=>'1001'
								);
			$this->rest->_resposeHttp(json_encode($response), 200);
		}

	}

	/**
	 * Actualiza una historia
	 */
	public function updateHistoria(){
		if( $this->rest->_getRequestMethod() != "POST"){
			$this->rest->_resposeHttp('','406');
		}

		$historia = json_decode(file_get_contents("php://input"),true);
		# comprobamos que esten todos los campos
		$validate = $historia;
		unset($validate['id_historia']);
		unset($validate['creado']);
		if ($this->_checkData($validate)){
			#comprobamos que el id del historia exista
			$this->db->where('id_historia', $historia['id_historia']);
			$query = $this->db->get($this->Table_);
			$result = ($query->num_rows() > 0 ) ? true : false;

			if($result){
				#comprobar que el numero de cedula no este asignado a otra historia que no sea esta
				$this->db->where('id_paciente', $historia['id_paciente']);
				$query = $this->db->get($this->Table_);
				$historia_old = $query->result_array();
				#print(var_dump($historia_old));
				#print(var_dump($historia));
				if($historia_old[0]['id_historia'] == $historia['id_historia']){
					#se actualiza la historia
					$this->db->where('id_historia',$historia['id_historia']);
					$this->db->update($this->Table_,$validate);
					$response = array('status'=>'Success',
										'id_historia' => $historia['id_historia'],
										'msg'=> '1003',
										'data' => $historia);
					$this->rest->_resposeHttp(json_encode($response), 201);	
				}else{
					$response = array('status'=>'Ok',
								'id_historia' => $historia_old[0]['id_historia'],
							  	'msg'=>'1000'
							  	);
					$this->rest->_resposeHttp(json_encode($response), 200);	
				}				

			}else{
				$response = array('status'=>'Ok',
								'id_historia' => $historia_old[0]['id_historia'],
							  	'msg'=>'1004'
							  	);
				$this->rest->_resposeHttp(json_encode($response), 200);	
			}	
		} else{
			$response = array('status'=>'Ok',
							  'msg'=>'1001');
			$this->rest->_resposeHttp(json_encode($response), 200);
		}

	}

	 /**
	 * Obtiene un listado de antecedentes de una historia
	 * @param $id_historia = 0 
	 */
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

	 /**
	 * Obtiene un antecedente de antecedentes de una historia
	 * @param $antecedeteId = 0 
	 */
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


	/**
	 * Crea un antecedente en una historia
	 */
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
				$this->db->where('id_paciente',$newAntecedenteArray[0]['id_paciente']);
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

	/**
	 * Actualiza una antecedete
	 */
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

	###################3 Funcion de Reporte hisotoria ######################
	/**
	 * Obtiene un reporte PDF de la hisotoria de acuerdo al formato
	 */
	public function getReporteHistoria($id_historia){
		if($id_historia > 0){
			$this->db->where('id_historia',$id_historia);
			$this->Query_ = $this->db->get($this->Table_);
			$historia = $this->Query_->result_array();
			$this->db->where('id_paciente',$historia[0]['id_paciente']);
			$this->Query_ = $this->db->get('antecedente');
			$antecedentes = $this->Query_->result_array();
			$data = array(
				'historia' => $historia[0],
				'antecedentes' => $antecedentes
				);
		$this->CatalogoVistas_['reporte-historia'] = $data;
		

		}else{
		$this->CatalogoVistas_['cabecera'] = array();
		$this->CatalogoVistas_['sidebar'] = array('title' => 'Historias');
		$this->CatalogoVistas_['menu'] = array('historias' => 'active');
		$this->CatalogoVistas_['alertas'] = array('alerta' => 'El identificador de la historia no es el Correcto!');
		$this->CatalogoVistas_['contenidos'] = array();		
		}
		$this->_mostrarhtml($this->CatalogoVistas_);
	}


	/**
	 * Funcion encargada de verificar los datos ingresados por el usuario
	 * @param array(historia)
	 * @return boolean
	 */
	private function _checkData($historia){
		#print('objeto recibido en validacion');
		#print(var_dump($historia));
		$condicion = false;
		$i = 0;
		$longitudes_minimas = array(
						'id_paciente'=>'9',
						'nombres'=>'4',
						'telefono'=>'6',
						'fecha_nacimiento'=>'9',
						'mail' => '4',
						'direccion' => '4',
						'nombre_referente' => '-1',
						'telefono_referente' => '-1',
						'mail_referente' => '-1',
						'nombre_familiar' => '-1',
						'telefono_familiar' => '-1',
						'direccion_familiar' => '-1');
		if((count($historia)) > 0) {
			foreach ($historia as $key => $value) {
				$i++;
				if(($longitudes_minimas[$key]) < (strlen($value))){
					$condicion = true;
				}else{
					$condicion = false;
					break;
				}
			}
			#comprobamos que al menos nos deb los 6 primeros campos
			#print('| comprobamos el valor del controlador ' . $i);
			#print('| Valor de condicion => ' . $condicion);
			if ($i > 5){
				return $condicion;			
			}else{
				return false;
			}
		}

	}

	/**
	 * Funcion encargada de verificar los datos ingresados por el usuario
	 * para el arreglo de antecedentes
	 * @param array(antecedente)
	 * @param (boolean) opcion indica si es una validacion true = nuevo false = editar 
	 * @return boolean
	 */
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
			#print('| comprobamos el valor del controlador ' . $i);
			#print('| Valor de condicion => ' . $condicion);
			if ($i > 2){
				return $condicion;			
			}else{
				return false;
			}
		}

	}

	    ################ Funciones privadas para el funcionamiento ###############
    /**
    * Crea la plantilla de la pagina guaradandolas en una sola variable
    * @param array $catalogo array con las plantillas necesarias 
    * y su informacion
    **/
     function _mostrarhtml($catalogo){
        $vistas;
        $this->Pagina_;
        foreach ($catalogo as $arreglos => $nombres) {
            $vistas[] = $arreglos;
            }
        foreach ($vistas as $nombre) {
            $this->Pagina_ = $this->Pagina_ . $this->load->view($nombre,
                                                    $catalogo[$nombre],true);
            }

        $this->Pagina_ = $this->Pagina_ . $this->load->view('pie',$this->ModuloAngular_,true);
        
        print $this->Pagina_;
        }
}