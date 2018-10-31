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
<<<<<<< HEAD
from apps.INTO.views import Vista,ListDocentesAdmin,CrearDocentesAdmin, IngresarNotas,DatosEstadisticos,administrarNotas, MateriaList, MateriaCreate, materia_edit, materia_delete
=======
<<<<<<< HEAD
from apps.INTO.views import Vista,ListDocentesAdmin,CrearDocentesAdmin, IngresarNotas,\
DatosEstadisticos,administrarNotas,creardocente
=======
from apps.INTO.views import Vista,ListDocentesAdmin,CrearDocentesAdmin, IngresarNotas,DatosEstadisticos,administrarNotas, agregarEvaluacion
>>>>>>> 2da27060cd725831ff56402c3e459f05eb1197a4
>>>>>>> 4811cd17c63e9ab19ba98756ac3cab9723cca482
from django.contrib.auth.views import login
from django.contrib.auth.decorators import login_required
 
urlpatterns = [  
    url(r'^index/$',login_required(Vista.as_view()),name="index"),
    url(r'^docentes/$',login_required(ListDocentesAdmin.as_view()),name="docentes-list"),
    url(r'^nuevoDocente/$',login_required(creardocente),name="docente-new"),
    url(r'^ingresarNotas/$',login_required(IngresarNotas),name="ingresarNotas"),
    url(r'^estadisticas/$',login_required(DatosEstadisticos.as_view()),name="estadisticas"),
    url(r'^administrar/$',login_required(administrarNotas.administrar),name="administrar"),
<<<<<<< HEAD
    url(r'^administrarMaterias/$',login_required(MateriaList.as_view()),name="administrarMaterias"),
    url(r'^agregarMateria/$',login_required(MateriaCreate.as_view()),name="agregarMateria"),
    path('editarMateria/<str:codigo_materia>/',login_required(materia_edit),name="editarMateria"),
    path('eliminarMateria/<str:codigo_materia>/',login_required(materia_delete),name="eliminarMateria"),
=======
    url(r'^agregarEvaluacion/$',login_required(agregarEvaluacion),name="agregarEvaluacion"),
>>>>>>> 4811cd17c63e9ab19ba98756ac3cab9723cca482

]
