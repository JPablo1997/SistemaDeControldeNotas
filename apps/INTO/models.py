from django.db import models
from django.conf import settings
from django.contrib.auth.models import AbstractUser,User

# Create your models here.

class TipoUsuario(models.Model):
    codigo_tipo_usuario = models.CharField(max_length=10,primary_key=True)
    tipo_usuario = models.CharField(max_length=25)
    descripcion_tipo_usuario = models.CharField(max_length=150)

class asignacionTipoUsuario(models.Model):
	class Meta:
		unique_together = (('usuario', 'tipo_usuario'),)
	usuario = models.OneToOneField(settings.AUTH_USER_MODEL,on_delete=models.CASCADE)
	tipo_usuario = models.OneToOneField(TipoUsuario,on_delete=models.CASCADE)

class Docente(models.Model):
    dui_docente = models.CharField(max_length=15, primary_key=True)
    nombre_docente = models.CharField(max_length=50)
    apellidos_docente = models.CharField(max_length=50)
    fecha_nacimiento_docente = models.DateField()
    telefono_docente = models.CharField(max_length=9,null=True)
    email_docente = models.EmailField()
    fecha_contratacion_docente = models.DateField(null=True)
    direccion_docente = models.CharField(max_length=50,null=True)
    usuario_docente = models.OneToOneField(settings.AUTH_USER_MODEL,on_delete=models.SET_NULL,null=True)
    

class Especialidad(models.Model):
    codigo_especialidad = models.CharField(max_length=10,primary_key=True)
    nombre_especialidad = models.CharField(max_length=50)
    descripcion_especialidad = models.CharField(max_length=150,null=True)
    años_especialidad = models.IntegerField()

class Alumno(models.Model):
    codigo_alumno = models.CharField(max_length=10, primary_key=True)
    nombre_alumno = models.CharField(max_length=50)
    apellidos_alumno = models.CharField(max_length=50)
    fecha_nacimiento_alumno = models.DateField()
    telefono_alumno = models.CharField(max_length=9,null=True)
    direccion_alumno = models.CharField(max_length=50,null=True)
    sexo_alumno = models.CharField(max_length=5)
    año_ingreso = models.DateField()
    usuario_alumno = models.OneToOneField(settings.AUTH_USER_MODEL,on_delete=models.SET_NULL,null=True)
    especialidad_alumno = models.OneToOneField(Especialidad,on_delete=models.SET_NULL,null=True)
    

class Materia(models.Model):
    codigo_materia = models.CharField(max_length=15,primary_key=True)
    nombre_materia = models.CharField(max_length=30)
    descripcion_materia = models.CharField(max_length=150)
    
class Especialidad_Materia(models.Model):
    codigo_especialidad = models.OneToOneField(Especialidad,on_delete=models.CASCADE)
    codigo_materia = models.OneToOneField(Materia,on_delete=models.CASCADE)
    nivel_materia = models.IntegerField()
    
class Grupo(models.Model):
    codigo_grupo = models.CharField(max_length=15,primary_key=True)
    nivel = models.IntegerField(help_text="Ingrese el nivel de la especialidad de este grupo")
    seccion = models.CharField(max_length=8)
    codigo_especialidad = models.ForeignKey(Especialidad,on_delete=models.SET_NULL,null=True)
    codigo_docente_encargado = models.ForeignKey(Docente,on_delete=models.SET_NULL,null=True)

class Alumno_Grupo(models.Model):
    codigo_alumno = models.OneToOneField(Alumno,on_delete=models.CASCADE)
    codigo_grupo =  models.OneToOneField(Grupo,on_delete=models.CASCADE)
    año = models.IntegerField(help_text="Año en el cual el alumno esta en ese grupo")
    
class AnioLectivo(models.Model):
    año_lectivo = models.IntegerField(primary_key=True)
    terminado = models.BooleanField(help_text="Indica si el año escolar ya ha finalizado")
    
    
class Periodo(models.Model):
    codigo_periodo = models.CharField(max_length=15,primary_key=True)
    año_lectivo = models.ForeignKey(AnioLectivo,on_delete=models.SET_NULL,null=True)
    finalizado = models.BooleanField(help_text="Indica si el periodo ya ha finalizado")
        
    
class Actividad(models.Model):
    codigo_actividad = models.CharField(max_length=15,primary_key=True)
    tipo_actividad = models.CharField(max_length=25,help_text="Ingrese el tipo de actividad, por ejemplo si es examen o exposicion")
    categoria_actividad = models.IntegerField()
    porcentaje_actividad = models.DecimalField(max_digits=5,decimal_places=4)
    codigo_periodo = models.ForeignKey(Periodo,on_delete=models.SET_NULL,null=True)


class Sub_Actividad(models.Model):
    codigo_sub_actividad = models.CharField(max_length=15,primary_key=True)
    codigo_actividad = models.ForeignKey(Actividad,on_delete=models.CASCADE)
    porcentaje_sub_actividad = models.DecimalField(max_digits=5,decimal_places=4)
    descripcion_sub_actividad = models.CharField(max_length=150,null=True)
    
class Evaluacion(models.Model):
    codigo_evaluacion = models.CharField(max_length=15,primary_key=True)
    nombre_evaluacion = models.CharField(max_length=50)
    categoria_evaluacion = models.IntegerField()
    porcentaje_sub_actividad = models.DecimalField(max_digits=5,decimal_places=4)
    codigo_sub_actividad = models.ForeignKey(Sub_Actividad,on_delete=models.CASCADE)
    codigo_docente = models.ForeignKey(Docente,on_delete=models.CASCADE)
    codigo_materia = models.ForeignKey(Materia,on_delete=models.CASCADE)
    descripcion_evaluacion = models.CharField(max_length= 150,null= True)
    
class Calificacion(models.Model):
    codigo_alumno = models.OneToOneField(Alumno,on_delete=models.CASCADE)
    codigo_evaluacion = models.OneToOneField(Evaluacion,on_delete=models.CASCADE)
    nota = models.DecimalField(max_digits=4,decimal_places=4)
    codigo_materia = models.OneToOneField(Materia,on_delete=models.CASCADE)
    codigo_sub_actividad = models.OneToOneField(Sub_Actividad,on_delete=models.CASCADE)
    
class Alumno_Sub_Actividad(models.Model):
    codigo_sub_actividad = models.OneToOneField(Sub_Actividad,on_delete=models.CASCADE)
    codigo_alumno = models.OneToOneField(Alumno,on_delete=models.CASCADE)
    porcentaje_obtenido = models.DecimalField(max_digits=4,decimal_places=4,help_text="Nota*PorcentajeEvaSubActividad")
    codigo_materia = models.OneToOneField(Materia,on_delete=models.CASCADE)
    codigo_actividad = models.OneToOneField(Actividad,on_delete=models.CASCADE)
    
class Alumno_Actividad(models.Model):
    codigo_actividad = models.OneToOneField(Actividad,on_delete=models.CASCADE)
    codigo_alumno = models.OneToOneField(Alumno,on_delete=models.CASCADE)
    codigo_materia = models.OneToOneField(Materia,on_delete=models.CASCADE)
    codigo_periodo = models.OneToOneField(Periodo,on_delete=models.CASCADE)
    promedio_actividad_alumno = models.DecimalField(max_digits=4,decimal_places=4)
    
class Alumno_Periodo(models.Model):
    codigo_periodo = models.OneToOneField(Periodo,on_delete=models.CASCADE)
    codigo_alumno = models.OneToOneField(Alumno,on_delete=models.CASCADE)
    codigo_materia = models.OneToOneField(Materia,on_delete=models.CASCADE)
    codigo_año_lectivo = models.OneToOneField(AnioLectivo,on_delete=models.CASCADE)
    promedio_periodo_alumno = models.DecimalField(max_digits=4,decimal_places=4)
    
class Alumno_AnioLectivo(models.Model):
    codigo_alumno = models.OneToOneField(Alumno,on_delete=models.CASCADE)
    codigo_año_lectivo = models.OneToOneField(AnioLectivo,on_delete=models.CASCADE)
    codigo_materia = models.OneToOneField(Materia,on_delete=models.CASCADE)
    promedio_año_lectivo = models.DecimalField(max_digits=4,decimal_places=4)
    aprobado = models.BooleanField()
    
	
