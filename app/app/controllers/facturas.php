<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/*****************************************************************************
 * Objeto que encatgado de manejar la facturacion
 * @author eduardouio7@gmail.com
 * @version 1.0
 * @copy Mediperbarica 2015
 * 
 * Listado de Metodos creados
 * __construct()
 * getInvoices([id_invoice])
 * saveInvoice(invpice)
 * deleteInvoice(id_invice)
 * _validData(invoice)
 *
 * SE CODIFICAN LO ERRORES VER ARCHIVO LISTADO DE ERRORES EN LA RAIZ DEL 
 * PROYECTO
 ****************************************************************************/
class Facturas extends MY_Controller {

	protected $Table_ = 'factura';
	protected $CodeHttp_ = 200;
	protected $Result_;
	protected $Query_;
	protected $catalogoVistas = array();

	
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
	 * Retorna un listado de facturas en total por cliente y tratamiento
	 * url a contestar
	 * http://.../facturas/getInvoices/id_factura/1 => factura especificada 
	 * http://.../facturas/getInvoices/id_tratamiento/1 =>  facturas del tratamiento
	 * http://.../facturas/getInvoices/id_cliente/1 => facturas del cliente
	 * @param (int) id_factura 
	 * @return (JSON) listado de facturas o factura
	 */
	public function getInvoices(){
		#variable de respuesta
		$response = array('status' => 'Success');
		#verificamos que nos esta pidiendo listar
		if($this->uri->segment(4)){
			//tomamos los parametros de la consulta
			$param = $this->uri->segment(3);
			$id = $this->uri->segment(4);
			$this->Query_ = 'SELECT * FROM factura WHERE ' . $param . ' = ' . $id;
			$this->Result_ = $this->db->query($this->Query_);
			#comprobamos la cantidad de registros
			if($this->Result_->num_rows() > 0){
				$response['msg'] = '3002';
				$response['data'] = $this->Result_->result_array();
			}else{
				$response['msg'] = '2001';
			}
		}else{
			#si no tenemos el parametro listamos todas las facturas
			$this->Result_ = $this->db->get($this->Table_);
			if($this->Result_->num_rows() > 0){
				$response['msg'] = '3002';
				$response['data'] = $this->Result_->result_array();
			}else{
				$response['msg'] = '2002';
			}
		}
		#envio de respuesta	
		$this->rest->_responseHttp($response, $this->CodeHttp_);
	}

	
	/**
	 * Registra una factura 
	 * @param datos de factura
	 * @return (JSON) respuesta de saervidor
	 */
	public function saveInvoice(){
		if($this->rest->_getRequestMethod() != 'POST'){
			$this->_notAuthorized();
		}
		#variable de respuesta
		$response = array('status' => 'Success');
		$invoice = json_decode(file_get_contents('php://input'),true);
		$status = $this->_validData($invoice);
		#validamos y registramos la fvactura
		if($status == 1){
			#confirmamos que el id de factura no este registrada
			$this->db->where('id_factura',$invoice['id_factura']);
			$this->Result_ = $this->db->get($this->Table_);
			if($this->Result_->num_rows() > 0){
				$response['msg'] = '1000';
				$response['data'] = $this->Result_->result_array();
			}else{
				$this->db->insert($this->Table_, $invoice);
				$response['msg'] = '3001';
				$response['data'] = $invoice;
			}
		}else{
			$response['msg'] = $status;
		}
		#envio de respuesta
		$this->rest->_responseHttp($response, $this->CodeHttp_);
	}


	/**
	 * Funcion encargada de anular una factura, las facturas solo se pueden 
	 * eliminar si estan enm estado EMITIDO
	 * @param (int) identificador factura
	 * @return (JSON) respuesta
	 */
	public function invalidateInvoice($idInvoice){
		#creamos variable de respuesta
		$response = array('status' => 'Success');
		#verficacmos el parametro
		if(isset($idInvoice)){
			#verificar que exista la factura y no este cobrada, anulada
			$this->db->where('id_factura',$idInvoice);
			$this->Result_ = $this->db->get($this->Table_);
			if($this->Result_->num_rows() > 0){
				$oldInvoice = $this->Result_->result_array();
				if($oldInvoice[0]['estado'] == 'emitida'){
					$data = array('estado' => 'anulada');
					$this->db->where('id_factura', $idInvoice);
					$this->db->update($this->Table_, $data);
					$response['msg'] = '3001';
					$response['data'] = $idInvoice;
				}else{	
					$response['msg'] = '2008';
					$response['data'] = $oldInvoice[0];
				}
			}else{
				$response['msg'] = '2001';
			}
		}else{
			$response['msg'] = '4000';
		}
		#enmviamos variable de respuesta
		$this->rest->_responseHttp($response,$this->CodeHttp_);
	}


	/**
	 * Imprime una factura sobre el papel
	 * @param (int) idInvoice identificador de factura
	 * @return (str) pagina con la factura formateada
	 */
	public function printInvoice($idInvoice){

	}

	
	/**
	 * Funcion de validacion de datos de la factura
	 * @param (array) factura 
	 * @return (int) code status
	 */
	public function _validData($invoice){
		$params = array(
			'id_factura'=>'1',
			'id_cliente'=>'9',
			'id_tratamiento'=>'1',
			'fecha'=>'9',
			'subtotal0'=>'1',
			'estado'=>'5',
			'subtotal12'=>'1',
			'descuento'=>'-1',
			'notas'=>'-1',
			);

		return($this->_validUserData($params,$invoice,7));

	}
}