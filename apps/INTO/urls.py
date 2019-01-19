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
    url(r'^servidorIngresarNotas/$',login_required(servidorIngresarNotas),name="servidorIngresarNotas"),
    url(r'^estadisticas/$',login_required(DatosEstadisticos),name="estadisticas"),
    url(r'^expediente/$',login_required(Expediente),name="expediente"),
    url(r'^buscarPeriodos/$',login_required(BuscarPeriodos),name="buscarPeriodos"),
    url(r'^buscarNotas/$',login_required(BuscarNotas),name="buscarNotas"),
    url(r'^promedios/$',login_required(PromedioFin),name="promedios"),
    url(r'^administrar/$',login_required(administrarNotas),name="administrar"),
    url(r'^Anotacion/$',login_required(anotacion),name="Anotacion"),
    url(r'^administrarMaterias/$',login_required(MateriaList.as_view()),name="administrarMaterias"),
    url(r'^agregarMateria/$',login_required(materia_view), name='agregarMateria'),
    path('editarMateria/<str:codigo_materia>/',login_required(materia_edit),name="editarMateria"),
    path('eliminarMateria/<str:codigo_materia>/',login_required(materia_delete),name="eliminarMateria"),
    url(r'^agregarEvaluacion/$',login_required(agregarEvaluacion),name="agregarEvaluacion"),
    url(r'^listaEvaluacion/$',login_required(listaEvaluacion),name="listaEvaluacion"),
    path('editarEvaluacion/<str:id_evaluacion>/',login_required(editarEvaluacion),name="editarEvaluacion"),
    path('eliminarDocente/<str:id_del_docente>/',login_required(docente_delete),name='docente-delete'),
    path('detalleDocente/<str:id_del_docente>/',login_required(docente_detalle),name='docente_detalle'),
    path('actualizarDocente/<str:id_del_docente>/',login_required(docente_edit),name='docente_actualizar'),
    url(r'^buscarMaterias/$',login_required(buscarMaterias),name="buscarMaterias"),
    url(r'^buscarEvaluaciones/$',login_required(buscarEvaluaciones),name="buscarEvaluaciones"),
    #Parte de Alumnos

    url(r'^ListadoAlumnos/$',login_required(ListadoAlumnos.as_view()),name="alumno_list"),
    url(r'^ListadoAlumnos/creargrado$',login_required(CrearGrado2.as_view()),name="crear_grado"),
    url(r'^busqueda_especialidad/$',login_required(BusquedaEspecialidad.as_view()),name="busqueda_especialidad"),
    url(r'^busqueda_seccion/$',login_required(BusquedaSeccion.as_view()),name="busqueda_seccion"),
    url(r'^busqueda_docente/$',login_required(BusquedaDocente.as_view()),name="busqueda_docente"),
    url(r'^busqueda_grupo/$',login_required(BusquedaGrupo.as_view()),name="busqueda_grupo"),
    url(r'^guardar_alumno/$',login_required(RegistroAlumno.as_view()),name="guardar_alumno"),

    #Finalizacion de la parte de alumnos
    url(r'^servidorActividades/$',login_required(servidorActividades),name="servidorActividades"),
     url(r'^actualizarUser/$',login_required(actualizarUser),name="actualizarUser"),


     url(r'^CargarGrupos/$',login_required(CargarGrupos),name="CargarGrupos"),

]
