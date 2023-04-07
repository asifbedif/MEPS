# Generated by Django 4.1.6 on 2023-04-05 12:14

import ckeditor_uploader.fields
from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone
import taggit.managers
import uuid


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('taggit', '0005_auto_20220424_2025'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('Users', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Category',
            fields=[
                ('category_id', models.UUIDField(default=uuid.uuid4, editable=False, primary_key=True, serialize=False, unique=True, verbose_name='ID')),
                ('category_name', models.CharField(max_length=50, verbose_name='Name')),
                ('category_slug', models.SlugField(unique=True, verbose_name='Slug')),
            ],
            options={
                'verbose_name_plural': 'Categories',
            },
        ),
        migrations.CreateModel(
            name='Contact',
            fields=[
                ('contact_id', models.SmallAutoField(primary_key=True, serialize=False)),
                ('address', models.CharField(blank=True, max_length=200, verbose_name='addresse')),
                ('tel', models.CharField(blank=True, max_length=50, verbose_name='Téléphone')),
                ('email', models.EmailField(blank=True, max_length=50, verbose_name='Email')),
                ('horaire', models.CharField(blank=True, max_length=1000, verbose_name='Horaire')),
            ],
        ),
        migrations.CreateModel(
            name='ContactAddress',
            fields=[
                ('address_id', models.SmallAutoField(primary_key=True, serialize=False)),
                ('address', models.CharField(blank=True, max_length=200, verbose_name='addresse')),
            ],
        ),
        migrations.CreateModel(
            name='ContactEmail',
            fields=[
                ('email_id', models.SmallAutoField(primary_key=True, serialize=False)),
                ('email', models.EmailField(blank=True, max_length=50, verbose_name='Email')),
            ],
        ),
        migrations.CreateModel(
            name='ContactHoraire',
            fields=[
                ('horaire_id', models.SmallAutoField(primary_key=True, serialize=False)),
                ('horaire', models.CharField(blank=True, max_length=1000, verbose_name='Horaire')),
            ],
        ),
        migrations.CreateModel(
            name='ContactTel',
            fields=[
                ('tel_id', models.SmallAutoField(primary_key=True, serialize=False)),
                ('tel', models.CharField(blank=True, max_length=50, verbose_name='Téléphone')),
            ],
        ),
        migrations.CreateModel(
            name='Direction',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('image', models.ImageField(null=True, upload_to='images/directions/')),
                ('full_form_name', models.CharField(max_length=1000)),
                ('short_form_name', models.CharField(blank=True, max_length=10)),
                ('slug', models.SlugField(allow_unicode=True, blank=True, max_length=1000)),
                ('content', models.TextField(blank=True)),
                ('status', models.CharField(choices=[('draft', 'Draft'), ('published', 'Published')], default='draft', max_length=10, verbose_name='Status')),
                ('published_on', models.DateTimeField(auto_now_add=True)),
                ('modified_on', models.DateTimeField(auto_now=True)),
            ],
            options={
                'ordering': ['short_form_name'],
            },
        ),
        migrations.CreateModel(
            name='DirectionDetail',
            fields=[
                ('DirectionDetail_id', models.SmallAutoField(primary_key=True, serialize=False)),
                ('image', models.ImageField(null=True, upload_to='images/directions/')),
                ('full_form_name', models.CharField(max_length=100)),
                ('short_form_name', models.CharField(max_length=10)),
                ('slug', models.SlugField(max_length=150, unique=True)),
                ('description', models.TextField(blank=True, max_length=5000)),
                ('status', models.CharField(choices=[('draft', 'Draft'), ('published', 'Published')], default='draft', max_length=10, verbose_name='Status')),
                ('published_on', models.DateTimeField(auto_now_add=True)),
                ('modified_on', models.DateTimeField(auto_now=True)),
            ],
            options={
                'verbose_name_plural': 'page',
                'ordering': ['-published_on'],
            },
        ),
        migrations.CreateModel(
            name='DirectionSidebar',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(blank=True, max_length=100)),
            ],
            options={
                'ordering': ['name'],
            },
        ),
        migrations.CreateModel(
            name='HeaderBanner',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(default='image banner', max_length=200)),
                ('image', models.ImageField(default='', null=True, upload_to='images/logo')),
                ('link', models.URLField()),
            ],
            options={
                'verbose_name': 'Header Banner',
                'verbose_name_plural': 'Header Banner',
            },
        ),
        migrations.CreateModel(
            name='HeaderLeftLogo',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(default='Logo', max_length=200)),
                ('image', models.ImageField(default='', null=True, upload_to='images/logo')),
                ('link', models.URLField()),
            ],
            options={
                'verbose_name': 'Header Left',
                'verbose_name_plural': 'Header Left',
            },
        ),
        migrations.CreateModel(
            name='HeaderRightLogo',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(default='Logo', max_length=200)),
                ('image', models.ImageField(default='', null=True, upload_to='images/logo')),
                ('link', models.URLField()),
            ],
            options={
                'verbose_name': 'Header Right',
                'verbose_name_plural': 'Header Right',
            },
        ),
        migrations.CreateModel(
            name='Mission',
            fields=[
                ('mission_id', models.SmallAutoField(primary_key=True, serialize=False)),
                ('title', models.CharField(blank=True, max_length=100)),
            ],
        ),
        migrations.CreateModel(
            name='Objectif',
            fields=[
                ('objectif_id', models.SmallAutoField(primary_key=True, serialize=False)),
                ('objectif', models.CharField(blank=True, max_length=100)),
            ],
        ),
        migrations.CreateModel(
            name='PdfDocument',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('file', models.FileField(upload_to='documents/%Y/%m/%d')),
                ('title', models.CharField(max_length=200)),
                ('slug', models.SlugField(allow_unicode=True, blank=True, max_length=250)),
            ],
            options={
                'ordering': ['title'],
            },
        ),
        migrations.CreateModel(
            name='PdfType',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('type', models.CharField(max_length=255, unique=True)),
                ('slug', models.SlugField(allow_unicode=True, blank=True, max_length=100)),
            ],
        ),
        migrations.CreateModel(
            name='Project',
            fields=[
                ('project_id', models.SmallAutoField(primary_key=True, serialize=False)),
                ('project', models.CharField(blank=True, max_length=100)),
            ],
        ),
        migrations.CreateModel(
            name='Slider',
            fields=[
                ('slideID', models.AutoField(primary_key=True, serialize=False)),
                ('slide_image', models.ImageField(blank=True, null=True, upload_to='images/main-slider', verbose_name='Image')),
                ('slide_title', models.CharField(blank=True, max_length=150, null=True, verbose_name='Title')),
                ('slide_subtitle', models.CharField(blank=True, max_length=250, null=True, verbose_name='Subtitle')),
                ('slide_link', models.SlugField(blank=True, max_length=200, null=True, unique=True)),
                ('visible', models.BooleanField(default=False)),
            ],
            options={
                'verbose_name': 'Slider',
                'verbose_name_plural': 'Sliders',
            },
        ),
        migrations.CreateModel(
            name='SousDirection',
            fields=[
                ('sous_direction_id', models.SmallAutoField(primary_key=True, serialize=False)),
                ('sous_direction', models.CharField(blank=True, max_length=100)),
            ],
        ),
        migrations.CreateModel(
            name='Post',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('post_published_on', models.DateTimeField(default=django.utils.timezone.now, verbose_name='Published On')),
                ('post_created_on', models.DateTimeField(auto_now_add=True, verbose_name='Created On')),
                ('post_modified_on', models.DateTimeField(auto_now=True, verbose_name='Modified On')),
                ('post_status', models.CharField(choices=[('draft', 'Draft'), ('published', 'Published')], default='draft', max_length=10, verbose_name='Status')),
                ('comment_status', models.CharField(choices=[('opened', 'Opened'), ('closed', 'Closed')], default='opened', max_length=10, verbose_name='Comment status')),
                ('comment_count', models.PositiveIntegerField(default=0)),
                ('post_image', models.ImageField(null=True, upload_to='images/posts/%Y/%m/%d/', verbose_name='Feature Image')),
                ('post_title', models.CharField(max_length=250, verbose_name='Title')),
                ('post_slug', models.SlugField(max_length=250, unique_for_date='post_published_on', verbose_name='Slug')),
                ('post_content', ckeditor_uploader.fields.RichTextUploadingField(blank=True, verbose_name='content')),
                ('post_place', models.CharField(default='Abidjan', max_length=250, verbose_name='Lieu')),
                ('post_tags', taggit.managers.TaggableManager(blank=True, help_text='A comma-separated list of tags.', through='taggit.TaggedItem', to='taggit.Tag', verbose_name='Tags')),
                ('published_by', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='meps_admin_posts', to=settings.AUTH_USER_MODEL)),
                ('written_by', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='Users.writter')),
            ],
        ),
        migrations.CreateModel(
            name='Comment',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('comment_author_name', models.CharField(max_length=100, verbose_name='Name')),
                ('comment_author_email', models.EmailField(default='', max_length=254, verbose_name='Email')),
                ('comment_author_phone', models.CharField(blank=True, default='', max_length=15, verbose_name='Phone')),
                ('comment_content', models.TextField(verbose_name='Comment')),
                ('comment_posted_on', models.DateTimeField(auto_now_add=True, verbose_name='Posted On')),
                ('comment_updated_on', models.DateTimeField(auto_now=True, verbose_name='Modified On')),
                ('comment_approved', models.BooleanField(default=True, verbose_name='Approved')),
                ('comment_parent', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='replies', to='MEPS_ADMIN.comment')),
                ('comment_post', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='comments', to='MEPS_ADMIN.post', verbose_name='Related post')),
            ],
            options={
                'ordering': ('-comment_posted_on',),
            },
        ),
        migrations.AddIndex(
            model_name='post',
            index=models.Index(fields=['-post_published_on'], name='MEPS_ADMIN__post_pu_fa5a0c_idx'),
        ),
    ]
