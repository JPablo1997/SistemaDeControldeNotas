from django.shortcuts import render, redirect
from django.views.generic import TemplateView,ListView,CreateView,DeleteView,UpdateView,DetailView
from django.contrib.auth.models import User,BaseUserManager
from apps.INTO.forms import DocenteForm,AdministrarNotasForm,RegistroForm,AsignacionTipeUser,MateriaForm
from django.urls import reverse_lazy,reverse
from django.http import HttpResponse
from apps.INTO.models import *
from decimal import Decimal
from django.core import serializers
# Create your views here.

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
	return render(request, 'AgregarAnotacion/AgregarAnotacion.html')
		

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
	if request.method == 'POST':
		form = MateriaForm(request.POST)
		if form.is_valid():
			form.save()
		return redirect('/into/administrarMaterias')
	else:
		form = MateriaForm()
	return render(request, 'administrarMaterias/agregarMateria.html', {'form' : form})

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
	if request.GET['accion'] == 'obtenerEvaluaciones':
		codigo_materia = request.GET['codigo_materia']
		materia = Materia.objects.get(codigo_materia = codigo_materia)
		docente = Docente.objects.get(usuario_docente=str(request.user.id))
		docente_materia = Docente_Materia.objects.get(codigo_docente = docente, codigo_materia = materia)
		evaluaciones = Evaluacion.objects.filter(codigo_docente_materia = docente_materia)
		data = serializers.serialize('json', evaluaciones)
		return HttpResponse(data, content_type = 'application/json')
		pass

	elif request.GET['accion'] == 'obtenerGrupos':
		codigo_materia = request.GET['codigo_materia']
		materia = Materia.objects.get(codigo_materia = codigo_materia)
		especialidades_materia = Especialidad_Materia.objects.filter(codigo_materia = materia)

		grupos = []
		for especialidad_materia in especialidades_materia:
			grupos_especialidad_materia = Grupo.objects.filter(codigo_especialidad = especialidad_materia.codigo_especialidad,nivel_especialidad = especialidad_materia.nivel_materia_especialidad)
			for grupo in grupos_especialidad_materia:
				grupos.append(grupo)
				pass
			pass

		data = serializers.serialize('json', grupos)
		return HttpResponse(data, content_type = 'application/json')
		pass


def agregarEvaluacion(request):

	formSubActividad = False
	formExamen = False
	periodo= ""
	actividad = ""
	contexto = {}
	materias = []

	docente = Docente.objects.get(usuario_docente=str(request.user.id)).dui_docente
	materiasImpartidas =  Docente_Materia.objects.filter(codigo_docente=docente)
	for x in materiasImpartidas:
		materias.append(Materia.objects.get(codigo_materia = x.codigo_materia.codigo_materia).codigo_materia)
		pass
	

	if 'btnCargarForm' in request.POST:
		periodo = request.POST['periodo']
		actividad = request.POST['actividad']
		anioLectivos = AnioLectivo.objects.all()
		if request.POST['actividad'] == 'actividad1' or request.POST['actividad'] == 'actividad2':
			formSubActividad = True
			contexto = {'formSubActividad':formSubActividad,'periodo':periodo,'actividad':actividad, 'materias':materias, 'anioLectivos':anioLectivos}
			pass
		elif request.POST['actividad'] == 'examen1' or request.POST['actividad'] == 'examen2':
			formExamen = True
			contexto = {'formExamen':formExamen,'periodo':periodo,'actividad':actividad, 'materias':materias, 'anioLectivos':anioLectivos}

	if 'btnGuardarSubActividad' in request.POST:
		periodo = Periodo.objects.get(codigo_periodo = request.POST['periodoPerteneciente'], anio_lectivo = int(request.POST['anioLectivo']))
		actividad = Actividad.objects.get(codigo_periodo = periodo.codigo_periodo, codigo_actividad = request.POST['actividadPerteneciente'])
		subAct = Sub_Actividad(codigo_sub_actividad = request.POST['codigoSubActividad'], codigo_actividad = actividad, porcentaje_sub_actividad = Decimal(request.POST['porcentajeSubActividad']), descripcion_sub_actividad = request.POST['descripcionSubActividad'])
		subAct.save()
		docente = Docente.objects.get(usuario_docente=str(request.user.id))
		docente_materia = Docente_Materia.objects.get(codigo_docente = docente.dui_docente, codigo_materia = request.POST['materia'])
		print(request.POST['codigoEvaluacion'])
		eva = Evaluacion(codigo_evaluacion = request.POST['codigoEvaluacion'], nombre_evaluacion = request.POST['nombreEvaluacion'], descripcion_evaluacion = request.POST['descripcionEvaluacion'], codigo_docente_materia = docente_materia ,codigo_sub_actividad = subAct)
		eva.save()
		pass 



	return render(request,'AgregarEvaluacion/agregarEvaluacion.html',contexto)