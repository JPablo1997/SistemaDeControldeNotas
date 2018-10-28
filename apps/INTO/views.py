from django.shortcuts import render
from django.views.generic import TemplateView,ListView,CreateView
from apps.INTO.models import Docente
from apps.INTO.forms import DocenteForm,AdministrarNotasForm
from django.urls import reverse_lazy,reverse
from django.http import HttpResponse
from apps.INTO.models import *
from decimal import Decimal
# Create your views here.
class Vista(TemplateView):
	template_name='base/base.html'

class ListDocentesAdmin(ListView):
	model=Docente
	template_name='docentes/docentes_list.html'

class CrearDocentesAdmin(CreateView):
	 
	template_name='docentes/edit_docente.html'
	model=Docente
	
	form_class =  DocenteForm
	def get_context_data(self, **kwargs):
		context=super(CrearDocentesAdmin,self).get_context_data(**kwargs)
		context['action']=reverse('docente-new')
		return context
		
	success_url=reverse_lazy('docentes-list')

class IngresarNotas(TemplateView):
	template_name='IngresarNotas/ingresarNotas.html'

class DatosEstadisticos(TemplateView):
	template_name='estadisticas/estadisticas.html'

class administrarNotas(TemplateView):
	template_name='administrarNotas/administrarNotas.html'
	def administrar(request):
		form = AdministrarNotasForm()
		return render(request, 'administrarNotas/administrarNotas.html',{'form':form})

def IngresarNotas(request):
	contexto = {}
	alumnos = False
	evaluacion = False
	if 'btnObtener' in request.POST:
		datos = request.POST['materiaListado'].split(" ")
		especialidad = Especialidad_Materia.objects.filter(codigo_materia = datos[0])
		evaluacion = Evaluacion.objects.get(codigo_evaluacion = datos[1])
		grupos = []
		alumnos_grupo = []
		alumnos = []
		i = 0
		for x in especialidad:
			grupos.append(Grupo.objects.filter(codigo_especialidad = x.codigo_especialidad.codigo_especialidad, nivel_especialidad=x.nivel_materia_especialidad))
			for y in grupos[i]:
				alumnos_grupo.append(Alumno_Grupo.objects.filter(codigo_grupo=y.codigo_grupo))
				pass
			i = i + 1
			pass	
		for z in alumnos_grupo:
			for a in z:
				alumnos.append(Alumno.objects.get(nie = a.nie.nie))
				pass
			pass

	elif 'btnGuardar' in request.POST:
		alumnosAll = Alumno.objects.all()
		for x in alumnosAll:
			if str(x.nie) in request.POST:
				eva = Evaluacion.objects.get(codigo_evaluacion=request.POST['codigoEva'])
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
	contexto = {'materias':materias,"alumnos":alumnos,"evaluacion":evaluacion}
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
		materias.append(Materia.objects.get(codigo_materia = x.codigo_materia.codigo_materia).nombre_materia)
		pass
	

	if 'btnCargarForm' in request.POST:
		periodo = request.POST['periodo']
		actividad = request.POST['actividad']
		if request.POST['actividad'] == 'Actividad1' or request.POST['actividad'] == 'Actividad2':
			formSubActividad = True
			contexto = {'formSubActividad':formSubActividad,'periodo':periodo,'actividad':actividad, 'materias':materias}
			pass
		elif request.POST['actividad'] == 'Examen1' or request.POST['actividad'] == 'Examen2':
			formExamen = True
			contexto = {'formExamen':formExamen,'periodo':periodo,'actividad':actividad, 'materias':materias}

	return render(request,'AgregarEvaluacion/agregarEvaluacion.html',contexto)