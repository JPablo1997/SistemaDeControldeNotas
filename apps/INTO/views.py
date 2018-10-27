from django.shortcuts import render
from django.views.generic import TemplateView,ListView,CreateView
from apps.INTO.models import Docente
from apps.INTO.forms import DocenteForm,AdministrarNotasForm
from django.urls import reverse_lazy,reverse
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