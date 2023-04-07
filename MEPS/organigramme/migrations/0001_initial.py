# Generated by Django 4.1.6 on 2023-04-05 12:14

from django.db import migrations, models
import django.utils.timezone


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Organigramme',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('post_published_on', models.DateTimeField(default=django.utils.timezone.now, verbose_name='Published On')),
                ('post_created_on', models.DateTimeField(auto_now_add=True, verbose_name='Created On')),
                ('post_modified_on', models.DateTimeField(auto_now=True, verbose_name='Modified On')),
                ('post_status', models.CharField(choices=[('draft', 'Draft'), ('published', 'Published')], default='draft', max_length=10, verbose_name='Status')),
                ('comment_status', models.CharField(choices=[('opened', 'Opened'), ('closed', 'Closed')], default='opened', max_length=10, verbose_name='Comment status')),
                ('comment_count', models.PositiveIntegerField(default=0)),
                ('pdf', models.FileField(upload_to='PDF/organigramme/%Y/%m/%d/')),
                ('title', models.CharField(default='Organigramme du MEPS', max_length=100)),
                ('slug', models.SlugField(max_length=100)),
                ('description', models.TextField(blank=True, max_length=1000)),
            ],
            options={
                'verbose_name_plural': 'page',
            },
        ),
    ]