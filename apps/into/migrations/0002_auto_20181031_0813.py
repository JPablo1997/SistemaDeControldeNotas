# Generated by Django 2.0.5 on 2018-10-31 14:13

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('INTO', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='asignaciontipousuario',
            name='tipo_usuario',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='INTO.TipoUsuario'),
        ),
    ]
