from django.shortcuts import render, redirect
from django.views.generic import TemplateView,ListView,CreateView,DeleteView,UpdateView,DetailView
from django.contrib.auth.models import User,BaseUserManager
from apps.INTO.forms import *
from django.urls import reverse_lazy,reverse
from django.http import HttpResponse,HttpResponseRedirect
from apps.INTO.models import *
from decimal import Decimal
from django.core import serializers
from django.contrib import messages
from datetime import date
import json
# Create your views here.
import time
#vista basada en funcion para los formularios
def creardocente(request):
	#si el metodo es POST Hacer esto
	if request.method=='POST':
		#Resivimos todos los parametros del formulario
		form1=DocenteForm(request.POST)
		#si el formulario es Valido hacer lo siguiente 
		if form1.is_valid():
			#Hacemos la creacion de los objetos 
			usuario=User()
			docente=Docente()
			tipodeusuario=asignacionTipoUsuario()

			#Logicadeguardado
			#Asignammos a cada objeto de tipo docente lo que resivimos de cada campo del formulario
			docente.dui_docente=request.POST['dui_docente']
			docente.nombre_docente=request.POST['nombre_docente']
			docente.apellidos_docente=request.POST['apellidos_docente']
			docente.fecha_nacimiento_docente=request.POST['fecha_nacimiento_docente']
			docente.telefono_docente=request.POST['telefono_docente']
			docente.email_docente=request.POST['email_docente']
			docente.fecha_contratacion_docente=request.POST['fecha_contratacion_docente']
			docente.direccion_docente=request.POST['direccion_docente']

			#Crear el Usuario
			concac1=str(docente.nombre_docente).upper()
			concac1=concac1[0]			
			concac2=str(docente.apellidos_docente).upper()
			concac2=concac2[0]
			concac3=str(docente.dui_docente)
			concac3=concac3[0:4]
			nombredeusuario=concac1+concac2+concac3
			#asignamos a los objetos de tipo usuario los datos necesarios para la creacion
			usuario.username=nombredeusuario
			usuario.first_name=docente.nombre_docente
			usuario.last_name=docente.apellidos_docente
			usuario.email=docente.email_docente
			usuario.is_staff=True
			#Creamos la contraseña
			algorit1=str(docente.apellidos_docente)
			algorit1=algorit1.split(maxsplit = 1)
			algorit1=algorit1[0]
			algorit1=algorit1.lower()
			clave=algorit1+nombredeusuario			
			usuario.set_password(clave)
			#Guardamos el usuario para luego traer su id
			usuario.save()	
			#Hacemos una consulta a la tabla user del username(nombre del docente)		
			id_docente = User.objects.get(username=str(nombredeusuario))	
			#Hacemos una consulta a la tabla de tipos de usuario para traer el de tipo docente
			id_tipo_usuario = TipoUsuario.objects.get(codigo_tipo_usuario="docente")
			#Asignamos el id del cocente de la tabla user para ponero en la tabla de tipo decente
			docente.usuario_docente=id_docente
			#Guardamos el docente 
			docente.save()	
			#Asignamos el tipo de usuario para la tabla tipo de usuario		
			tipodeusuario.tipo_usuario=id_tipo_usuario
			tipodeusuario.usuario=id_docente
			tipodeusuario.save()						
		return redirect('docentes-list')
	else:
		#muestra el formulario
		form1=DocenteForm()
		contexto={'form1':form1}		
	return render(request,'docentes/edit_docente.html',contexto)

def docente_delete(request,id_del_docente):
	docente = Docente.objects.get(dui_docente=id_del_docente)
	usuario= User.objects.get(id=str(docente.usuario_docente_id))
	tipoUsuario=asignacionTipoUsuario.objects.get(usuario_id=usuario.pk)
	if request.method=='POST':
		docente.delete()
		usuario.delete()
		tipoUsuario.delete()
		return redirect('docentes-list')
	return render(request, 'docentes/docente_delete.html', {'docente':docente})

def docente_detalle(request,id_del_docente):
	docente = Docente.objects.get(dui_docente=id_del_docente)
	return render(request, 'docentes/detalle_docente.html', {'docente':docente})

def docente_edit(request,id_del_docente):
	docente = Docente.objects.get(dui_docente=id_del_docente)
	usuario= User.objects.get(id=str(docente.usuario_docente_id))
	if request.method == 'GET':
		form = DocenteForm(instance=docente)
	else:
		form = DocenteForm(request.POST, instance=docente)
		if form.is_valid():
			docente.dui_docente=request.POST['dui_docente']
			docente.nombre_docente=request.POST['nombre_docente']
			docente.apellidos_docente=request.POST['apellidos_docente']
			docente.fecha_nacimiento_docente=request.POST['fecha_nacimiento_docente']
			docente.telefono_docente=request.POST['telefono_docente']
			docente.email_docente=request.POST['email_docente']
			docente.fecha_contratacion_docente=request.POST['fecha_contratacion_docente']
			docente.direccion_docente=request.POST['direccion_docente']
			#Modificamos el usuario
			concac1=str(docente.nombre_docente).upper()
			concac1=concac1[0]			
			concac2=str(docente.apellidos_docente).upper()
			concac2=concac2[0]
			concac3=str(docente.dui_docente)
			concac3=concac3[0:4]
			nombredeusuario=concac1+concac2+concac3

			usuario.username=nombredeusuario
			usuario.first_name=docente.nombre_docente
			usuario.last_name=docente.apellidos_docente
			usuario.email=docente.email_docente
			usuario.is_staff=True
			#Reseteamos la contraseña porDefecto
			algorit1=str(docente.apellidos_docente)
			algorit1=algorit1.split(maxsplit = 1)
			algorit1=algorit1[0]
			algorit1=algorit1.lower()
			clave=algorit1+nombredeusuario			
			usuario.set_password(clave)		
			docente.save()
			usuario.save()			
		return redirect('docentes-list')
	return render(request,'docentes/docente_form.html',{'form':form})


#Parte de Alumnos(Diego)
class ListadoAlumnos(TemplateView):
	template_name="Alumnos/list_alumnos.html"


class CrearGrado(TemplateView):	
	def post(self, request, *args, **kwargs):
		grado=Grupo()
		secciones=("A","B","C","D","E","F")	
		grado.nivel_especialidad=request.POST['nivel_especialidad']
		cod_especialidad=request.POST['codigo_especialidad']
		grado.codigo_especialidad=Especialidad.objects.get(codigo_especialidad=cod_especialidad)
		docente_encargado=request.POST['codigo_docente_encargado']
		id_docente=User.objects.get(username=docente_encargado)
		docente =Docente.objects.get(usuario_docente=id_docente)
		grado.codigo_docente_encargado=docente
		año=int(time.strftime("%Y"))
		seccion=""
		"""
		voy a filtrar por nivel_especialidad(Primero,segundo o tercer año)
		,tambien filtra paralelamente por codigo_especialidad(para traer los de una misma especialidad)
		y de manera tambien paralela verifica por año en el cual se creo el grupo
		"""
		obtener_seccion=Grupo.objects.filter(nivel_especialidad=str(grado.nivel_especialidad),codigo_especialidad=str(cod_especialidad),anio=año)
		i=0
		for iteracion in obtener_seccion:
			i=i+1

		if(i==0):
			seccion=secciones[i]
		else:
			seccion=secciones[i]

		
		grado.anio=año
		grado.seccion=seccion
		algorit1=str(grado.nivel_especialidad)
		algorit2=seccion
		algorit3=cod_especialidad
		algoritTotal=algorit1+algorit2+algorit3
		grado.codigo_grupo=algoritTotal
		#print("Codigo "+algoritTotal)
		grado.save()
		
		return redirect('alumno_list')
	def get(self,request,*args,**kwargs):				
		docente=Docente.objects.all()
		contexto={'docente':docente}
		return render(request,"Alumnos/crear_grado.html",contexto)
#Vistas Para retornar los objetos JSON
from django.core import serializers
from django.http import HttpResponse
class BusquedaEspecialidad(TemplateView):
    def get(self,request,*args,**kwargs):
        nivel_especialidad = request.GET['nivel']        
        especialidad=Especialidad.objects.filter(anios_especialidad__gte=nivel_especialidad)              
        data = serializers.serialize('json',especialidad)
        return HttpResponse(data, content_type='application/json')

class BusquedaSeccion(TemplateView):
    def get(self,request,*args,**kwargs):
    	nivel = request.GET['nivel']
    	especialidad = request.GET['especialidad']
    	grupo = Grupo.objects.filter(nivel_especialidad=nivel, codigo_especialidad=especialidad)
    	data = serializers.serialize('json',grupo)
    	return HttpResponse(data, content_type='application/json')

class BusquedaDocente(TemplateView):
	def get(self,request,*args,**kwargs):
		nivel = request.GET['nivel']
		especialidad = request.GET['especialidad']
		seccion =request.GET['seccion']
		dui_docente_encargado=""
		
		grupo_docente =Grupo.objects.filter(nivel_especialidad=nivel, codigo_especialidad=especialidad,codigo_grupo=seccion)
		for share in grupo_docente:
			dui_docente_encargado=share.codigo_docente_encargado.dui_docente
		docente=Docente.objects.filter(dui_docente=dui_docente_encargado)
		data = serializers.serialize('json',docente)

		return HttpResponse(data, content_type='application/json')

class BusquedaGrupo(TemplateView):
	def get(self,request,*args,**kwargs):
		nivel = request.GET['nivel']
		especialidad = request.GET['especialidad']
		seccion =request.GET['seccion']		
		grupo_docente =Grupo.objects.filter(nivel_especialidad=nivel, codigo_especialidad=especialidad,codigo_grupo=seccion)
		data = serializers.serialize('json',grupo_docente)
		return HttpResponse(data, content_type='application/json')
class RegistroAlumno(TemplateView):
	def post(self,request,*args,**kwargs):
		alumno=Alumno()
		encargado=Encargado()
		usuario=User()
		alumnoGrupo=Alumno_Grupo()
		tipodeusuario=asignacionTipoUsuario()
		#Resivimos los datos que vienen del post
		#Codigo de Grupo
		codigo_grupo=request.POST['grupo']
		#Datos del Alumno y los asignamos al objeto
		alumno.nie=request.POST['nie']		
		alumno.nombre_alumno=request.POST['nombre_alumno']
		alumno.apellidos_alumno=request.POST['apellidos_alumno']
		alumno.sexo_alumno=request.POST['sexo_alumno']
		alumno.fecha_nacimiento_alumno=time.strftime("%Y-%m-%d")
		alumno.telefono_alumno=request.POST['telefono_alumno']
		alumno.direccion_alumno=request.POST['direccion_alumno']
		alumno.anio_ingreso=time.strftime("%Y-%m-%d")
		especialidad=Especialidad.objects.get(codigo_especialidad=request.POST['especialidad'])
		alumno.especialidad_alumno=especialidad
		#Resivimos los datos del Encargado
		encargado.dui_encargado=request.POST['dui_encargado']
		encargado.nombre_encargado=request.POST['nombre_encargado']
		encargado.apellidos_encargado=request.POST['apellidos_encargado']
		encargado.telefono=request.POST['telefono_encargado']
		encargado.celular=request.POST['celular_encargado']
		encargado.parentesco=request.POST['parentesco']
		existencia_alumno=Alumno.objects.filter(nie=alumno.nie)
		print(existencia_alumno.exists())
		#Guardamos el encargado primero porque lo necesitamos para el alumno
		if(existencia_alumno.exists()==True):
			for x in Encargado.objects.filter(dui_encargado=str(encargado.dui_encargado)):
				x.nombre_encargado=encargado.nombre_encargado
				x.apellidos_encargado=encargado.apellidos_encargado
				x.telefono=encargado.telefono
				x.celular=encargado.celular
				x.save()
			for y in Alumno.objects.filter(nie=alumno.nie):
				y.nombre_alumno=alumno.nombre_alumno
				y.apellidos_alumno=alumno.apellidos_alumno
				y.direccion_alumno=alumno.direccion_alumno
				y.telefono_alumno=alumno.telefono_alumno
				y.save()
			for z in User.objects.filter(username=alumno.nie):
				z.first_name=alumno.nombre_alumno
				z.last_name=alumno.apellidos_alumno
				z.save()		
		
		else:
			encargado.save()
			encargado_alumno=Encargado.objects.get(dui_encargado=encargado.dui_encargado)
			alumno.encargado=encargado_alumno

			#Ahora Guardamos el usuario igual se necesita para guardar el alumno
			usuario.username=alumno.nie
			usuario.first_name=alumno.nombre_alumno
			usuario.last_name=alumno.apellidos_alumno
			usuario.email=""
			usuario.is_staff=False
			usuario.set_password("administrador10")
			usuario.save()
			usuario_alumno=User.objects.get(username=str(usuario.username))
			alumno.usuario_alumno=usuario_alumno
			alumno.save()
			alumno_nie=Alumno.objects.get(nie=alumno.nie)
			alumno_grupo=Grupo.objects.get(codigo_grupo=codigo_grupo)
			alumnoGrupo.nie=alumno_nie
			alumnoGrupo.codigo_grupo=alumno_grupo
			alumnoGrupo.save();
			
			#Hacemos una consulta a la tabla de tipos de usuario para traer el de tipo docente
			id_tipo_usuario = TipoUsuario.objects.get(codigo_tipo_usuario="alumno")
			tipodeusuario.tipo_usuario=id_tipo_usuario
			tipodeusuario.usuario=usuario_alumno		
			tipodeusuario.save()

		
		alumnosTotales=[]
		alumno=Alumno_Grupo.objects.filter(codigo_grupo=codigo_grupo)
		for x in alumno:
			alumnosTotales.append(Alumno.objects.get(nie=x.nie.nie))		
		data = serializers.serialize('json',alumnosTotales)
		return HttpResponse(data, content_type='application/json')

class BusquedaAlumno(TemplateView):
	def get(self,request,*args,**kwargs):
		nivel = request.GET['nivel']
		especialidad = request.GET['especialidad']
		seccion =request.GET['seccion']		
		grupo_docente =Grupo.objects.filter(nivel_especialidad=nivel, codigo_especialidad=especialidad,codigo_grupo=seccion)
		grupo=""
		for x in grupo_docente:
			grupo=x.codigo_grupo		
		alumnos4=[]
		alumno=Alumno_Grupo.objects.filter(codigo_grupo=str(grupo))
		for x in alumno:
			alumnos4.append(Alumno.objects.get(nie=x.nie.nie))		
		data = serializers.serialize('json',alumnos4)
		return HttpResponse(data, content_type='application/json')

class BusquedaDuiEncargado(TemplateView):
	def get(self,request,*args,**kwargs):		
		dui_encargado=request.GET['search']
		dui=Encargado.objects.filter(dui_encargado__contains=dui_encargado)
		data=serializers.serialize('json',dui)
		return HttpResponse(data,content_type='application/json')

class BusquedaEncargado(TemplateView):
 	def get(self,request,*args,**kwargs):
 		dui_encargado=request.GET['dui_encargado']
 		dui=Encargado.objects.filter(dui_encargado__contains=dui_encargado)
 		data=serializers.serialize('json',dui)
 		return HttpResponse(data,content_type='application/json')
class AlumnoUpdate(TemplateView):
	def get(self,request,*args,**kwargs):
		nie=request.GET['nie']
		alumno=Alumno.objects.filter(nie=nie)
		data=serializers.serialize('json',alumno)		
		return HttpResponse(data,content_type='application/json')
class EncargadoUpdate(TemplateView):
	def get(self,request,*args,**kwargs):
		nie=request.GET['nie']
		alumno=Alumno.objects.get(nie=nie)
		
		encargado=Encargado.objects.filter(dui_encargado=alumno.encargado.dui_encargado)
		
		data=serializers.serialize('json',encargado)
		return HttpResponse(data,content_type='application/json')


def delete_alumno(request,nie):
	alumno = Alumno.objects.get(nie=nie)
	usuario= User.objects.get(username=str(alumno.usuario_alumno))
	tipoUsuario=asignacionTipoUsuario.objects.get(usuario_id=usuario.pk)

	if request.method=='POST':
		alumno.delete()
		usuario.delete()
		tipoUsuario.delete()
		return redirect('alumno_list')
	return render(request, 'Alumnos/alumno_delete.html', {'alumno':alumno})

def alumno_detalle(request,nie):
	alumno = Alumno.objects.get(nie=nie)
	return render(request, 'Alumnos/detalle_alumno.html', {'alumno':alumno})
#Finalizacion de el retorno de objetos JSON
#Finalizacion de la parte de alumnos
class Vista(TemplateView):
	template_name='base/base.html'

class ListDocentesAdmin(ListView):
	model=Docente
	second_model=User
	template_name='docentes/docentes_list.html'

class IngresarNotas(TemplateView):
	template_name='IngresarNotas/ingresarNotas.html'

def DatosEstadisticos(request):
	años=[2015,2016,2017]
	periodos=["trimestre1","trimestre2","trimestre3","trimestre4"]
	secciones=["1°A","1°B","1°C","1°D","2°A","2°B"]
	bachilleratos=["General","Contador","Electronica"]
	contexto={'años':años,'periodos':periodos,'secciones':secciones,'bachilleratos':bachilleratos}
	return render(request,'estadisticas/estadisticas.html',contexto)


def anotacion(request):	
	if  request.user.is_superuser or not request.user.is_staff:
		return HttpResponse('Acceso denegado')
		pass
	nombre = ""
	AlumnoNie = ""	
	AlumnoDato	= Alumno()
	AnotacionDato = Anotacion()
	Anot = []
	An = []
	codigoGrupo = ""
	AlumnoGrupo = []
	GrupoE= Grupo()
	codigoDocente = ""
	idUser = request.user.id
	duiDocente = ""
	docente = Docente()
	mensaje = ""
	identificador = 0
	
	if request.method == 'POST':
		form = AnotacionForm(request.POST)
		if 'btnConsultar' in request.POST:
			AlumnoNie = request.POST.get('inputNie')
			
			AlumnoGrupo = Alumno_Grupo.objects.filter(nie=AlumnoNie)
			print(AlumnoNie)
			print(AlumnoGrupo)
			if len(AlumnoGrupo) == 0:
				AlumnoGrupo = None
				mensaje = "El nie ingresado no existe"
				AlumnoNie = ""
				print(mensaje)
				pass
			else:
				print("")		
				
				if AlumnoGrupo:
					for c in AlumnoGrupo:
						codigoGrupo = c.codigo_grupo_id
					print(codigoGrupo)
					GrupoE = Grupo.objects.get(codigo_grupo=codigoGrupo)
					codigoDocente = GrupoE.codigo_docente_encargado_id
					docente = Docente.objects.get(usuario_docente_id=idUser)
					dui_docente = docente.dui_docente
					print(codigoDocente)
					print(len(codigoDocente))
					print(dui_docente)
					if codigoDocente == dui_docente:
						print(dui_docente)
						try:
			   				AlumnoDato = Alumno.objects.get(nie=AlumnoNie)
			   				Anot=Anotacion.objects.filter(nie_id=AlumnoNie)
			   				nombre = AlumnoDato.nombre_alumno + " "+ AlumnoDato.apellidos_alumno
			   				print(nombre)
						except Alumno.DoesNotExist:
			   				AlumnoDato = None
			   				AlumnoNie = ""	
			   				pass
					else:
						mensaje = "Usted no es docente del alumno ingresado"
						AlumnoNie = ""
						print(mensaje)
		print(mensaje)		
		if 'btnGuardar' in request.POST:
			An = Anotacion.objects.all()
			for c in An:
				identificador = c.id

			AlumnoNie = request.POST.get('nie')
			print(AlumnoNie)
			AlumnoGrupo = Alumno_Grupo.objects.filter(nie=AlumnoNie)		
			for c in AlumnoGrupo:
				codigoGrupo = c.codigo_grupo_id
			print(codigoGrupo)					
			GrupoE = Grupo.objects.get(codigo_grupo=codigoGrupo)
			codigoDocente = GrupoE.codigo_docente_encargado_id
			docente = Docente.objects.get(usuario_docente_id=idUser)
			dui_docente = docente.dui_docente
			if codigoDocente == dui_docente:
				if form.is_valid():

					anotacionFinal = Anotacion()
					doc = Docente()
					alu = Alumno()
					ni = request.POST.get('nie')
					alu = Alumno.objects.get(nie=ni)
					doc = Docente.objects.get(dui_docente=dui_docente)
					anotacionFinal.nie = alu
					anotacionFinal.dui_docente = doc
					anotacionFinal.descripcion = request.POST.get('descripcion')
					anotacionFinal.fecha_anotacion = date.today()
					anotacionFinal.id = int(identificador)+1
					anotacionFinal.save()	
			else:
				mensaje = "Usted no es docente del alumno ingresado"
			pass	
			
			return redirect('Anotacion')
	else:
		form = AnotacionForm()	
		
		
			
		
			
			
	

	return render(request, 'AgregarAnotacion/AgregarAnotacion.html',
		{'form':form,
		'AlumnoNie':AlumnoNie,
		 'nombre': nombre,
		 'Anot':Anot,
		 'mensaje' : mensaje,
		 
		 
		})



	
def administrarNotas(request):	
	if not request.user.is_superuser or not request.user.is_staff:
		return HttpResponse('Acceso denegado')
		pass
	docente = Docente.objects.all()		
	alumnos = []
	evaluacion = []
	noAlumnos = ""
	exitoGuardar = ""
	cal = []

	if 'btnCargarAlumnos' in request.GET:
		grupos = Grupo.objects.all()
		alumnos_grupo = []
		evaluacion = Evaluacion.objects.get(codigo_evaluacion = request.GET['txtCodigoEvaluado'])
		i = 0
		for x in grupos:
			if x.codigo_grupo in request.GET:
				if request.GET[x.codigo_grupo] == 'on':
					alumnos_grupo.append(Alumno_Grupo.objects.filter(codigo_grupo=x.codigo_grupo))
					for y in alumnos_grupo[i]:

						if Calificacion.objects.filter(nie =y.nie, codigo_evaluacion=evaluacion).exists():
							alumnos.append(Alumno.objects.get(nie = y.nie.nie))							
							cal.append(Calificacion.objects.get(nie =y.nie, codigo_evaluacion=evaluacion))
							pass

						pass
					i = i + 1
					pass
				pass				
			pass		
		pass
		if alumnos == []:
			noAlumnos = "No se han encontrado alumnos con nota en esta evaluacion."
			pass	

	if 'btnGuardar' in request.POST:
		alumnosAll = Alumno.objects.all()

	
		for x in alumnosAll:
			if str(x.nie) in request.POST:
				eva = Evaluacion.objects.get(codigo_evaluacion=request.POST['codigoEva'])
				nota = request.POST[x.nie]
				if nota != "":
					notaf = Decimal(nota)
					c = Calificacion.objects.get(nie = x, codigo_evaluacion_id=request.POST['codigoEva'])
					c.nota = notaf 
					c.save()
				alumnos = []
				evaluacion = []
				pass
		exitoGuardar = "Las calificaciones se han guardado de manera exitosa!"
		
	contexto = {'cal':cal,'docente':docente, 'alumnos':alumnos, 'evaluacion':evaluacion, 'noAlumnos':noAlumnos, 'exitoGuardar':exitoGuardar}
	return render(request,'administrarNotas/administrarNotas.html',contexto)


def buscarMaterias(request):
	if not request.user.is_superuser or not request.user.is_staff:
		return HttpResponse('Acceso denegado')
		pass
	if request.GET['accion'] == 'obtenerMateriasDocente':
		materias = []
		dui_docente = request.GET['dui_docente']		
		indice = 0
		dui = ""		
		codigo = ""
		while indice < 10:
		    dui = dui_docente[indice]
		    codigo += dui 
		    if dui:
		    	print (dui)
		    indice += 1
		materiasImpartidas = Docente_Materia.objects.filter(codigo_docente = str(codigo))
		print(materiasImpartidas)
		for x in materiasImpartidas:
			codigo_materia = x.codigo_materia_id
			materia = Materia.objects.get(codigo_materia = codigo_materia)
			materias.append(materia)
			pass		
		data = serializers.serialize('json', materias)
		return HttpResponse(data, content_type = 'application/json')		
		pass

def buscarEvaluaciones(request):
	if not request.user.is_superuser or not request.user.is_staff:
		return HttpResponse('Acceso denegado')
		pass
	if request.GET['accion'] == 'obtenerEvaluaciones':

		anioLectivos = AnioLectivo.objects.all().order_by('anio_lectivo')
		for x in anioLectivos:
			if not x.terminado:
				anioLectivo = x
				pass
				break
			pass
		periodos = Periodo.objects.filter(anio_lectivo = anioLectivo, finalizado = False)
		codigo_materia = request.GET['codigo_materia']
		dui_docente = request.GET['dui_docente']		
		indice = 0
		dui = ""		
		codigo = ""
		while indice < 10:
		    dui = dui_docente[indice]
		    codigo += dui 
		    if dui:
		    	print (dui)
		    indice += 1
		materia = Materia.objects.get(codigo_materia = codigo_materia)
		docente = Docente.objects.get(dui_docente=codigo)
		docente_materia = Docente_Materia.objects.get(codigo_docente = docente, codigo_materia = materia)
		print(docente_materia)
		evaluaciones = []

		for periodo in periodos:
			actividades = Actividad.objects.filter(codigo_periodo = periodo)

			for actividad in actividades:
				subactividades = Sub_Actividad.objects.filter(codigo_actividad = actividad)
				
				for subactividad in subactividades:
					if Evaluacion.objects.filter(codigo_sub_actividad = subactividad, codigo_docente_materia = docente_materia).exists():
						evaluacion = Evaluacion.objects.get(codigo_sub_actividad = subactividad, codigo_docente_materia = docente_materia)
						evaluaciones.append(evaluacion)
						pass 
					pass
				pass
			pass

		data = serializers.serialize('json', evaluaciones)
		return HttpResponse(data, content_type = 'application/json')
		pass
	
	elif request.GET['accion'] == 'obtenerGrupos':
		dui_docente = request.GET['dui_docente']		
		indice = 0
		dui = ""		
		codigo = ""
		while indice < 10:
		    dui = dui_docente[indice]
		    codigo += dui 
		    if dui:
		    	print (dui)
		    indice += 1
		codigo_materia = request.GET['codigo_materia']
		materia = Materia.objects.get(codigo_materia = codigo_materia)
		docente = Docente.objects.get(dui_docente=codigo)
		docente_materia = Docente_Materia.objects.get(codigo_docente = docente, codigo_materia = materia)
		docente_materia_grupos = Docente_Materia_Grupo.objects.filter(docente_materia = docente_materia)
		grupos = []
		for docente_materia_grupo in docente_materia_grupos:
			grupos.append(docente_materia_grupo.grupo)
			pass
		data = serializers.serialize('json', grupos)
		
		return HttpResponse(data, content_type = 'application/json')
		pass



class MateriaList(ListView):
	model = Materia
	template_name = 'administrarMaterias/administrarMaterias.html'
	ordering = ['codigo_materia']

#def MateriaList(request):
#	materias = Materia.objects.all()
#	contexto = {'materias':materias}
#	return render(request, 'administrarMaterias/administrarMaterias.html', contexto)

def CargarGrupos(request):

	grupos = []
	if 'codigo_materia' in request.GET:
		materia = Materia.objects.get(codigo_materia = request.GET['codigo_materia'])
		especialidades_materia = Especialidad_Materia.objects.filter(codigo_materia = materia)
		for especialidad_materia in especialidades_materia:
			if Grupo.objects.filter(codigo_especialidad = especialidad_materia.codigo_especialidad, nivel_especialidad = especialidad_materia.nivel_materia_especialidad).exists():
				grupos_filtrados = Grupo.objects.filter(codigo_especialidad = especialidad_materia.codigo_especialidad, nivel_especialidad = especialidad_materia.nivel_materia_especialidad)
				for grupo in grupos_filtrados:
					docentes_materia = Docente_Materia.objects.filter(codigo_materia = materia)
					grupo_ya_asignado = False
					for docente_materia in docentes_materia:
						if Docente_Materia_Grupo.objects.filter(docente_materia = docente_materia, grupo = grupo).exists():
							grupo_ya_asignado = True
							break
							pass
						pass
					if not grupo_ya_asignado:
						grupos.append(grupo)
						pass
					pass
				pass
			pass
		pass
	if grupos == []:
		return HttpResponse({}, content_type='application/json')
		pass
	else:
		data = serializers.serialize('json', grupos)	
		return HttpResponse(data, content_type='application/json')
		pass

def materia_view(request):
	if not request.user.is_superuser or not request.user.is_staff:
		return HttpResponse('Acceso denegado')
		pass
	if 'guardarAsignaciones' in request.POST:
		docente = Docente.objects.get(dui_docente = request.POST['docente'])
		materia = Materia.objects.get(codigo_materia = request.POST['materia'])
		grupos = Grupo.objects.all()
		for grupo in grupos:
			if 'grupo_'+grupo.codigo_grupo in request.POST:
				if Docente_Materia.objects.exists():
					last_id = Docente_Materia.objects.all().order_by('-id')[:1][0].id
					docente_materia = Docente_Materia(id = last_id+1, codigo_docente = docente, codigo_materia = materia)
					docente_materia.save()
					last_id2 = Docente_Materia_Grupo.objects.all().order_by('-id')[:1][0].id
					docente_materia_grupo = Docente_Materia_Grupo(id = last_id2+1, docente_materia = docente_materia,grupo = grupo)
					docente_materia_grupo.save()
					pass
				else:
					docente_materia = Docente_Materia(codigo_docente = docente, codigo_materia = materia)
					docente_materia.save()
					docente_materia_grupo = Docente_Materia_Grupo(docente_materia = docente_materia,grupo = grupo)
					docente_materia_grupo.save()
				pass
			pass
		pass

		docentes = Docente.objects.all()
		contexto = {'docentes':	docentes, 'materia':materia}

	elif request.method=='POST':
		#Resivimos todos los parametros del formulario
		form=MateriaForm(request.POST)
		#si el formulario es Valido hacer lo siguiente 
		if form.is_valid():
			#Hacemos la creacion de los objetos 
			materia=Materia()
			docentes=Docente.objects.all()
			especialidades=Especialidad.objects.all()
			#Asignammos a cada objeto lo que resivimos de cada campo del formulario
			materia.codigo_materia=request.POST['codigo_materia']
			materia.nombre_materia=request.POST['nombre_materia']
			materia.descripcion_materia=request.POST['descripcion_materia']
			materia.objetivos=request.POST['objetivos']	
			#Guardamos  
			materia.save()

#			nivel = None
			esp = False
			for especialidad in especialidades:
				if especialidad.codigo_especialidad in request.POST:
					esp = True
					if request.POST[especialidad.codigo_especialidad] == '1_'+especialidad.codigo_especialidad:
						num = Especialidad_Materia.objects.all().order_by('-id')[:1][0].id
						especialidad_materia = Especialidad_Materia(id=num + 1,codigo_especialidad = especialidad, codigo_materia = materia, nivel_materia_especialidad = 1)
						especialidad_materia.save()
						pass
					if request.POST[especialidad.codigo_especialidad] == '2_'+especialidad.codigo_especialidad:
						num = Especialidad_Materia.objects.all().order_by('-id')[:1][0].id
						especialidad_materia = Especialidad_Materia(id=num + 1,codigo_especialidad = especialidad, codigo_materia = materia, nivel_materia_especialidad = 2)
						especialidad_materia.save()
						pass
					if request.POST[especialidad.codigo_especialidad] == '3_'+especialidad.codigo_especialidad:
						num = Especialidad_Materia.objects.all().order_by('-id')[:1][0].id
						especialidad_materia = Especialidad_Materia(id=num + 1,codigo_especialidad = especialidad, codigo_materia = materia, nivel_materia_especialidad = 3)
						especialidad_materia.save()
						pass
					pass
				pass
			
			if esp:
				contexto = {'docentes':	docentes, 'materia':materia}
				pass
			else:
				return redirect('/into/administrarMaterias')
				pass
	else:
		#muestra el formulario
		form=MateriaForm()
		especialidad=Especialidad.objects.all().order_by('-anios_especialidad')
		contexto={'form':form,'especialidad':especialidad}

	return render(request,'administrarMaterias/agregarMateria.html',contexto)

def materia_edit(request, codigo_materia):
	if not request.user.is_superuser or not request.user.is_staff:
		return HttpResponse('Acceso denegado')
		pass

	materia = Materia.objects.get(pk=codigo_materia)
	if 'guardarAsignaciones' in request.POST:
		docente = Docente.objects.get(dui_docente = request.POST['docente'])
		materia = Materia.objects.get(codigo_materia = request.POST['materia'])
		grupos = Grupo.objects.all()
		for grupo in grupos:
			if 'grupo_'+grupo.codigo_grupo in request.POST:
				last_id = Docente_Materia.objects.all().order_by('-id')[:1][0].id
				docente_materia = Docente_Materia(id = last_id+1, codigo_docente = docente, codigo_materia = materia)
				docente_materia.save()
				last_id2 = Docente_Materia_Grupo.objects.all().order_by('-id')[:1][0].id
				docente_materia_grupo = Docente_Materia_Grupo(id = last_id2+1, docente_materia = docente_materia,grupo = grupo)
				docente_materia_grupo.save()
				pass
			pass
		pass

		docentes = Docente.objects.all()
		contexto = {'docentes':	docentes, 'materia':materia}
	elif request.method == 'GET':
		form = MateriaForm(instance=materia)
		especialidad=Especialidad.objects.all().order_by('-anios_especialidad')	
		contexto={'form':form,'especialidad':especialidad,'materia':materia}
	else:
		form = MateriaForm(request.POST, instance=materia)
		if form.is_valid():
			form.save()
			especialidades=Especialidad.objects.all().order_by('-anios_especialidad')
			for especialidad in especialidades:
				if especialidad.codigo_especialidad in request.POST:
					if Especialidad_Materia.objects.filter(codigo_materia = materia.codigo_materia).exists():
						especialidad_Materia_filtradas = Especialidad_Materia.objects.filter(codigo_materia = materia.codigo_materia)
						for esp_mat_filt in especialidad_Materia_filtradas:
							esp_eliminar = Especialidad_Materia.objects.get(codigo_especialidad=esp_mat_filt.codigo_especialidad,codigo_materia = esp_mat_filt.codigo_materia, nivel_materia_especialidad=esp_mat_filt.nivel_materia_especialidad)
							esp_eliminar.delete()
							pass
						pass
					pass
				pass
			esp = False
			for especialidad in especialidades:
				if especialidad.codigo_especialidad in request.POST:
					esp = True
					if request.POST[especialidad.codigo_especialidad] == '1_'+especialidad.codigo_especialidad:
						num = Especialidad_Materia.objects.all().order_by('-id')[:1][0].id
						especialidad_materia = Especialidad_Materia(num + 1,codigo_especialidad = especialidad, codigo_materia = materia, nivel_materia_especialidad = 1)
						especialidad_materia.save()
						pass
					elif request.POST[especialidad.codigo_especialidad] == '2_'+especialidad.codigo_especialidad:
						num = Especialidad_Materia.objects.all().order_by('-id')[:1][0].id
						especialidad_materia = Especialidad_Materia(num + 1,codigo_especialidad = especialidad, codigo_materia = materia, nivel_materia_especialidad = 2)
						especialidad_materia.save()
						pass
					elif request.POST[especialidad.codigo_especialidad] == '3_'+especialidad.codigo_especialidad:
						num = Especialidad_Materia.objects.all().order_by('-id')[:1][0].id
						especialidad_materia = Especialidad_Materia(num + 1,codigo_especialidad = especialidad, codigo_materia = materia, nivel_materia_especialidad = 3)
						especialidad_materia.save()
						pass
					pass
				pass

			docentes=Docente.objects.all()
			contexto = {'docentes':	docentes, 'materia':materia}

			if esp:
				docentes=Docente.objects.all()
				if Docente_Materia.objects.filter(codigo_materia = materia.codigo_materia).exists():
					docente_materia_filtrados = Docente_Materia.objects.filter(codigo_materia = materia.codigo_materia)
					for doc_mat_filt in docente_materia_filtrados:
						var_temp = Docente_Materia.objects.filter(codigo_docente=doc_mat_filt.codigo_docente, codigo_materia=doc_mat_filt.codigo_materia)
						var_temp.delete()
						pass
					pass
				contexto = {'docentes':	docentes, 'materia':materia}
				pass
			else:
				return redirect('/into/administrarMaterias')
				pass
		"""return redirect('/into/administrarMaterias')"""
	return render(request,'administrarMaterias/editarMateria.html',contexto)

def materia_delete(request, codigo_materia):
	if not request.user.is_superuser or not request.user.is_staff:
		return HttpResponse('Acceso denegado')
		pass
	materia = Materia.objects.get(pk=codigo_materia)
	if request.method == 'POST':
		materia.delete()
		return redirect('/into/administrarMaterias')
	else:
		especialidades = []
		docentes = []
		grupos = []
		docentes_materia_grupos = []
		especial = Especialidad.objects.all()
		docent = Docente.objects.all()
		grup = Grupo.objects.all()
		materia = Materia.objects.get(pk=codigo_materia)
		docentes_materia = Docente_Materia.objects.filter(codigo_materia = materia)
		
		for esp in especial:
			if Especialidad_Materia.objects.filter(codigo_especialidad=esp.codigo_especialidad,codigo_materia=materia.codigo_materia).exists():
				especialidades.append(Especialidad.objects.get(codigo_especialidad = esp.codigo_especialidad))
				pass
			pass

		for doc in docent:
			if Docente_Materia.objects.filter(codigo_docente=doc.dui_docente,codigo_materia=materia.codigo_materia).exists():
				docentes.append(Docente.objects.get(dui_docente=doc.dui_docente))
				pass
			pass

		for doc_mat in docentes_materia:
			docentes_materia_grupos.append(Docente_Materia_Grupo.objects.get(docente_materia=doc_mat.id))
			pass

		for doc_mat_gru in docentes_materia_grupos:
			grupos.append(Grupo.objects.get(codigo_grupo=doc_mat_gru.grupo))
			pass

		contexto = {'especialidades':especialidades,'docentes':docentes,'grupos':grupos,'materia':materia}
	return render(request, 'administrarMaterias/eliminarMateria.html', contexto)

def materia_detalle(request, codigo_materia):
	if not request.user.is_superuser or not request.user.is_staff:
		return HttpResponse('Acceso denegado')
		pass
	especialidades = []
	docentes = []
	grupos = []
	docentes_materia_grupos = []
	especial = Especialidad.objects.all()
	docent = Docente.objects.all()
	grup = Grupo.objects.all()
	materia = Materia.objects.get(pk=codigo_materia)
	docentes_materia = Docente_Materia.objects.filter(codigo_materia = materia)
	
	for esp in especial:
		if Especialidad_Materia.objects.filter(codigo_especialidad=esp.codigo_especialidad,codigo_materia=materia.codigo_materia).exists():
			especialidades.append(Especialidad.objects.get(codigo_especialidad = esp.codigo_especialidad))
			pass
		pass

	for doc in docent:
		if Docente_Materia.objects.filter(codigo_docente=doc.dui_docente,codigo_materia=materia.codigo_materia).exists():
			docentes.append(Docente.objects.get(dui_docente=doc.dui_docente))
			pass
		pass

	for doc_mat in docentes_materia:
		docentes_materia_grupos.append(Docente_Materia_Grupo.objects.get(docente_materia=doc_mat.id))
		pass

	for doc_mat_gru in docentes_materia_grupos:
		grupos.append(Grupo.objects.get(codigo_grupo=doc_mat_gru.grupo))
		pass

	contexto = {'especialidades':especialidades,'docentes':docentes,'grupos':grupos,'materia':materia}

	return render(request, 'administrarMaterias/detalleMateria.html', contexto)

def IngresarNotas(request):

	#Docente
	if  request.user.is_superuser or not request.user.is_staff:
		return HttpResponse('Acceso denegado')
		pass

	id_docente = Docente.objects.get(usuario_docente=str(request.user.id)).dui_docente
	materiasImpartidas =  Docente_Materia.objects.filter(codigo_docente=id_docente)
	materias = []
	alumnos = []
	evaluacion = []
	noAlumnos = ""
	exitoGuardar = ""
	for x in materiasImpartidas:
		codigo_materia = x.codigo_materia.codigo_materia
		materia = Materia.objects.get(codigo_materia = codigo_materia)
		materias.append(materia)
		pass
	if 'btnCargarAlumnos' in request.GET:
		grupos = Grupo.objects.all()
		alumnos_grupo = []
		evaluacion = Evaluacion.objects.get(codigo_evaluacion = request.GET['txtCodigoEvaluado'])
		i = 0
		for x in grupos:
			if x.codigo_grupo in request.GET:
				if request.GET[x.codigo_grupo] == 'on':
					alumnos_grupo.append(Alumno_Grupo.objects.filter(codigo_grupo=x.codigo_grupo))
					for y in alumnos_grupo[i]:

						if not Calificacion.objects.filter(nie =y.nie, codigo_evaluacion=evaluacion).exists():
							alumnos.append(Alumno.objects.get(nie = y.nie.nie))
							pass
						pass
					i = i + 1
					pass
				pass				
			pass		
		pass
		if alumnos == []:
			noAlumnos = "No hay alumnos pendiente de nota en esta evaluación para los grupos seleccionados."
			pass

	if 'btnGuardar' in request.POST:
		alumnosAll = Alumno.objects.all()
		for x in alumnosAll:
			if str(x.nie) in request.POST:
				if request.POST[str(x.nie)] != "":
					eva = Evaluacion.objects.get(codigo_evaluacion=request.POST['codigoEva'])
					nota = Decimal(request.POST[x.nie])
					last_id = Calificacion.objects.all().order_by('-id')[:1][0].id
					c = Calificacion(id = last_id+1, nie = x, codigo_evaluacion= eva, nota= nota)
					c.save()
					pass
				pass
		alumnos = []
		evaluacion = []
		exitoGuardar = "Las calificaciones se han guardado de manera exitosa!"
		
	contexto = {'materias': materias, 'alumnos':alumnos, 'evaluacion':evaluacion, 'noAlumnos':noAlumnos, 'exitoGuardar':exitoGuardar}
	return render(request,'IngresarNotas/ingresarNotas.html',contexto)

def servidorIngresarNotas(request):
	"""AQUIIIII HAY QUE VALIDAR anio_lectivo vigente y periodos no finalizados"""
	data = []
	if request.GET['accion'] == 'obtenerEvaluaciones':

		anioLectivos = AnioLectivo.objects.all().order_by('anio_lectivo')
		for x in anioLectivos:
			if not x.terminado:
				anioLectivo = x
				pass
				break
			pass
		periodos = Periodo.objects.filter(anio_lectivo = anioLectivo, finalizado = False)
		codigo_materia = request.GET['codigo_materia']
		materia = Materia.objects.get(codigo_materia = codigo_materia)
		docente = Docente.objects.get(usuario_docente=str(request.user.id))
		docente_materia = Docente_Materia.objects.get(codigo_docente = docente, codigo_materia = materia)

		evaluaciones = []

		for periodo in periodos:
			actividades = Actividad.objects.filter(codigo_periodo = periodo)

			for actividad in actividades:
				subactividades = Sub_Actividad.objects.filter(codigo_actividad = actividad)
				
				for subactividad in subactividades:
					if Evaluacion.objects.filter(codigo_sub_actividad = subactividad, codigo_docente_materia = docente_materia).exists():
						evaluacion = Evaluacion.objects.get(codigo_sub_actividad = subactividad, codigo_docente_materia = docente_materia)
						evaluaciones.append(evaluacion)
						pass 
					pass
				pass
			pass
		data = serializers.serialize('json', evaluaciones)
		pass

	elif request.GET['accion'] == 'obtenerGrupos':
		codigo_materia = request.GET['codigo_materia']
		materia = Materia.objects.get(codigo_materia = codigo_materia)
		docente = Docente.objects.get(usuario_docente=str(request.user.id))
		docente_materia = Docente_Materia.objects.get(codigo_docente = docente, codigo_materia = materia)
		docente_materia_grupos = Docente_Materia_Grupo.objects.filter(docente_materia = docente_materia)
		grupos = []
		for docente_materia_grupo in docente_materia_grupos:
			grupos.append(docente_materia_grupo.grupo)
			pass
		data = serializers.serialize('json', grupos)
		pass

	return HttpResponse(data, content_type = 'application/json')


def listaEvaluacion(request):

	#Docente
	if  request.user.is_superuser or not request.user.is_staff:
		return HttpResponse('Acceso denegado')
		pass

	materias = []
	contexto = {}
	evaluaciones = []

	docente = Docente.objects.get(usuario_docente=str(request.user.id)).dui_docente
	materiasImpartidas =  Docente_Materia.objects.filter(codigo_docente=docente)
	for x in materiasImpartidas:
		materias.append(Materia.objects.get(codigo_materia = x.codigo_materia.codigo_materia))
		pass

	anioLectivos = AnioLectivo.objects.all().order_by('anio_lectivo')
	for x in anioLectivos:
		if not x.terminado:
			anioLectivo = x
			pass
			break
		pass

	periodos = Periodo.objects.filter(codigo_periodo__contains = str(anioLectivo.anio_lectivo)).order_by('codigo_periodo')

	contexto = {'materias':materias, 'periodos':periodos}

	if 'btnCargarEvaluaciones' in request.GET:

		periodoFinalizado = False
		docente = Docente.objects.get(usuario_docente=str(request.user.id)).dui_docente
		evaluaciones = cargarEvaluaciones(request.GET['materiaSelect'], request.GET['periodo'], request.GET['actividad'], docente)
		if evaluaciones != []:
			anioLectivo = None
			anioLectivos = AnioLectivo.objects.all().order_by('anio_lectivo')
			for x in anioLectivos:
				if not x.terminado:
					anioLectivo = x
					pass
					break
				pass

			periodoSolicitado = Periodo.objects.get(codigo_periodo = request.GET['periodo'], anio_lectivo = anioLectivo)
			
			if periodoSolicitado.finalizado:
				periodoFinalizado = True
				pass
			contexto = {'evaluaciones':evaluaciones, 'materia':request.GET['materiaSelect'], 'periodo':request.GET['periodo'], 'actividad':request.GET['actividad'], 'periodoFinalizado':periodoFinalizado}
			pass
		else:
			contexto = {'evaluaciones':evaluaciones, 'materia':request.GET['materiaSelect'], 'periodo':request.GET['periodo'], 'actividad':request.GET['actividad'], 'periodoFinalizado':periodoFinalizado, 'mensaje':True}

	if 'accion' in request.POST:
		accion = request.POST['accion']

		if accion == 'Eliminar':

			codigo_evaluacion = request.POST['evaluacion']
			evaluacion = Evaluacion.objects.get(codigo_evaluacion = codigo_evaluacion)
			evaluacion.codigo_sub_actividad.delete()
			docente = Docente.objects.get(usuario_docente=str(request.user.id)).dui_docente
			evaluaciones = cargarEvaluaciones(request.GET['materiaSelect'], request.GET['periodo'], request.GET['actividad'],docente)
			if evaluaciones != []:
				contexto = {'evaluaciones':evaluaciones, 'materia':request.GET['materiaSelect'], 'periodo':request.GET['periodo'], 'actividad':request.GET['actividad']}
				pass
			else:
				return redirect('.')
				pass
			pass
		else:
			codigo_evaluacion = request.POST['evaluacion']
			return redirect('/into/editarEvaluacion/'+codigo_evaluacion)
			pass
		pass

	return render(request,'AgregarEvaluacion/listaEvaluacion.html',contexto)

def cargarEvaluaciones(materia, periodo, actividad, docente):
	evaluaciones = []
	anioLectivos = AnioLectivo.objects.all().order_by('anio_lectivo')
	for x in anioLectivos:
		if not x.terminado:
			anioLectivo = x
			pass
			break
		pass
	pass
	periodoSolicitado = Periodo.objects.get(codigo_periodo = periodo, anio_lectivo = anioLectivo)

	if Actividad.objects.filter(codigo_actividad = actividad, codigo_periodo = periodoSolicitado).exists():
		actividadSolicitada = Actividad.objects.get(codigo_actividad = actividad, codigo_periodo = periodoSolicitado)
		SubActs = Sub_Actividad.objects.filter(codigo_actividad = actividadSolicitada)

		materia = Materia.objects.get(codigo_materia = materia)
		docente_materia = Docente_Materia.objects.get(codigo_docente = docente, codigo_materia = materia).id

		for x in SubActs:
			evaluacion = Evaluacion.objects.get(codigo_sub_actividad = x)
			if evaluacion.codigo_docente_materia.id == docente_materia:
				evaluaciones.append(evaluacion)
				pass
			pass
		return evaluaciones
		pass
	else:
		return []
		pass


def agregarEvaluacion(request):

	#Docente
	if  request.user.is_superuser or not request.user.is_staff:
		return HttpResponse('Acceso denegado')
		pass

	formSubActividad = False
	formExamen = False
	periodo= ""
	actividad = ""
	exitoGuardarSubAct = ""
	maximoSubActs = False
	contexto = {}
	materias = []
	periodoFinalizado = False
	porcentajePasado = False

	anioLectivos = AnioLectivo.objects.all().order_by('anio_lectivo')
	for x in anioLectivos:
		if not x.terminado:
			anioLectivo = x
			pass
			break
		pass

	periodos = Periodo.objects.filter(codigo_periodo__contains = str(anioLectivo.anio_lectivo)).order_by('codigo_periodo')
	periodos_acts = []

	for periodo in periodos:
		periodos_acts.append(Actividad.objects.filter(codigo_periodo = periodo).order_by('codigo_actividad'))
		pass


	contexto = {'periodos_acts':periodos_acts, 'periodos':periodos}

	docente = Docente.objects.get(usuario_docente=str(request.user.id)).dui_docente
	materiasImpartidas =  Docente_Materia.objects.filter(codigo_docente=docente)
	for x in materiasImpartidas:
		materias.append(Materia.objects.get(codigo_materia = x.codigo_materia.codigo_materia).codigo_materia)
		pass
	

	if 'btnCargarForm' in request.POST:
		anioLectivo = None
		periodo = request.POST['periodo']
		actividad = request.POST['actividad']
		anioLectivos = AnioLectivo.objects.all().order_by('anio_lectivo')
		for x in anioLectivos:
			if not x.terminado:
				anioLectivo = x
				pass
				break
			pass

		tipo_actividad = Actividad.objects.get(codigo_actividad = actividad).codigo_tipo_actividad

		if tipo_actividad.codigo_tipo_actividad is not 'Examen':
			periodoSolicitado = Periodo.objects.get(codigo_periodo = periodo, anio_lectivo = anioLectivo)

			if periodoSolicitado.finalizado:
				periodoFinalizado = True
				pass
			else:

				actividadSolicitada = Actividad.objects.get(codigo_actividad = actividad, codigo_periodo = periodoSolicitado)
				cantSubActs = Sub_Actividad.objects.filter(codigo_actividad = actividadSolicitada).count()
				subActs = Sub_Actividad.objects.filter(codigo_actividad = actividadSolicitada)
				if cantSubActs < actividadSolicitada.cantidad_max_sub_act:

					porcentajeTotal = 0
					for subAct in subActs:
						porcentajeTotal += subAct.porcentaje_sub_actividad
						pass

					if porcentajeTotal == 35.00:
						maximoSubActs = True
						pass
					else:
						formSubActividad = True
						pass

					pass
				else:
					maximoSubActs = True
					pass
				pass
			contexto = {'formSubActividad':formSubActividad,'periodo':periodo,'actividad':actividad, 'materias':materias, 'anioLectivo':anioLectivo, 'maximoSubActs':maximoSubActs, 'periodoFinalizado':periodoFinalizado}
			pass
		elif request.POST['actividad'] == 'examen1' or request.POST['actividad'] == 'examen2':
			formExamen = True
			contexto = {'formExamen':formExamen,'periodo':periodo,'actividad':actividad, 'materias':materias, 'anioLectivo':anioLectivo}

	if 'btnGuardarSubActividad' in request.POST:
		periodo = Periodo.objects.get(codigo_periodo = request.POST['periodoPerteneciente'], anio_lectivo = int(request.POST['anioLectivo']))
		actividad = Actividad.objects.get(codigo_periodo = periodo, codigo_actividad = request.POST['actividadPerteneciente'])
		
		"""Validar que no sobrepase el 35% la suma de los porcentajes de las subactividades"""
		docente = Docente.objects.get(usuario_docente = request.user)
		materia = Materia.objects.get(codigo_materia = request.POST['materia'])
		docente_materia = Docente_Materia.objects.get(codigo_docente = docente, codigo_materia = materia)
		evaluaciones = Evaluacion.objects.filter(codigo_docente_materia = docente_materia)

		subActs = []
		for evaluacion in evaluaciones:
			if evaluacion.codigo_sub_actividad.codigo_actividad.codigo_actividad == actividad.codigo_actividad:
				subActs.append(evaluacion.codigo_sub_actividad)
				pass
			pass

		porcentajeTotal = float(request.POST['porcentajeSubActividad'])
		porcentajeActual = 0
		for subAct in subActs:
			porcentajeTotal += float(subAct.porcentaje_sub_actividad)
			porcentajeActual += float(subAct.porcentaje_sub_actividad)
			pass


		porcentajeRestante = float(0.35 - round(float(porcentajeActual),2))

		if porcentajeTotal > float(0.35):
			if porcentajeRestante == float(0.00):
				contexto = {'porcentajeJusto':True}
				pass
			else:
				porcentajePasado = True
				contexto = {'porcentajePasado':porcentajePasado, 'porcentajeRestante':round(float(porcentajeRestante),2)}
				pass
			pass
		else:
			subAct = Sub_Actividad(codigo_sub_actividad = request.POST['codigoSubActividad'], codigo_actividad = actividad, porcentaje_sub_actividad = Decimal(request.POST['porcentajeSubActividad']), descripcion_sub_actividad = request.POST['descripcionSubActividad'])
			subAct.save()
			docente = Docente.objects.get(usuario_docente=str(request.user.id))
			docente_materia = Docente_Materia.objects.get(codigo_docente = docente.dui_docente, codigo_materia = request.POST['materia'])
			eva = Evaluacion(codigo_evaluacion = request.POST['codigoEvaluacion'], nombre_evaluacion = request.POST['nombreEvaluacion'], descripcion_evaluacion = request.POST['descripcionEvaluacion'], codigo_docente_materia = docente_materia ,codigo_sub_actividad = subAct)
			eva.save()
			exitoGuardarSubAct = "La sub-actividad y evaluación se han guardado de manera exitosa!"
			contexto = {'exitoGuardarSubAct':exitoGuardarSubAct}
			pass
		pass 



	return render(request,'AgregarEvaluacion/agregarEvaluacion.html',contexto)
	
def editarEvaluacion(request, id_evaluacion):

	#Docente
	if  request.user.is_superuser or not request.user.is_staff:
		return HttpResponse('Acceso denegado')
		pass

	evaluacion = None

	if Evaluacion.objects.filter(codigo_evaluacion = id_evaluacion).exists():
		evaluacion = Evaluacion.objects.get(codigo_evaluacion = id_evaluacion)
		pass

	if 'btnActualizar' in request.POST:
		codigo_evaluacion = request.POST['codigoEvaluacion']
		Evaluacion.objects.filter(codigo_evaluacion = codigo_evaluacion).update(nombre_evaluacion = request.POST['nombreEvaluacion'], descripcion_evaluacion = request.POST['descripcionEvaluacion'])
		Sub_Actividad.objects.filter(codigo_sub_actividad = evaluacion.codigo_sub_actividad.codigo_sub_actividad).update(porcentaje_sub_actividad = request.POST['porcentajeSubActividad'], descripcion_sub_actividad = request.POST['descripcionSubActividad'])
		return redirect('/into/listaEvaluacion/')
	return render(request, 'AgregarEvaluacion/editarEvaluacion.html',{'evaluacion':evaluacion})

def servidorActividades(request):
	codigo_periodo = request.GET['codigo_periodo']
	actividades = Actividad.objects.filter(codigo_periodo = codigo_periodo).order_by('codigo_actividad')
	data = serializers.serialize("json", actividades)

	return HttpResponse(data, content_type='application/json')

#Inicio de codigo del Expediente (Fc!)

def Expediente(request):
		#Alumno
	if request.user.is_superuser or request.user.is_staff:
		return HttpResponse('Acceso denegado')
		pass
	estudiante=Alumno.objects.get(usuario_alumno_id=request.user.id)
	bachillerato=Especialidad.objects.get(codigo_especialidad=estudiante.especialidad_alumno_id)
	cant_grupos=Alumno_Grupo.objects.filter(nie=estudiante.nie).order_by('id')#devuelve todos los registros de alumno grupo
	secciones=[]#almacenara los registros de todas las secciones del estudiante
	for x in cant_grupos:
		g=Grupo.objects.get(codigo_grupo=x.codigo_grupo)
		secciones.append(g)
		pass
	ultima_seccion=cant_grupos.reverse()[0]#registro de ultima seccion alumno
	seccion=Grupo.objects.get(codigo_grupo=ultima_seccion.codigo_grupo)#seccion actual
	contexto={'estudiante':estudiante,'bachillerato':bachillerato,'seccion':seccion,'grados':secciones}
	return render (request,'expediente/expediente.html',contexto)

def BuscarPeriodos(request):
		#Alumno
	if request.user.is_superuser or request.user.is_staff:
		return HttpResponse('Acceso denegado')
		pass
	codigos_periodos=Periodo.objects.filter(anio_lectivo_id=request.GET['anio'],finalizado=True)

	data=serializers.serialize('json',codigos_periodos)
	return HttpResponse(data,content_type='application/json')
	
def BuscarNotas(request):
		#Alumno
	if request.user.is_superuser or request.user.is_staff:
		return HttpResponse('Acceso denegado')
		pass
	alumno=Alumno.objects.get(usuario_alumno_id=request.user.id)

	nie=alumno.nie
	periodo=Periodo.objects.get(codigo_periodo=request.GET['codigo_periodo'])
	datos=ObtenerPromedioPeriodo(alumno,nie,periodo,'Periodo')

	return HttpResponse(datos,content_type='application/json')

def PromedioFin(request):
		#Alumno
	if request.user.is_superuser or request.user.is_staff:
		return HttpResponse('Acceso denegado')
		pass
	alumno=Alumno.objects.get(usuario_alumno_id=request.user.id)
	nie=alumno.nie
	periodo_anio=  Periodo.objects.get(codigo_periodo=request.GET['codigo_periodo']).anio_lectivo_id
	periodos=Periodo.objects.filter(anio_lectivo_id=periodo_anio).order_by('codigo_periodo')
	periodo=Periodo.objects.get(codigo_periodo=request.GET['codigo_periodo'])
	
	periodo1=ObtenerPromedioPeriodo(alumno,nie,periodos[0],'Final')
	periodo2=ObtenerPromedioPeriodo(alumno,nie,periodos[1],'Final')
	periodo3=ObtenerPromedioPeriodo(alumno,nie,periodos[2],'Final')
	periodo4=ObtenerPromedioPeriodo(alumno,nie,periodos[3],'Final')
	promedio_materias_fin=ObtenerPromedioAnual(periodo1['promedios'],periodo2['promedios'],periodo3['promedios'],periodo4['promedios'])
	estados=VerificarEstados(promedio_materias_fin)
	diccionario={'materias':periodo1['materiaN'],'codigos':periodo1['materiaC'],'promedio':promedio_materias_fin,'estados':estados}
	datos=json.dumps(diccionario)
	return HttpResponse(datos,content_type='application/json')

def ObtenerPromedioActividad_Materia(nie,materia_cod,docentes_grado_materia,actividad):
	notas=[]
	sub_actividades=Sub_Actividad.objects.filter(codigo_actividad_id=actividad.codigo_actividad)
	#falta filtrar la materia
	#obtener las doce evaluaciones luego filtrarlas con el for de docentes_grado _materia
	evaluaciones_materias=[]
	evaluaciones=[]
	calificaciones=[]
	doc=0
	for x in docentes_grado_materia:
		if materia_cod==x.docente_materia.codigo_materia_id:
			doc=x
			pass
		pass
	for x in sub_actividades:
		eva=Evaluacion.objects.get(codigo_sub_actividad_id=x.codigo_sub_actividad)
		evaluaciones_materias.append(eva)
		pass
	for x in evaluaciones_materias:
		if x.codigo_docente_materia_id==doc.docente_materia_id:
			cal=Calificacion.objects.get(nie_id=nie,codigo_evaluacion_id=x.codigo_evaluacion).nota
			e=x.codigo_sub_actividad.porcentaje_sub_actividad
			res_Cal=ObtenerNotaPorcentaje(cal,e)
			calificaciones.append(res_Cal)
			pass
		pass
	suma=SumarNotasMateriaActividad(calificaciones)
	return suma

def ObtenerNotaPorcentaje(nota,porcentaje):
	valor=nota*porcentaje

	return valor

def SumarNotasMateriaActividad(notas):
	suma =0
	for x in notas:
		suma+=x
		pass
	return float(suma) 
def SumarNotasMateriasPeriodo(nota1,nota2,nota3):
	suma=nota1+nota2+nota3
	return float(suma)



def ObtenerPromedioPeriodo(alumno,nie,periodo,tipo):
	anio_lec=periodo.anio_lectivo_id#año seleccionado
	secciones=Alumno_Grupo.objects.filter(nie=nie)#registros de los grados del estudiante
	for x in secciones:
		seccion=Grupo.objects.get(codigo_grupo=x.codigo_grupo)#se los datos del grupo x
		if seccion.anio == anio_lec:
			grado=seccion#aqui se obtiene el grado del año seleccionado
			pass
		pass
	especialidad=Especialidad.objects.get(codigo_especialidad=alumno.especialidad_alumno_id)
	materias_esp=[] #guardara todas las materias_esp del año
	materias_codigos=[]
	materias_nombres=[]
	materias_esp= Especialidad_Materia.objects.filter(codigo_especialidad_id=especialidad.codigo_especialidad,nivel_materia_especialidad=grado.nivel_especialidad).order_by('codigo_especialidad')

	docentes_grado_materia=Docente_Materia_Grupo.objects.filter(grupo_id=grado.codigo_grupo).reverse()#obtiene los docentes que dan clases a la seccion

	actividades=[]
	actividades=Actividad.objects.filter(codigo_periodo_id=periodo.codigo_periodo).order_by('codigo_actividad')
		#contendran los promedios de cada materia

	prom_Act1=[]
	prom_Act2=[]
	prom_Act3=[]
	calificaciones=[]
	promedios_materia=[]
	for x in materias_esp:#se obtienen los objetos de las materias que recibe el estudiante en el año seleccionado
		cod_nombre=Materia.objects.get(codigo_materia=x.codigo_materia_id).codigo_materia
		materias_codigos.append(cod_nombre)
		cod_nombre=Materia.objects.get(codigo_materia=x.codigo_materia_id).nombre_materia
		materias_nombres.append(cod_nombre)
		pass

	con1=0
	con2=0
	act1=actividades[0]
	act2=actividades[1]
	act3=actividades[2]
		#OBTENER PROMEDIOS DE ACTIVAD DE MATERIAS
	for x in materias_codigos:
		resultado=ObtenerPromedioActividad_Materia(nie,x,docentes_grado_materia,act1)
		prom_Act1.append(resultado)
		resultado=ObtenerPromedioActividad_Materia(nie,x,docentes_grado_materia,act2)
		prom_Act2.append(resultado)
		resultado=ObtenerPromedioActividad_Materia(nie,x,docentes_grado_materia,act3)
		prom_Act3.append(resultado)
		pass

	for i in range(len(materias_codigos)):
		prom=SumarNotasMateriasPeriodo(prom_Act1[i],prom_Act2[i],prom_Act3[i])
		promedios_materia.append(prom)
		pass

	dicci={'materiaN':materias_nombres,'materiaC':materias_codigos, 'a1':prom_Act1,'a2':prom_Act2,'a3':prom_Act3,'promedios':promedios_materia}
	datos=json.dumps(dicci)

	if tipo=='Periodo':
		resultado=datos
	else:
	 	resultado= dicci

	return resultado

def ObtenerPromedioAnual(periodo1,periodo2,periodo3,periodo4):
	finales=[]
	for i in range(len(periodo1)):
		r=(periodo1[i]+periodo2[i]+periodo3[i]+periodo4[i])/4
		float(r)
		finales.append(r)
	return finales

def VerificarEstados(promedio_materias_fin):
	estados=[]
	es='Aprobada'
	for i in range(len(promedio_materias_fin)):
		if promedio_materias_fin[i]<5.95:
			es='Reprobada'
		estados.append(es)
	return estados

#Fin de codigo del Expediente (Fc!)

def actualizarUser(request):
	if 'btnGuardar' in request.POST:
		usuario = request.user
		if request.POST['txtUsername'] != "":
			usuario.username = request.POST['txtUsername']
			pass
		if request.POST['txtEmail'] != "":
			usuario.email = request.POST['txtEmail']
			pass
		if request.POST['txtPassword'] != "" and request.POST['txtConfirm'] != "":
			if request.POST['txtPassword'] == request.POST['txtConfirm']:
				usuario.set_password(request.POST['txtPassword'])
				pass
			pass
		usuario.save()
		return redirect('.')
		pass
	return render(request, 'actualizarUser/actualizarUser.html',{'user':request.user})

def especialidades_lista(request):
	#Admin
	if not request.user.is_superuser or not request.user.is_staff:
		return HttpResponse('Acceso denegado')
		pass

	if 'accion' in request.POST:
		accion = request.POST['accion']
		codigo_especialidad = request.POST['especialidad']
		especialidad = Especialidad.objects.get(codigo_especialidad = codigo_especialidad)
		if accion == 'Eliminar':
			especialidad.delete()
			pass
		else:
			pass
		pass
	especialidades = Especialidad.objects.all()
	contexto = {'especialidades':especialidades}
	return render(request,'especialidades/especialidades_lista.html',contexto)

def especialidad_agregar(request):
	if not request.user.is_superuser or not request.user.is_staff:
		return HttpResponse('Acceso denegado')
	

	if request.method == 'POST':
		form = EspecialidadForm(request.POST)
		if form.is_valid():
			form.save()
			return redirect('/into/especialidades_lista')
	else:
		form = EspecialidadForm()
		print(form)
		contexto = {'form':form}
		return render(request,'especialidades/agregar_especialidad.html',contexto)

def especialidad_update(request,codigo_especialidad):
	especialidad=Especialidad.objects.get(codigo_especialidad=codigo_especialidad)
	if request.method == 'GET':
		form = EspecialidadForm(instance=especialidad)
	else:
		form = EspecialidadForm(request.POST, instance=especialidad)
		if form.is_valid():
			form.save()
		return redirect('especialidades_lista')
	contexto={'form':form}
	return render(request, 'especialidades/modificar_especialidad.html',contexto)