from django import forms 
from apps.INTO.models import Docente,Alumno,Grupo
from django.core.exceptions import ValidationError 
import re,datetime

class DocenteForm(forms.ModelForm):
    #Personalizamos los campos
    
    dui_docente = forms.CharField(max_length="10",required=True,label="DUI",help_text="DUI del Docente")
    nombre_docente = forms.CharField(max_length="30",required=True,label="Nombre")
    apellidos_docente = forms.CharField(max_length="30",required=True,label="Apellidos")
    fecha_nacimiento_docente = forms.DateInput(format=('%d-%m-%Y'))
    telefono_docente = forms.CharField(max_length="9",required=True,label="Telefono")
    email_docente = forms.EmailField()
    fecha_contratacion_docente = forms.DateField()
    direccion_docente = forms.CharField(max_length="100",required=False,label="Direccion")
    

    class Meta:
        model=Docente
        fields=['dui_docente','nombre_docente','apellidos_docente','fecha_nacimiento_docente','telefono_docente','email_docente','fecha_contratacion_docente','direccion_docente',]

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
    