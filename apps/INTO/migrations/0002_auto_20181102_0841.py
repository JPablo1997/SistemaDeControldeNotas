# Generated by Django 2.0.5 on 2018-11-02 14:41

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('INTO', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='docente',
            name='dui_docente',
            field=models.CharField(max_length=10, primary_key=True, serialize=False),
        ),
    ]
