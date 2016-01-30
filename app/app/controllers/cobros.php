<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/*****************************************************************************
 * Objeto que maneja los cobros de una factura
 * @author eduardouio7@gmail.com
 * @version 1.0
 * @copy Mediperbarica 2015
 * 
 * Listado de Metodos creados
 * __construct()
 * getCollection([id_invoice])
 * saveCollection(id_invoice)
 * deleteCollection(id_invoice)
 * _validData(collection)
 *
 * SE CODIFICAN LO ERRORES VER ARCHIVO LISTADO DE ERRORES EN LA RAIZ DEL 
 * PROYECTO
 ****************************************************************************/
class Cobros extends MY_Controller {

	protected $Table_ = 'cobro';
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
	 * retorna los cobros de una factura o todos los cobreo
	 * @param (int) $idInvoice identificado de factura
	 * @return (JSON) respuesta del server
	 */
	public function getCollections($idInvoice = 0){
		#variable de respuesta
		$response = array('status' => 'Succes');
		if($this->uri->segment(3)){
			$this->Query_ = 'SELECT * FROM 	cobro WHERE id_factura = ' . $idInvoice;
		}else{
			$this->Query_ = 'SELECT 
					cob.id_cobro,
					cob.fecha,
					cob.id_factura,
					fac.id_factura,
					trt.id_tratamiento,
					cli.nombres,
					cob.tipo,
					cob.nro_deposito,
					cob.valor
					FROM cobro AS cob
					LEFT JOIN factura as fac USING(id_factura)
					LEFT JOIN tratamiento as trt USING(id_tratamiento)
					LEFT JOIN cliente as cli using(id_cliente)';
		}
		#ejecutamos la consulta
		$this->Result_ = $this->db->query($this->Query_);
		if($this->Result_->num_rows() > 0){
			$response['msg'] = '3002';
			$response['data'] = $this->Result_->resul_array();
		}else{
			if($idInvoice != 0){
				$response['msg'] = '2001';
			}else{
				$response['msg'] = '2002';
			}
		}
		#envio de respuesta
		$this->rest->_responseHttp($response, $this->CodeHttp_);
	}


	/**
	 * Guarad un cobro en la base
	 * @param (array) cobro
	 * @return (JSON) respuesta server
	 */
	public function saveCollection(){
		if($this->rest->_getRequestMethod() != 'POST'){
			$this->_notAuthorized();
		}
		#variable de respuesta
		$response = array('status' => 'Success');
		$collection = json_decode(file_get_contents('php://input'),true);
		#comprobamos si es nuevo o edicion
		if(!$collection['id_cobro']){
			#nuevo
			$status = $this->_validData($collection);
			if($status == 1){
				$this->db->insert($this->Table_, $collection);
				$response['msg'] = '3000';
				$response['data'] = $this->db->insert_id();
			}else{
				$response['msg'] = $status;
			}
		}else{
			#edicion
			$oldCollection = $collection;
			$this->db->where('id_cobro',$collection['id_cobro']);
			$this->Result_ = $this->db->get($this->Table_);
			if($this->Result_->num_rows() > 0){
				unset($collection['id_cobro']);
				unset($collection['registro']);
				$status = $this->_validData($collection);
				if($status == 1){
					#actualizamos el registro
					$this->db->where('id_cobro',$oldCollection['id_cobro']);
					$this->db->update($this->Table_, $collection);
					$response['msg'] = '3001';
					$response['data'] = $oldCollection;
				}else{
					$response['msg'] = $status;
				}
			}else{
				$response['msg'] = '2001';
			}
		}
		#envio de respuesta
		$this->rest->_responseHttp($response,$this->CodeHttp_);
	}


	/**
	 * elimina un cobro no le permite elimianr despues de un dia
	 * @param idCobro a eliminar 
	 * @return respuseta server
	 */
	public function deleteCollection($idCollection){
		#variable de respuesta
		$response = array('status' => 'Success');
		#verificamos el parametro
		if(isset($idCollection)){
			$this->db->where('id_cobro',$idCollection);
			$this->Result_ = $this->db->get($this->Table_);
			if($this->Result_->num_rows() > 0){
				$collection = $this->Result_->resul_array();
				$timeA = strtotime(date("Y-m-d h:i:s"));
				$TimeB = strtotime($collection[0]['registro']);
				$interval = ($timeA - $TimeB);
				if($interval < 43200){
					$this->db->where('id_cobro', $idCollection);
					$this->db->delete($this->Table_);
					$response['msg'] = '3003';
					$response['data'] = $collection;
				}else{
					$response['msg'] = '2007';
				}
			}else{
				$response['msg'] = '2001';
			}
		}else{
			$response['msg'] = '4000';
		}
		#envio de respuesta
		$this->rest->_responseHttp($response, $this->CodeHttp_);
	}


	/**
	 * Funcion de validacion de datos de un cobro
	 * @param (array) cobro
	 * @return (int) code status
	 */
	protected function _validData($collection){
		$params = array(
			'id_factura'=>'1',
			'tipo'=>'4',
			'fecha'=>'8',
			'valor'=>'1',
			'banco'=>'-1',
			'nro_cheque'=>'-1',
			'nro_deposito'=>'-1'
			);

		return($this->_validUserData($params,$collection,4));

	}
}