from django.contrib import admin
from apps.INTO.models import *
# Register your models here.
admin.site.register(Docente)
admin.site.register(TipoUsuario)
admin.site.register(asignacionTipoUsuario)
admin.site.register(Especialidad)
admin.site.register(Encargado)
admin.site.register(Alumno)
admin.site.register(Materia)
admin.site.register(Especialidad_Materia)
admin.site.register(Grupo)
admin.site.register(Alumno_Grupo)
admin.site.register(AnioLectivo)
admin.site.register(Periodo)
admin.site.register(Tipo_actividad)
admin.site.register(Actividad)
admin.site.register(Sub_Actividad)
admin.site.register(Docente_Materia)
admin.site.register(Evaluacion)
admin.site.register(Calificacion)
admin.site.register(Anotacion)
