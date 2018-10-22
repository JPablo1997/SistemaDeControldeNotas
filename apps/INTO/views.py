from django.shortcuts import render
from django.views.generic import TemplateView,ListView,CreateView
from apps.INTO.models import Docente
from apps.INTO.forms import DocenteForm
from django.urls import reverse_lazy,reverse
# Create your views here.
class Vista(TemplateView):
	template_name='base/base.html'

class ListDocentesAdmin(ListView):
	model=Docente
	template_name='docentes/docentes_list.html'

class CrearDocentesAdmin(CreateView):
	model=Docente 
	template_name='docentes/edit_docente.html'
	form_class =  DocenteForm
	def get_context_data(self, **kwargs):
		context=super(CrearDocentesAdmin,self).get_context_data(**kwargs)
		context['action']=reverse('docente-new')
		return context
	success_url=reverse_lazy('docentes-list')