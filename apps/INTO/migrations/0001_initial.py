

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Actividad',
            fields=[


                ('codigo_actividad', models.CharField(max_length=30, primary_key=True, serialize=False)),

                ('porcentaje_actividad', models.DecimalField(decimal_places=4, max_digits=5)),
                ('cantidad_max_sub_act', models.IntegerField()),
            ],
        ),
        migrations.CreateModel(
            name='Alumno',
            fields=[
                ('nie', models.CharField(max_length=12, primary_key=True, serialize=False)),
                ('nombre_alumno', models.CharField(max_length=50)),
                ('apellidos_alumno', models.CharField(max_length=50)),
                ('fecha_nacimiento_alumno', models.DateField()),
                ('telefono_alumno', models.CharField(max_length=9, null=True)),
                ('direccion_alumno', models.CharField(max_length=50, null=True)),
                ('sexo_alumno', models.CharField(max_length=5)),
                ('anio_ingreso', models.DateField()),
            ],
        ),
        migrations.CreateModel(
            name='Alumno_Grupo',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
            ],
        ),
        migrations.CreateModel(
            name='AnioLectivo',
            fields=[
                ('anio_lectivo', models.IntegerField(primary_key=True, serialize=False)),
                ('terminado', models.BooleanField(help_text='Indica si el año escolar ya ha finalizado')),
            ],
        ),
        migrations.CreateModel(
            name='Anotacion',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('descripcion', models.CharField(max_length=150)),
                ('fecha_anotacion', models.DateField()),
            ],
        ),
        migrations.CreateModel(
            name='asignacionTipoUsuario',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
            ],
        ),
        migrations.CreateModel(
            name='Calificacion',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nota', models.DecimalField(decimal_places=2, max_digits=10)),
            ],
        ),
        migrations.CreateModel(
            name='Docente',
            fields=[
                ('dui_docente', models.CharField(max_length=10, primary_key=True, serialize=False)),
                ('nombre_docente', models.CharField(max_length=50)),
                ('apellidos_docente', models.CharField(max_length=50)),
                ('fecha_nacimiento_docente', models.DateField()),
                ('telefono_docente', models.CharField(blank=True, max_length=9, null=True)),
                ('email_docente', models.EmailField(max_length=254)),
                ('fecha_contratacion_docente', models.DateField(null=True)),
                ('direccion_docente', models.CharField(max_length=50, null=True)),
                ('usuario_docente', models.OneToOneField(null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Docente_Materia',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('codigo_docente', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='INTO.Docente')),
            ],
        ),
        migrations.CreateModel(
            name='Encargado',
            fields=[
                ('dui_encargado', models.CharField(max_length=12, primary_key=True, serialize=False)),
                ('nombre_encargado', models.CharField(max_length=35)),
                ('apellidos_encargado', models.CharField(max_length=35)),

                ('email', models.CharField(max_length=35)),
                ('telefono', models.CharField(max_length=10, null=True)),
                ('celular', models.CharField(max_length=10)),
                ('oficio_profesion', models.CharField(max_length=50)),

                ('parentesco', models.CharField(max_length=20)),
            ],
        ),
        migrations.CreateModel(
            name='Especialidad',
            fields=[
                ('codigo_especialidad', models.CharField(max_length=10, primary_key=True, serialize=False)),
                ('nombre_especialidad', models.CharField(max_length=50)),
                ('descripcion_especialidad', models.CharField(max_length=150, null=True)),
                ('anios_especialidad', models.IntegerField()),
            ],
        ),
        migrations.CreateModel(
            name='Especialidad_Materia',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nivel_materia_especialidad', models.IntegerField()),
                ('codigo_especialidad', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='INTO.Especialidad')),
            ],
        ),
        migrations.CreateModel(
            name='Evaluacion',
            fields=[

                ('codigo_evaluacion', models.CharField(max_length=35, primary_key=True, serialize=False)),

                ('nombre_evaluacion', models.CharField(max_length=50)),
                ('descripcion_evaluacion', models.CharField(max_length=150, null=True)),
                ('codigo_docente_materia', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='INTO.Docente_Materia')),
            ],
        ),
        migrations.CreateModel(
            name='Grupo',
            fields=[
                ('codigo_grupo', models.CharField(max_length=15, primary_key=True, serialize=False)),
                ('nivel_especialidad', models.IntegerField(help_text='Ingrese el nivel de la especialidad de este grupo')),
                ('seccion', models.CharField(max_length=8)),
                ('anio', models.IntegerField(help_text='Año en el que se creo el grupo')),
                ('codigo_docente_encargado', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='INTO.Docente')),
                ('codigo_especialidad', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='INTO.Especialidad')),
            ],
        ),
        migrations.CreateModel(
            name='Materia',
            fields=[
                ('codigo_materia', models.CharField(max_length=15, primary_key=True, serialize=False)),
                ('nombre_materia', models.CharField(max_length=30)),
                ('descripcion_materia', models.CharField(max_length=150)),
                ('objetivos', models.CharField(max_length=150)),
            ],
        ),
        migrations.CreateModel(
            name='Periodo',
            fields=[
                ('codigo_periodo', models.CharField(max_length=15, primary_key=True, serialize=False)),
                ('finalizado', models.BooleanField(help_text='Indica si el periodo ya ha finalizado')),
                ('anio_lectivo', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='INTO.AnioLectivo')),
            ],
        ),
        migrations.CreateModel(
            name='Sub_Actividad',
            fields=[

                ('codigo_sub_actividad', models.CharField(max_length=25, primary_key=True, serialize=False)),

                ('porcentaje_sub_actividad', models.DecimalField(decimal_places=2, max_digits=10)),
                ('descripcion_sub_actividad', models.CharField(max_length=150, null=True)),
                ('codigo_actividad', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='INTO.Actividad')),
            ],
        ),
        migrations.CreateModel(
            name='Tipo_actividad',
            fields=[
                ('codigo_tipo_actividad', models.CharField(max_length=15, primary_key=True, serialize=False)),

                ('nombre_tipo_actividad', models.CharField(max_length=50)),
                ('descripcion', models.CharField(max_length=150)),
            ],
        ),
        migrations.CreateModel(
            name='TipoUsuario',
            fields=[
                ('codigo_tipo_usuario', models.CharField(max_length=10, primary_key=True, serialize=False)),
                ('tipo_usuario', models.CharField(max_length=25)),
                ('descripcion_tipo_usuario', models.CharField(max_length=150)),
            ],
        ),
        migrations.AddField(
            model_name='evaluacion',
            name='codigo_sub_actividad',
            field=models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to='INTO.Sub_Actividad'),
        ),
        migrations.AddField(
            model_name='especialidad_materia',
            name='codigo_materia',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='INTO.Materia'),
        ),
        migrations.AddField(
            model_name='docente_materia',
            name='codigo_materia',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='INTO.Materia'),
        ),
        migrations.AddField(
            model_name='calificacion',
            name='codigo_evaluacion',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='INTO.Evaluacion'),
        ),
        migrations.AddField(
            model_name='calificacion',
            name='nie',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='INTO.Alumno'),
        ),
        migrations.AddField(
            model_name='asignaciontipousuario',
            name='tipo_usuario',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='INTO.TipoUsuario'),
        ),
        migrations.AddField(
            model_name='asignaciontipousuario',
            name='usuario',
            field=models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL),
        ),
        migrations.AddField(
            model_name='anotacion',
            name='dui_docente',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='INTO.Docente'),
        ),
        migrations.AddField(
            model_name='anotacion',
            name='nie',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='INTO.Alumno'),
        ),
        migrations.AddField(
            model_name='alumno_grupo',
            name='codigo_grupo',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='INTO.Grupo'),
        ),
        migrations.AddField(
            model_name='alumno_grupo',
            name='nie',
            field=models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to='INTO.Alumno'),
        ),
        migrations.AddField(
            model_name='alumno',
            name='encargado',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='INTO.Encargado'),
        ),
        migrations.AddField(
            model_name='alumno',
            name='especialidad_alumno',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='INTO.Especialidad'),
        ),
        migrations.AddField(
            model_name='alumno',
            name='usuario_alumno',
            field=models.OneToOneField(null=True, on_delete=django.db.models.deletion.SET_NULL, to=settings.AUTH_USER_MODEL),
        ),
        migrations.AddField(
            model_name='actividad',
            name='codigo_periodo',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='INTO.Periodo'),
        ),
        migrations.AddField(
            model_name='actividad',
            name='codigo_tipo_actividad',
            field=models.ForeignKey(help_text='Ingrese el tipo de actividad, por ejemplo si es examen o exposicion', on_delete=django.db.models.deletion.CASCADE, to='INTO.Tipo_actividad'),
        ),
    ]
