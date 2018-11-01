from django.shortcuts import render, redirect
from django.views.generic import TemplateView,ListView,CreateView, UpdateView
from apps.INTO.models import Docente
from apps.INTO.forms import DocenteForm,AdministrarNotasForm, MateriaForm
from django.shortcuts import render,redirect
from django.views.generic import TemplateView,ListView,CreateView,DeleteView
from apps.INTO.models import Docente
from django.contrib.auth.models import User,BaseUserManager
from apps.INTO.forms import DocenteForm,AdministrarNotasForm,RegistroForm,AsignacionTipeUser
from django.urls import reverse_lazy,reverse
from django.http import HttpResponse
from apps.INTO.models import *
from decimal import Decimal
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
			#asignamos a los objetos de tipo usuario los datos necesarios para la creacion
			usuario.username=docente.nombre_docente
			usuario.first_name=docente.nombre_docente
			usuario.last_name=docente.apellidos_docente
			usuario.email=docente.email_docente			
			usuario.set_password('administrador10')
			#Guardamos el usuario para luego traer su id
			usuario.save()	
			#Hacemos una consulta a la tabla user del username(nombre del docente)		
			id_docente = User.objects.get(username=str(docente.nombre_docente))	
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


class Vista(TemplateView):
	template_name='base/base.html'

class ListDocentesAdmin(ListView):
	model=Docente
	template_name='docentes/docentes_list.html'


class IngresarNotas(TemplateView):
	template_name='IngresarNotas/ingresarNotas.html'

class DatosEstadisticos(TemplateView):
	template_name='estadisticas/estadisticas.html'

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

	form = AdministrarNotasForm()

	if 'btnConsultar' in request.POST:
	
		
		
		datoDocenteMateria = Docente_Materia.objects.all()
		datoCalificacion = Calificacion.objects.all()
		datoAlumno = Alumno.objects.all()

		
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
		 'codigoMateria':codigoMateria
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

def docente_delete(request, dui_docente):
	docente = Docente.objects.get(pk=dui_docente)
	if request.method == 'POST':
		docente.delete()
		return redirect('docentes-list')
	return render(request, 'docentes/docente_delete.html', {'docente' : docente})


def IngresarNotas(request):
	contexto = {}
	alumnos = False
	evaluacion = False
	gruposLista = []
	if 'btnObtener' in request.POST:
		datos = request.POST['materiaListado'].split(" ")
		especialidad = Especialidad_Materia.objects.filter(codigo_materia = datos[0])
		evaluacion = Evaluacion.objects.get(codigo_evaluacion = datos[1])
		alumnos_grupo = []
		alumnos = []
		grupos = []
		i = 0
		for x in especialidad:
			grupos.append(Grupo.objects.filter(codigo_especialidad = x.codigo_especialidad.codigo_especialidad, nivel_especialidad=x.nivel_materia_especialidad))
			for y in grupos[i]:
				gruposLista.append(y)
				pass
			i = i + 1
			pass	

	elif 'btnCargaAlums' in request.POST:
		grupos = Grupo.objects.all()
		alumnos_grupo = []
		alumnos = []
		i = 0
		for x in grupos:
			if x.codigo_grupo in request.POST:
				if request.POST[x.codigo_grupo] == 'on':
					alumnos_grupo.append(Alumno_Grupo.objects.filter(codigo_grupo=x.codigo_grupo))
					for y in alumnos_grupo[i]:
						alumnos.append(Alumno.objects.get(nie = y.nie.nie))
						pass
					i = i + 1
					pass
				pass				
			pass
		evaluacion = Evaluacion.objects.get(codigo_evaluacion = request.POST['codigoEva'])


	elif 'btnGuardar' in request.POST:
		alumnosAll = Alumno.objects.all()
		for x in alumnosAll:
			if str(x.nie) in request.POST:
				eva = Evaluacion.objects.get(codigo_evaluacion=request.POST['codigoEva2'])
				nota = Decimal(request.POST[x.nie])
				c = Calificacion(nie = x, codigo_evaluacion= eva, nota= nota)
				c.save()
				pass
			else:
				print("")
			pass

	docente = Docente.objects.get(usuario_docente=str(request.user.id)).dui_docente
	materiasImpartidas =  Docente_Materia.objects.filter(codigo_docente=docente)
	materias = []
	for x in materiasImpartidas:
		id_doc_mat = Docente_Materia.objects.get(codigo_materia=Materia.objects.get(codigo_materia=str(x.codigo_materia.codigo_materia)).codigo_materia, codigo_docente=Docente.objects.get(usuario_docente=str(request.user.id)).dui_docente).id
		evaluaciones = Evaluacion.objects.filter(codigo_docente_materia = id_doc_mat)
		for y in evaluaciones:
			cod_actividad = Sub_Actividad.objects.get(codigo_sub_actividad=y.codigo_sub_actividad.codigo_sub_actividad).codigo_actividad.codigo_actividad
			materias.append(Materia.objects.get(codigo_materia=str(x.codigo_materia.codigo_materia)).codigo_materia +" "+ y.codigo_evaluacion +" "+ y.codigo_sub_actividad.codigo_sub_actividad +" "+ cod_actividad)
			pass
		pass
	contexto = {'materias':materias,"alumnos":alumnos,"evaluacion":evaluacion,'gruposLista':gruposLista}
	return render(request,'IngresarNotas/ingresarNotas.html',contexto)


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