$(document).ready(function(){

	
});

function validar(){
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