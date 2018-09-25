from django.shortcuts import render
from django.views.generic import TemplateView
# Create your views here.
class Vista(TemplateView):
	template_name='base/base.html'