"""SistemaDeControldeNotas URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from django.conf.urls import url, include
from django.contrib.auth.views import login
from django.contrib.auth.decorators import login_required
from apps.INTO.views import *


 
urlpatterns = [  
    url(r'^index/$',login_required(Vista.as_view()),name="index"),
    url(r'^docentes/$',login_required(ListDocentesAdmin.as_view()),name="docentes-list"),
    url(r'^nuevoDocente/$',login_required(creardocente),name="docente-new"),
    url(r'^ingresarNotas/$',login_required(IngresarNotas),name="ingresarNotas"),
    url(r'^estadisticas/$',login_required(DatosEstadisticos),name="estadisticas"),
    url(r'^administrar/$',login_required(administrarNotas),name="administrar"),
    url(r'^Anotacion/$',login_required(anotacion),name="Anotacion"),
    url(r'^administrarMaterias/$',login_required(MateriaList.as_view()),name="administrarMaterias"),
    url(r'^agregarMateria/$',login_required(MateriaCreate.as_view()),name="agregarMateria"),
    path('editarMateria/<str:codigo_materia>/',login_required(materia_edit),name="editarMateria"),
    path('eliminarMateria/<str:codigo_materia>/',login_required(materia_delete),name="eliminarMateria"),
    url(r'^agregarEvaluacion/$',login_required(agregarEvaluacion),name="agregarEvaluacion"),
    path('eliminarDocente/<str:id_del_docente>/',login_required(docente_delete),name='docente-delete'),
    path('detalleDocente/<str:id_del_docente>/',login_required(docente_detalle),name='docente_detalle'),
    path('actualizarDocente/<str:id_del_docente>/',login_required(docente_edit),name='docente_actualizar'),

]
