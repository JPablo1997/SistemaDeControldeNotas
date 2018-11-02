from django import forms 
from apps.INTO.models import Docente,Alumno,Grupo,Materia
from apps.INTO.models import Docente,Alumno,Grupo,asignacionTipoUsuario
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm
from django.core.exceptions import ValidationError 
import re,datetime

class DocenteForm(forms.ModelForm):
    #Personalizamos los campos
    '''
    dui_docente = forms.CharField(max_length="10",required=True,label="DUI",help_text="DUI del Docente")
    nombre_docente = forms.CharField(max_length="30",required=True,label="Nombre")
    apellidos_docente = forms.CharField(max_length="30",required=True,label="Apellidos")
    fecha_nacimiento_docente = forms.DateInput(format=('%d-%m-%Y'))
    telefono_docente = forms.CharField(max_length="9",required=False,label="Telefono")
    email_docente = forms.EmailField()
    fecha_contratacion_docente = forms.DateField()
    direccion_docente = forms.CharField(max_length="100",required=False,label="Direccion")
    '''
    class Meta:
        model=Docente
        fields=[
            'dui_docente',
            'nombre_docente',
            'apellidos_docente',
            'fecha_nacimiento_docente',
            'telefono_docente',
            'email_docente',
            'fecha_contratacion_docente',
            'direccion_docente', 
                      
        ]
        labels = {
            'dui_docente' : 'Dui:',
            'nombre_docente' : 'Nombre:',
            'apellidos_docente' : 'Apellidos:',
            'fecha_nacimiento_docente' : 'Fecha de Nacimiento:',
            'telefono_docente':'Telefono:',
            'email_docente': 'Email:',
            'fecha_contratacion_docente':'Fecha de Contratacion:',
            'direccion_docente':'Direccion:',
            
        }
        widgets = {
            'dui_docente' : forms.TextInput(attrs={'class':'form-control'}),
            'nombre_docente' : forms.TextInput(attrs={'class':'form-control'}),
            'apellidos_docente' : forms.TextInput(attrs={'class':'form-control'}),
            'fecha_nacimiento_docente' : forms.TextInput(attrs={'class':'form-control'}),
            'telefono_docente' : forms.TextInput(attrs={'class':'form-control'}),
            'email_docente' : forms.TextInput(attrs={'class':'form-control'}),
            'fecha_contratacion_docente' : forms.TextInput(attrs={'class':'form-control'}),
            'direccion_docente' : forms.TextInput(attrs={'class':'form-control'}),
        }

class AlumnoForm(forms.ModelForm):
    class Meta:
        model=Alumno
        

class RegistroForm(UserCreationForm):
	class Meta:
		model=User
		fields=[
			'username',
			'first_name',
			'last_name',
			'email',
            
		]
		labels = {
			'username':'Nombre de Usuario',
			'first_name':'Nombre',
			'last_name':'Apellido',
			'email':'Correo Electronico',
            
		}
		widgets = {

        }

class AsignacionTipeUser(forms.ModelForm):
    class Meta:
        model=asignacionTipoUsuario
        fields=[
            'usuario',
            'tipo_usuario',
        ]
        labels={
            'usuario':'ID_Usuario',
            'tipo_usuario':'Tipo De Usuario',
        }
        widgets={
            'usuario' : forms.TextInput(attrs={'class':'form-control'}),
            'tipo_usuario' : forms.TextInput(attrs={'class':'form-control'}),
        }
		


class AdministrarNotasForm(forms.ModelForm):
    class Meta:
        model = Alumno

        fields = [
            'nie',

        ]
        labels = {
            'nie' : 'Nie',
        }
        widgets = {
            'nie' : forms.TextInput(attrs={'class':'form-control'}),
        }

class MateriaForm(forms.ModelForm):

    class Meta:
        model = Materia

        fields = [
            'codigo_materia',
            'nombre_materia',
            'descripcion_materia',
            'objetivos',
        ]
        labels = {
            'codigo_materia' : 'Código',
            'nombre_materia' : 'Nombre',
            'descripcion_materia' : 'Descripción',
            'objetivos' : 'Objetivos',
        }

        widgets = {
            'codigo_materia' : forms.TextInput(attrs={'class':'form-control'}),
            'nombre_materia' : forms.TextInput(attrs={'class':'form-control'}),
            'descripcion_materia' : forms.TextInput(attrs={'class':'form-control'}),
            'objetivos' : forms.TextInput(attrs={'class':'form-control'}),
        }