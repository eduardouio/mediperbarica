/*!
 * Fichero encargado de trabajar con el personal
 * http://mediperbarica.com.ec/
 *
 *
 * Copyright 2014 Mediperbarica Todos los derechos reservados
 * @autor: Eduardo Villota
 * @date: 20-03-2015 00:23
 */

// creamos un diccionario con los datos que debe recibir del formulario
var personal={};

function guardarForm(idFormulario){
    procesarFormulario(idFormulario);
    console.log(personal.cedula);
    console.log(personal.nombres);
    console.log(personal.telefono);
    console.log(personal.celular);
    console.log(personal.direccion);
    console.log(personal.notas);
    
}

//Tomamos los valores del formulario
function procesarFormulario(idFormulario){
    $(idFormulario).find(":input").each(function(){
        var campo = this;
        personal[campo.name] = campo.value;
        });
};