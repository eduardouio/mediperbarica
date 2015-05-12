<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/*****************************************************************************
 * Controlador encargado de manejar los tratamientos
 *  
 * @author eduardouio7@gmail.com
 * @version 1.0
 * @copy Mediperbarica 2015
 * 
 * listarTratamientos()
 * setTratamiento()
 * getTRatamiento()
 * updateTratamiento()
 * 
 ****************************************************************************/
class Tratamientos extends CI_Controller {

	protected $Table_ = 'tratamiento';
	protected $Controller_ = 'tratamientos';
	protected $Result_;
	protected $CatalogoVistas_;
	protected $Pagina_;
	protected $Query_;
	protected $ModuloAngular_ = array('modulo' => 'tratamientos.js' );

	/**
	 * Metodo encargado de iniciar las librerias y el controller
	 * @method __construct
	 * @return (void)
	 */
	function __construct(){
		parent::__construct();
		$this->load->library('rest');
	}

	/*************************************************************************
	* Muestra la pagina de inicio y sus librerias
	* @method index
	* @return void	  
	 ************************************************************************/
	public function index()
	{	
		$this->CatalogoVistas_['cabecera'] = array();
		$this->CatalogoVistas_['sidebar'] = array('title' => 'Tratamientos');
		$this->CatalogoVistas_['menu'] = array('tratamientos' => 'active');
		$this->CatalogoVistas_['contenidos'] = array();		
		$this->_mostrarHTML($this->CatalogoVistas_);
	}


    /*************************************************************************
    * Carga los datos en las plantillas HTML y las Imprime  
    * @method _mostrarHTML()
    * @param (array) arreglo con el listado de vistas y datos
    * @return (void)
    *************************************************************************/
     function _mostrarHTML($catalogo){
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