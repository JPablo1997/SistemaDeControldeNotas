from django import forms 
from apps.INTO.models import Docente,Alumno,Grupo,Materia,Grupo,Anotacion
from apps.INTO.models import Docente,Alumno,Grupo,asignacionTipoUsuario
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm
from django.core.exceptions import ValidationError 
import re,datetime


class DocenteForm(forms.ModelForm):
  
    
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
            'dui_docente' : forms.TextInput(attrs={'class':'form-control','placeholder':'Escriba el DUI'}),
            'nombre_docente' : forms.TextInput(attrs={'class':'form-control','placeholder':'Escriba los Nombres'}),
            'apellidos_docente' : forms.TextInput(attrs={'class':'form-control','placeholder':'Escriba los Apellidos'}),
            'fecha_nacimiento_docente' : forms.TextInput(attrs={'class':'form-control','type':'date'}),
            'telefono_docente' : forms.TextInput(attrs={'class':'form-control','placeholder':'Escriba el Telefono'}),
            'email_docente' : forms.TextInput(attrs={'class':'form-control','type':'email','placeholder':'example@example.com'}),
            'fecha_contratacion_docente' : forms.TextInput(attrs={'class':'form-control','type':'date'}),
            'direccion_docente' : forms.TextInput(attrs={'class':'form-control','placeholder':'Escriba la Direccion'}),
        }
    
#Parte de Creacion de Grupos
class GradoForm(forms.ModelForm):
    class Meta:
        model=Grupo
        fields=[
            'nivel_especialidad',
            'seccion',
            'codigo_especialidad',
            'codigo_docente_encargado',
        ]
        labels = {
            'nivel_especialidad':'Nivel de Especialidad',
            'seccion':'Seccion',
            'codigo_especialidad':'Codigo Especialidad',
            'codigo_docente_encargado':'Docente Encargado',
        }
        widgets = {
            
        }


#Finalizacion de la Creacion de Grupos

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
            'codigo_materia' : forms.TextInput(attrs={'class':'form-control','placeholder':'Escriba el Codigo de la Materia'}),
            'nombre_materia' : forms.TextInput(attrs={'class':'form-control','placeholder':'Escriba el Nombre de la Materia'}),
            'descripcion_materia' : forms.Textarea(attrs={'rows':3, 'class':'form-control','placeholder':'Escriba la Descripcion de la Materia'}),
            'objetivos' : forms.Textarea(attrs={'rows':3, 'class':'form-control','placeholder':'Escriba el Objetivo de la Materia'}),
        }

class AnotacionForm(forms.ModelForm):
    class Meta:
        model = Anotacion        

        fields = [
            'nie',
            #'dui_docente',
            'descripcion',
            'fecha_anotacion',

        ]
        labels = {
            'nie' : 'nie',
            #'dui_docente' : 'dui_docente',
            'descripcion' : 'descripcion',
            'fecha_anotacion' : 'fecha_anotacion',
        }
        widgets = {
            'nie' : forms.TextInput(attrs={'class':'form-control','id':"1",'onkeyup':"anotacionNie()",'disabled': 'true'}),
            #'dui_docente' : forms.TextInput(attrs={'class':'form-control','id':"dui",'onkeyup':"AnotacionDesactivar()",'disabled': 'true'}),
            'descripcion' : forms.Textarea(attrs={'class':'form-control','id':"3",'onkeyup':"AnotacionDesactivar()",'disabled': 'true'}),
            'fecha_anotacion' : forms.TextInput(attrs={'class':'form-control','type':'date' ,'cols': 80, 'rows': 20,'id':"4",'onkeyup':"AnotacionDesactivar()",'disabled': 'true'}),
        }

