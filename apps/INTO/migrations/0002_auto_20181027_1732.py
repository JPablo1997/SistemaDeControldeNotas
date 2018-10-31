# Generated by Django 2.0.5 on 2018-10-27 23:32

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('INTO', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='alumno_grupo',
            name='codigo_grupo',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='INTO.Grupo'),
        ),
        migrations.AlterField(
            model_name='calificacion',
            name='codigo_evaluacion',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='INTO.Evaluacion'),
        ),
        migrations.AlterField(
            model_name='calificacion',
            name='nie',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='INTO.Alumno'),
        ),
        migrations.AlterField(
            model_name='calificacion',
            name='nota',
            field=models.DecimalField(decimal_places=2, max_digits=10),
        ),
    ]