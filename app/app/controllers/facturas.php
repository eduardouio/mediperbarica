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
class Antecedentes extends MY_Controller {

	protected $Table_ = 'factura';
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
	 * Retorna un listado de facturas en total por cliente y tratamiento
	 * url a contestar
	 * http://.../facturas/getInvoices/invoice/1 => factura especificada 
	 * http://.../facturas/getInvoices/treatment/1 =>  facturas del tratamiento
	 * http://.../facturas/getInvoices/client/1 => facturas del cliente
	 * @param (int) id_factura 
	 * @return (JSON) listado de facturas o factura
	 */
	public function getInvoices($idInvoice = 0){
		#variable de respuesta
		$response = array('status' => 'Success');
		#verificamos que nos esta pidiendo listar
		# PENDIENTE

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