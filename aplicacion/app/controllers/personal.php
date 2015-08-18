<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
	

/**
* Clase encargada de administrar a al personal
*/
class Personal extends My_Controller {

	var $Data_;
	var $Table_ = 'personal';

	public function index()
	{
		$this->load->view('cabecera');
		$this->load->view('alertas');
		$this->load->view('totales');
        $this->load->view('frm_personal');
		$this->load->view('widget_tratamientos');
		$this->load->view('widget_pacientes');
		$this->load->view('pie');
	}

	
	function registrar(){
		$postdata = file_get_contents("php://input");
		$this->Data_ = json_decode($postdata);
		$this->db->insert($this->Table_,$this->Data_);
		print($this->db->last_query());
	}

	
	/**
	 * Obtiene el listado de los empleados
	 * @return (array) listado de empleados
	 */
	public function getEmployedData(){
		$this->Query_ = 'SELECT id_personal, nombres, celular, mail 
						FROM personal Order by nombres ASC';
		$this->Result_ = $this->db->query($this->Query_);
		$this->checkData($this->Result_);
	}

		/**
	 * Funcion encagada de comprobar que el arreglo tenga datos
	 * @param (array) drespuesta SQL
	 * @return (JSON) responde con data
	 */
	private function checkData($resource){
		//variable de respuesta
		$response = array(
						'status' => 'Success');
		//enviamos una respuesta dependiendo de la coneccion
		if($resource->num_rows() > 0){
			$response['msg'] = '1005';
			$response['data'] = $this->Result_->result_array();
		}else{
			$response['msg'] = '1007';
		}
		//enviamos respuesta
		$this->rest->_responseHttp($response,200);
	}

}