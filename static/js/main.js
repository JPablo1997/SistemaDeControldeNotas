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

    if (validoP && validoA && document.getElementById("msmSeleccionar")) {
      $("#btnCargarForm").click();
    }else{
      document.getElementById("msmSeleccionar").style.display = "inline";
      document.getElementById("indicacion").style.display = "none";
    }
}

function validar2()
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

    if (validoP && validoA && document.getElementById("materiaSelect").value != 'default') {
      $("#btnCargarForm").click();
    }else{
      document.getElementById("msmSeleccionar").style.display = "inline";
      document.getElementById("indicacion").style.display = "none";
      document.getElementById("formClasificacion").reset();
    }
}
                      /*js para pagina de estadisticas*/


//borrar cambios al cargar y cambiar la pagina
function resetearpagina(){
deshabilitar(form1);  
form1.año[0].checked=false;
form1.año[1].checked=false;
}
//fin de reseteo de pagina                      
function Activar1(form){//primer radio de año
habilitar(form);
ocultarselecaño();
limpiarradios(form);
limpiarcajas();
}
function ocultarselecaño(){
lab=document.getElementById('labelselect');
lab.style.display='none';
sel=document.getElementById('selecdea');
sel.style.display='none'; 
}
function Activar2(form){//segundo radio de año
deshabilitar(form);
lab=document.getElementById('labelselect');
lab.style.display='';
sel=document.getElementById('selecdea');
sel.style.display='';
sel.value="Elija el año";
}
function habilitaradiosperiodo(){//onchange de select de años
var opcion=document.getElementById('selecdea').value;
if (opcion=="Elija el año") {
deshabilitar(form1);
}
else {
  habilitar(form1);
  if (form1.periodo[0].checked==true) {
    imprimirencaja(0,""," todos los periodos",0);
  }
  if (form1.periodo[1].checked==true) {
    var seleca=form1.selectperiodo.value;
    imprimirencaja(0,"",seleca,0);
  }
  if (form1.periodo[2].checked==true) {
    imprimirencaja(0,"","anual",0);
  }
   }
}

function habilitar(form){ //habilita todos los radios
  for (var i = 0; i < form.periodo.length; i++) {
    form.periodo[i].disabled=false;
  }
  for (var i = 0; i < form.poblacion.length; i++) {
    form.poblacion[i].disabled=false;
  }
    for (var i = 0; i < form.nota.length; i++) {
    form.nota[i].disabled=false;
  }
}

function deshabilitar(form){//deshabilita radios de entrada
  for (var i = 0; i < form.periodo.length; i++) {
    form.periodo[i].disabled=true;
    form.periodo[i].checked=false;
  }
  for (var i = 0; i < form.poblacion.length; i++) {
    form.poblacion[i].disabled=true;
  }
    for (var i = 0; i < form.nota.length; i++) {
    form.nota[i].disabled=true;
  } 
  limpiarcajas();
  limpiarradios(form);
  deshabilitarselectperiodo();
  deshabilitarselectpoblacion1();
  deshabilitarselectpoblacion2();
}
function limpiarradios(form){
    for (var i = 0; i < form.periodo.length; i++) {
    form.periodo[i].checked=false;
  }
  for (var i = 0; i < form.poblacion.length; i++) {
    form.poblacion[i].checked=false;
  }
    for (var i = 0; i < form.nota.length; i++) {
    form.nota[i].checked=false;
  }
}


//acciones al elegir radios de periodo,poblacion y notas

    //acciones periodo

function acciontrims(){
limpiar1caja(0);
deshabilitarselectperiodo();
var caja=0;
imprimirencaja(caja,"Año actual, todos los periodos"," todos los periodos",0);
}

function habilitarselperiodo(){
limpiar1caja(0);
  form1.selectperiodo.value="Elija trimestre";
sel=document.getElementById('selectperiodo');
sel.style.display=''; 
}

function accionanual(){
limpiar1caja(0);
deshabilitarselectperiodo();
var caja=0;
imprimirencaja(caja,"Año actual, anual","anual",0);
}

function cambioselectrim(){
var opcion=document.getElementById('selectperiodo').value;
if (opcion=="Elija trimestre") {
limpiar1caja(0);
}
else {
    var seleca=form1.selectperiodo.value;
    imprimirencaja(0,"Año actual, "+seleca,seleca,0);
   }
}
function limpiar1caja(i){
  form1.cajas[i].value="";
}

function limpiarcajas(){
  for (var i = 0; i < form1.cajas.length; i++) {
    form1.cajas[i].value="";
  }
}

function imprimirencaja(caja,mensaje1,mensaje2,tipo){
if (form1.año[0].checked==true) {
  form1.cajas[caja].value=mensaje1;
}
else {
  var año=form1.selecdea.value;
  if (tipo==0) {
    form1.cajas[caja].value="Año "+año+", "+mensaje2;   
  }
  if (tipo==1) {
    form1.cajas[caja].value=mensaje2; 
  }

}
}

function deshabilitarselectperiodo(){
sel=document.getElementById('selectperiodo');
sel.style.display='none'; 
}
//acciones poblacion
function accionestodas(){
limpiar1caja(1);
deshabilitarselectpoblacion2();
deshabilitarselectpoblacion1();
mensaje="Todas las secciones";
imprimirencaja(1,mensaje,mensaje,1);
}
function accionesec(){
limpiar1caja(1);
form1.selectpoblacion1.value="Elija seccion";
deshabilitarselectpoblacion2();
habilitarselectpoblacion1();
}

function cambioselectpobl1(){
var opcion=document.getElementById('selectpoblacion1');
mensaje="Sección "+opcion.value;
if (opcion.value=="Elija seccion") {
limpiar1caja(1);
}
else {
    imprimirencaja(1,mensaje,mensaje,1);
   }
}

function accionestodosb(){
limpiar1caja(1);
deshabilitarselectpoblacion2();
deshabilitarselectpoblacion1();
mensaje="Todos los bachilleratos";
imprimirencaja(1,mensaje,mensaje,1);
}
function accionesbach(){
limpiar1caja(1);
form1.selectpoblacion2.value="Elija bachillerato";
habilitarselectpoblacion2();
deshabilitarselectpoblacion1(); 
}

function cambioselectpobl2(){
var opcion=document.getElementById('selectpoblacion2');
mensaje="Bachillerato "+opcion.value
if (opcion.value=="Elija bachillerato") {
limpiar1caja(1);
}
else {
    imprimirencaja(1,mensaje,mensaje,1);
   }
}

function deshabilitarselectpoblacion1(){
sel=document.getElementById('selectpoblacion1');
sel.style.display='none'; 
}
function deshabilitarselectpoblacion2(){
sel=document.getElementById('selectpoblacion2');
sel.style.display='none'; 
}
function habilitarselectpoblacion1(){
sel=document.getElementById('selectpoblacion1');
sel.style.display=''; 
}
function habilitarselectpoblacion2(){
sel=document.getElementById('selectpoblacion2');
sel.style.display=''; 
}
//acciones notas
function accionespromedio(){
limpiar1caja(2);
mensaje="Promedios globales";
imprimirencaja(2,mensaje,mensaje,1);
}

function accionesmateria(){
limpiar1caja(2);
mensaje="Promedios de cada materia";
imprimirencaja(2,mensaje,mensaje,1);
}
//fin acciones

                      /*fin de pagina de estadisticas*/

jQuery(function($){
  // Definimos las mascaras para cada input 
  $("#id_dui_docente").mask("99999999-9");
  $("#id_telefono_docente").mask("9999-9999");  
});

function AnotacionDesactivar(){
var c1=document.getElementById("1");
c1.disabled = false;
//var c2=document.getElementById("dui");
//2.disabled = false;
var c3=document.getElementById("3");
c3.disabled = false;
var c4=document.getElementById("4");
c4.disabled = false;
var c5=document.getElementById("btnConsultar");
c5.disabled = true;
var c6=document.getElementById("nie");
c6.disabled = true;
var c7=document.getElementById("btnAgregar");
c7.disabled = true;
var c8=document.getElementById("btnGuardar");
c8.disabled = false;


function anotacionNie(nie)
{
	
//var c6 document.getElementById('nie').value;
document.getElementById('nie').value=nie;

}



}