$(document).ready(function(){

	
});

function validar()
{
		var periodos = document.getElementsByName('periodo');
		var validoP = false;
		var actividades = document.getElementsByName('actividad');
		var validoA = false;
		
		for (var i = periodos.length - 1; i >= 0; i--) {
			if (periodos[i].checked) {
				validoP = true;
			}
		}

		for (var i = actividades.length - 1; i >= 0; i--) {
			if (actividades[i].checked) {
				validoA = true;
			}
		}

		if (validoP && validoA) {
			$("#btnCargarForm").click();
		}else{
			document.getElementById("msmSeleccionar").style.display = "inline";
		}
}

jQuery(function($){
	// Definimos las mascaras para cada input	
	$("#id_dui_docente").mask("99999999-9");
	$("#id_telefono_docente").mask("9999-9999");	
});