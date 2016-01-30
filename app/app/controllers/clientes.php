<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/*****************************************************************************
 * Objeto que manejoa los clientes de facturas
 * @author eduardouio7@gmail.com
 * @version 1.0
 * @copy Mediperbarica 2015
 * 
 * Listado de Metodos creados
 * __construct()
 * getCustomers([idCustomer])
 * saveCustomer(customer)
 * deleteCustomer(idCustomer)
 * _validData(customer)
 *
 * SE CODIFICAN LO ERRORES VER ARCHIVO LISTADO DE ERRORES EN LA RAIZ DEL 
 * PROYECTO
 ****************************************************************************/
class Clientes extends MY_Controller {

	protected $Table_ = 'cliente';
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
	 * Lista los clientes o cliente
	 *@param (str) cedula del cliente
	 *@return (JSON) respuesta del server
	 */
	public function getCustomers($idCustomer = 0){
		#variable de respuesta
		$response = array('status' => 'Success');
		$this->Query_ = 'SELECT * FROM cliente';
		#validamos el idCustomer
		if($this->uri->segment(3)){
			$this->Query_ = $this->Query_ . ' WHERE id_cliente = ' . $idCustomer;
		}
		$this->Result_ = $this->db->query($this->Query_);
		if($this->Result_->num_rows() > 0){
			$response['msg'] = '3001';
			$response['data'] = $this->Result_->resul_array();
		}else{
			if($idCustomer != 0){
				$response['msg'] = '2001';
			}else{
				$response['msg'] = '2002';
			}
		}
		#emviamos la respuesta
		$this->rest->_responseHttp($response, $this->CodeHttp_);
	}


	/**
	 * Edita y guarada un n uevo cliente
	 * @param (array) datos del cliente
	 * @return (JSON) resultados de la peticion
	 */
	public function saveCustomer(){
		if($this->rest->_getRequestMethod() != 'POST'){
			$this->_notAuthorized();
		}
		$response = array('status' => 'Success');
		$customer = json_decode(file_get_contents('php://input'),true);
		#verdadero crea falso actualiza
		if(!$customer['update']){
			$status = $this->_validData($customer);
			#comprobamos que no exista
			$this->db->where('id_cliente',$customer['id_cliente']);
			$this->Result_ = $this->db->get($this->Table_);
			if($this->Result_->num_rows() > 0){
				$response['msg'] = '1000';
				$response['data'] = $this->Result_->resul_array();
			}else{
				$this->db->insert($this->Table_,$customer);
				$response['msg'] = '3000';
				$response['data'] = $this->db->insert_id();
			}

		}else{
			unset($customer['creado']);
			$status = $this->_validData($customer);
			if($status == 1){
				$this->db->where('id_cliente',$customer['id_cliente']);
				$this->db->update($this->Table_,$customer);
				$response['msg'] = '3001';
				$response['data'] = $customer;
			}else{
				$response['msg'] = $status;
			}
		}

		#enviamos la respuesta al cliente
		$this->rest->_responseHttp($response,$this->CodeHttp_);
	}


	/**
	 * Borra a un cliente solo si no tiene facturas
	 * @param (str) indetificado cliente
	 * @return (JSON) resputados respueta
	 */
	public function deleteCustomer($idCustomer){
		$response = array('status' => 'Succes');
		if(isset($idCustomer)){
			$this->db->where('id_cliente',$idCustomer);
			$this->Result_ = $this->db->get($this->Table_);
			if($this->Result_-> num_rows() > 0){
				#comprobamos las facturas del cliente
				$this->db->where('id_cliente',$idCustomer);
				$this->Result_ = $this->db->get('factura');
				if($this->Result_->num_rows() > 0){
					$response['msg'] = '2004';
					$response['data'] = $this->Result_->resul_array();
				}else{
					$this->db->where('id_cliente',$idCustomer);
					$this->db->delete($this->Table_);
					$this->db->where('id_cliente',$idCustomer);
					$this->Result_ = $this->db->get($this->Table_);
					$response['msg'] = '3003';
					$response['data'] = $this->Result_->resul_array();					
				}
			}else{
				#no existe
				$response['msg'] = '2001';
			}
		}else{
			$response['msg'] = '4000';
		}
		#enviamos las respuestas
		$this->rest->_responseHttp($response, $this->CodeHttp_);
	}


	/**
	 * Funcion de validacion de datos de antecedente
	 * @param (array) antecedente
	 * @return (int) code status
	 */
	public function _validData($antecedente){
		$params = array(
			'id_cliente'=>'9',
			'nombres'=>'4',
			'telefono'=>'4',
			'direccion'=>'4'
			);

		return($this->_validUserData($params,$antecedente,4));

	}
}