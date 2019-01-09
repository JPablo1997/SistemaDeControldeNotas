from django.db import models
from django.conf import settings
from django.contrib.auth.models import User


class TipoUsuario(models.Model):
    codigo_tipo_usuario = models.CharField(max_length=10,primary_key=True)
    tipo_usuario = models.CharField(max_length=25)
    descripcion_tipo_usuario = models.CharField(max_length=150)
    def __str__(self): 
    	return self.tipo_usuario 

class asignacionTipoUsuario(models.Model):
    usuario = models.OneToOneField(settings.AUTH_USER_MODEL,on_delete=models.CASCADE)
    tipo_usuario = models.ForeignKey(TipoUsuario,on_delete=models.CASCADE)
    def __str__(self): 
    	return self.usuario

class Docente(models.Model):
    dui_docente = models.CharField(max_length=10, primary_key=True)
    nombre_docente = models.CharField(max_length=50)
    apellidos_docente = models.CharField(max_length=50)
    fecha_nacimiento_docente = models.DateField()
    telefono_docente = models.CharField(max_length=9,blank=True,null=True)
    email_docente = models.EmailField()
    fecha_contratacion_docente = models.DateField(null=True)
    direccion_docente = models.CharField(max_length=50,null=True)
    usuario_docente = models.OneToOneField(settings.AUTH_USER_MODEL,on_delete=models.CASCADE,null=True)
    def __str__(self): 
    	return self.nombre_docente     

class Especialidad(models.Model):
    codigo_especialidad = models.CharField(max_length=10,primary_key=True)
    nombre_especialidad = models.CharField(max_length=50)
    descripcion_especialidad = models.CharField(max_length=150,null=True)
    anios_especialidad = models.IntegerField()
    def __str__(self): 
    	return self.nombre_especialidad 

class Encargado(models.Model):
    dui_encargado = models.CharField(max_length=12, primary_key=True)
    nombre_encargado = models.CharField(max_length=35)
    apellidos_encargado = models.CharField(max_length=35)
    email = models.CharField(max_length=35)
    telefono = models.CharField(max_length=10, null=True)
    celular = models.CharField(max_length=10)
    oficio_profesion = models.CharField(max_length=50)
    parentesco = models.CharField(max_length=20)
    def __str__(self): 
    	return self.nombre_encargado 

class Alumno(models.Model):
    nie = models.CharField(max_length=12, primary_key=True)
    nombre_alumno = models.CharField(max_length=50)
    apellidos_alumno = models.CharField(max_length=50)
    fecha_nacimiento_alumno = models.DateField()
    telefono_alumno = models.CharField(max_length=9,null=True)
    direccion_alumno = models.CharField(max_length=50,null=True)
    sexo_alumno = models.CharField(max_length=5)
    anio_ingreso = models.DateField()
    usuario_alumno = models.OneToOneField(settings.AUTH_USER_MODEL,on_delete=models.SET_NULL,null=True)
    especialidad_alumno = models.ForeignKey(Especialidad,on_delete=models.SET_NULL,null=True)
    encargado = models.ForeignKey(Encargado,on_delete=models.SET_NULL,null=True)
    def __str__(self): 
    	return self.nombre_alumno 

class Materia(models.Model):
    codigo_materia = models.CharField(max_length=15,primary_key=True)
    nombre_materia = models.CharField(max_length=30)
    descripcion_materia = models.CharField(max_length=150)
    objetivos = models.CharField(max_length=150)
    def __str__(self): 
    	return self.nombre_materia 

class Especialidad_Materia(models.Model):
    codigo_especialidad = models.ForeignKey(Especialidad,on_delete=models.CASCADE)
    codigo_materia = models.ForeignKey(Materia,on_delete=models.CASCADE)
    nivel_materia_especialidad = models.IntegerField()

class Grupo(models.Model):
    codigo_grupo = models.CharField(max_length=15,primary_key=True)
    nivel_especialidad = models.IntegerField(help_text="Ingrese el nivel de la especialidad de este grupo")
    seccion = models.CharField(max_length=8)    
    codigo_especialidad = models.ForeignKey(Especialidad,on_delete=models.CASCADE)
    codigo_docente_encargado = models.ForeignKey(Docente,on_delete=models.SET_NULL,null=True)
    def __str__(self): 
    	return self.codigo_grupo 

class Alumno_Grupo(models.Model):
    nie = models.OneToOneField(Alumno,on_delete=models.CASCADE)
    codigo_grupo =  models.ForeignKey(Grupo,on_delete=models.CASCADE)
    anio_cursado = models.IntegerField(help_text="Año en el cual el alumno esta/estuvo en ese grupo")
    def __str__(self):
        return '{} ({})'.format(self.nie,self.codigo_grupo)
class AnioLectivo(models.Model):
    anio_lectivo = models.IntegerField(primary_key=True)
    terminado = models.BooleanField(help_text="Indica si el año escolar ya ha finalizado")
    def __int__(self): 
    	return self.anio_lectivo 

class Periodo(models.Model):
    codigo_periodo = models.CharField(max_length=15,primary_key=True)
    anio_lectivo = models.ForeignKey(AnioLectivo,on_delete=models.CASCADE)
    finalizado = models.BooleanField(help_text="Indica si el periodo ya ha finalizado")
        
class Tipo_actividad(models.Model):
    codigo_tipo_actividad = models.CharField(max_length=10, primary_key=True)
    nombre_tipo_actividad = models.CharField(max_length=50)
    descripcion = models.CharField(max_length=150)
    def __str__(self): 
    	return self.nombre_tipo_actividad 

class Actividad(models.Model):
    codigo_actividad = models.CharField(max_length=15,primary_key=True)
    codigo_tipo_actividad = models.ForeignKey(Tipo_actividad,help_text="Ingrese el tipo de actividad, por ejemplo si es examen o exposicion", on_delete=models.CASCADE)
    porcentaje_actividad = models.DecimalField(max_digits=5,decimal_places=4)
    codigo_periodo = models.ForeignKey(Periodo,on_delete=models.CASCADE)
    cantidad_max_sub_act = models.IntegerField()
    def __str__(self): 
    	return self.codigo_actividad 

class Sub_Actividad(models.Model):
    codigo_sub_actividad = models.CharField(max_length=15,primary_key=True)
    codigo_actividad = models.ForeignKey(Actividad,on_delete=models.CASCADE)
    porcentaje_sub_actividad = models.DecimalField(max_digits=10,decimal_places=2)
    descripcion_sub_actividad = models.CharField(max_length=150,null=True)
    def __str__(self): 
    	return self.codigo_sub_actividad 

class Docente_Materia(models.Model):
    codigo_docente = models.ForeignKey(Docente,on_delete=models.CASCADE)
    codigo_materia = models.ForeignKey(Materia,on_delete=models.CASCADE)

class Evaluacion(models.Model):
    codigo_evaluacion = models.CharField(max_length=15,primary_key=True)
    nombre_evaluacion = models.CharField(max_length=50)
    descripcion_evaluacion = models.CharField(max_length= 150,null= True)
    codigo_docente_materia = models.ForeignKey(Docente_Materia,on_delete=models.CASCADE)
    codigo_sub_actividad = models.OneToOneField(Sub_Actividad,on_delete=models.CASCADE)
    def __str__(self): 
    	return self.codigo_evaluacion 

class Calificacion(models.Model):
    nie = models.ForeignKey(Alumno,on_delete=models.CASCADE)
    codigo_evaluacion = models.ForeignKey(Evaluacion,on_delete=models.CASCADE)
    nota = models.DecimalField(max_digits=10, decimal_places=2)

class Anotacion(models.Model):
    nie = models.ForeignKey(Alumno,on_delete=models.CASCADE)
    dui_docente = models.ForeignKey(Docente,on_delete=models.CASCADE)
    codigo_anotacion = models.CharField(max_length=10, primary_key=True)
    descripcion = models.CharField(max_length=150, null= False)
    fecha_anotacion = models.DateField()
    def __str__(self): 
    	return self.codigo_anotacion 
    
    
