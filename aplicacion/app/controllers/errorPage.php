<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
* 
*/
class ErrorPage extends CI_Controller
{
	public function index(){
		$error = array (
			'code'=> '404',
			'url' =>  base_url() . $this->uri->uri_string()
			); 
		header("HTTP/1.1 " . '404' . " " . 'Not Found');
        header("Content-Type:" . 'json/application');
		print(json_encode($error));
	}
}