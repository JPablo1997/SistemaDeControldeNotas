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
			id_tipo_usuario = TipoUsuario.objects.get(codigo_tipo_usuario="2")
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

class CrearGrado(CreateView):
	template_name="Alumnos/crear_grado.html"
	model = Grupo
	form_class=GradoForm
	success_url = reverse_lazy('alumno_list')


class CrearGrado2(TemplateView):
	
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
		pruebacod=request.POST['grupo']
		print(pruebacod)
		docente=Docente.objects.all()
		data = serializers.serialize('json',docente)
		print(data)
		return HttpResponse(data, content_type='application/json')
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
	nombre = ""
	AlumnoNie = ""	
	AlumnoDato	= Alumno()
	AnotacionDato = Anotacion()
	Anot = []
	codigoGrupo = ""
	AlumnoGrupo = Alumno_Grupo()
	GrupoE= Grupo()
	codigoDocente = ""
	idUser = request.user.id
	duiDocente = ""
	docente = Docente()
	message = "Anotaciones"
	
	if request.method == 'POST':
		form = AnotacionForm(request.POST)
		if 'btnConsultar' in request.POST:
			AlumnoNie = request.POST.get('inputNie')
			AlumnoGrupo = Alumno_Grupo.objects.get(nie=AlumnoNie)
			codigoGrupo = AlumnoGrupo.codigo_grupo
			GrupoE = Grupo.objects.get(codigo_grupo=codigoGrupo)
			codigoDocente = GrupoE.codigo_docente_encargado_id
			docente = Docente.objects.get(usuario_docente_id=idUser)
			dui_docente = docente.dui_docente
			if codigoDocente == dui_docente:
				try:
	   				AlumnoDato = Alumno.objects.get(nie=AlumnoNie)
	   				Anot=Anotacion.objects.filter(nie_id=AlumnoNie)
	   				nombre = AlumnoDato.nombre_alumno + " "+ AlumnoDato.apellidos_alumno
	   				
				except Alumno.DoesNotExist:
	   				AlumnoDato = None
	   				AlumnoNie = ""	






			

			

		if 'btnGuardar' in request.POST:
			
			AlumnoNie = request.POST.get('nie')
			AlumnoGrupo = Alumno_Grupo.objects.get(nie=AlumnoNie)
			codigoGrupo = AlumnoGrupo.codigo_grupo
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
					anotacionFinal.fecha_anotacion = request.POST.get('fecha_anotacion')
					anotacionFinal.save()	
			
			
			return redirect('Anotacion')
	else:
		form = AnotacionForm()	
			
		
			
			
	

	return render(request, 'AgregarAnotacion/AgregarAnotacion.html',
		{'form':form,
		'AlumnoNie':AlumnoNie,
		 'nombre': nombre,
		 'Anot':Anot,
		 'message' : message,
		 
		 
		})

	

def administrarNotas(request):
	AlumnoNie = ""
	codigoEvaluacion = 0
	nota = 0
	codigoMateria = 0
	codigoDocente = 0
	id_docente_materia=0
	nombre= ""
	apellidos = ""
	codigoEspecialidad = ""
	codigoSubActividad = ""
	codigoActividad = ""
	cantidadSubActividades = ""

	form = AdministrarNotasForm()

	if 'btnConsultar' in request.POST:
	
		
		
		datoDocenteMateria = Docente_Materia.objects.all()
		datoCalificacion = Calificacion.objects.all()
		datoAlumno = Alumno.objects.all()
		datoEvaluacion = Evaluacion.objects.all()
		datoSubActividad = Sub_Actividad.objects.all()
		datoActividad = Actividad.objects.all()


		
		AlumnoNie = request.POST.get('inputCodAlumno')
		codigoMateria = request.POST.get('inputCodMateria')
		codigoDocente = request.POST.get('inputCodDocente')
		
		


		for i in datoDocenteMateria	:
			if i.codigo_docente_id == codigoDocente and i.codigo_materia_id == codigoMateria:				
				id_docente_materia= i.id					
		for i in datoCalificacion	:
			if i.nie == AlumnoNie:
				codigoEvaluacion = i.codigo_evaluacion					
		for i in datoAlumno	:
			if i.nie == AlumnoNie:
				nombre= i.nombre_alumno
				apellidos= i.apellidos_alumno				
				codigoEspecialidad	= i.especialidad_alumno_id
		for i in datoEvaluacion	:
			if i.codigo_docente_materia_id == id_docente_materia:
				codigoSubActividad = i.codigo_sub_actividad_id	

		for i in datoSubActividad	:
			if i.codigo_sub_actividad == codigoSubActividad:
				codigoActividad = i.codigo_actividad_id

		for i in datoActividad	:
			if i.codigo_actividad == codigoActividad:
				cantidadSubActividades = i.cantidad_max_sub_act			

				
		


	else: 	
		form = AdministrarNotasForm()

			


			
	return render(request, 'administrarNotas/administrarNotas.html',
		{'form':form,
		 'nota': nota,
		 'codigoEvaluacion': codigoEvaluacion,
		 'AlumnoNie':AlumnoNie,
		 'codigoMateria' : codigoMateria,	
		 'codigoDocente' : codigoDocente,
		 'nombre': nombre,
		 'apellidos':apellidos,
		 'codigoEspecialidad': codigoEspecialidad,
		 'codigoMateria':codigoMateria,
		 'codigoSubActividad':codigoSubActividad,
		 'codigoActividad' : codigoActividad,
		 'cantidadSubActividades':cantidadSubActividades
		}


		)



class MateriaList(ListView):
	model = Materia
	template_name = 'administrarMaterias/administrarMaterias.html'
	ordering = ['codigo_materia']

class MateriaCreate(CreateView):
	model = Materia
	form_class = MateriaForm
	template_name = 'administrarMaterias/agregarMateria.html'
	success_url = reverse_lazy('administrarMaterias')


def materia_view(request):
#	if request.method == 'POST':
#		form = MateriaForm(request.POST)
#		if form.is_valid():
#			form.save()
#		return redirect('/into/administrarMaterias')
#	else:
#		form = MateriaForm()
#	return render(request, 'administrarMaterias/agregarMateria.html', {'form' : form})
#   si el metodo es POST Hacer esto
	if request.method=='POST':
		#Resivimos todos los parametros del formulario
		form=MateriaForm(request.POST)
		#si el formulario es Valido hacer lo siguiente 
		if form.is_valid():
			#Hacemos la creacion de los objetos 
			materia=Materia()
			docentes=Docente.objects.all()
			docMat = Docente_Materia()		
			#Asignammos a cada objeto lo que resivimos de cada campo del formulario
			materia.codigo_materia=request.POST['codigo_materia']
			materia.nombre_materia=request.POST['nombre_materia']
			materia.descripcion_materia=request.POST['descripcion_materia']
			materia.objetivos=request.POST['objetivos']	
			#Guardamos  
			materia.save()
			if "docent" in request.POST:
				for doc in docentes:
					if doc.dui_docente == request.POST['docent']:
						docMat.codigo_docente = doc
						docMat.codigo_materia = materia
						docMat.save()
			#	arrayDoc = request.POST.getlist('docent[]')
		return redirect('/into/administrarMaterias')
	else:
		#muestra el formulario
		form=MateriaForm()
		especialidad=Especialidad.objects.all()
		docente=Docente.objects.all()
		contexto={'form':form,'docente':docente,'especialidad':especialidad}		
	return render(request,'administrarMaterias/agregarMateria.html',contexto)

def materia_edit(request, codigo_materia):
	materia = Materia.objects.get(pk=codigo_materia)
	if request.method == 'GET':
		form = MateriaForm(instance=materia)
	else:
		form = MateriaForm(request.POST, instance=materia)
		if form.is_valid():
			form.save() 
		return redirect('/into/administrarMaterias')
	return render(request, 'administrarMaterias/agregarMateria.html', {'form' : form})

def materia_delete(request, codigo_materia):
	materia = Materia.objects.get(pk=codigo_materia)
	if request.method == 'POST':
		materia.delete()
		return redirect('/into/administrarMaterias')
	return render(request, 'administrarMaterias/eliminarMateria.html', {'materia' : materia})


def IngresarNotas(request):

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
			noAlumnos = "No hay alumnos pendiente de nota en esta evaluación."
			pass

	if 'btnGuardar' in request.POST:
		alumnosAll = Alumno.objects.all()
		for x in alumnosAll:
			if str(x.nie) in request.POST:
				eva = Evaluacion.objects.get(codigo_evaluacion=request.POST['codigoEva'])
				nota = Decimal(request.POST[x.nie])
				c = Calificacion(nie = x, codigo_evaluacion= eva, nota= nota)
				c.save()
				alumnos = []
				evaluacion = []
				pass
		exitoGuardar = "Las calificaciones se han guardado de manera exitosa!"
		
	contexto = {'materias': materias, 'alumnos':alumnos, 'evaluacion':evaluacion, 'noAlumnos':noAlumnos, 'exitoGuardar':exitoGuardar}
	return render(request,'IngresarNotas/ingresarNotas.html',contexto)

def servidorIngresarNotas(request):
	"""AQUIIIII HAY QUE VALIDAR anio_lectivo vigente y periodos no finalizados"""
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
		return HttpResponse(data, content_type = 'application/json')
		pass

def listaEvaluacion(request):
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
			contexto = {'evaluaciones':evaluaciones, 'materia':request.GET['materiaSelect'], 'periodo':request.GET['periodo'], 'actividad':request.GET['actividad']}
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
		subActs = Sub_Actividad.objects.filter(codigo_actividad = actividad)

		porcentajeTotal = Decimal(request.POST['porcentajeSubActividad'])
		porcentajeActual = 0
		for subAct in subActs:
			porcentajeTotal += subAct.porcentaje_sub_actividad
			porcentajeActual += subAct.porcentaje_sub_actividad
			pass

		porcentajeRestante = 35.00 - float(porcentajeActual)

		if porcentajeTotal > 35.00:
			porcentajePasado = True
			contexto = {'porcentajePasado':porcentajePasado, 'porcentajeRestante':round(float(porcentajeRestante),2)}
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

def Expediente(request):
	return render (request,'expediente/expediente.html')

def actualizarUser(request):
	
	return render(request, 'actualizarUser/actualizarUser.html',{'user':request.user})