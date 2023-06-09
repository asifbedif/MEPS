# Generated by Django 4.1.6 on 2023-04-05 12:14

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Dgps',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('full_form_name', models.CharField(default='Direction Générale de  la Protection Sociale', max_length=100, verbose_name='title')),
                ('short_form_name', models.CharField(max_length=10, verbose_name='sigle')),
                ('slug', models.SlugField(max_length=100)),
                ('description', models.TextField(blank=True, max_length=1000)),
                ('status', models.CharField(choices=[('draft', 'Draft'), ('published', 'Published')], default='draft', max_length=10, verbose_name='Status')),
            ],
            options={
                'verbose_name': 'DGPS',
                'verbose_name_plural': 'page',
            },
        ),
    ]
