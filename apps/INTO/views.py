from django.shortcuts import render, redirect
from django.views.generic import TemplateView,ListView,CreateView, UpdateView
from apps.INTO.models import Docente
from apps.INTO.forms import DocenteForm,AdministrarNotasForm, MateriaForm
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