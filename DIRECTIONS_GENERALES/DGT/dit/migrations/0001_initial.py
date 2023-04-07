# Generated by Django 4.1.6 on 2023-04-05 12:14

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('MEPS_ADMIN', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Dit',
            fields=[
                ('directiondetail_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='MEPS_ADMIN.directiondetail')),
            ],
            options={
                'verbose_name_plural': 'Page',
            },
            bases=('MEPS_ADMIN.directiondetail',),
        ),
        migrations.CreateModel(
            name='DitSousDirection',
            fields=[
                ('sousdirection_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='MEPS_ADMIN.sousdirection')),
                ('dit_Sous_direction', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='dit.dit')),
            ],
            bases=('MEPS_ADMIN.sousdirection',),
        ),
        migrations.CreateModel(
            name='DitProject',
            fields=[
                ('project_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='MEPS_ADMIN.project')),
                ('dit_Project', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='dit.dit')),
            ],
            bases=('MEPS_ADMIN.project',),
        ),
        migrations.CreateModel(
            name='DitObjectif',
            fields=[
                ('objectif_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='MEPS_ADMIN.objectif')),
                ('dit_Objectif', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='dit.dit')),
            ],
            bases=('MEPS_ADMIN.objectif',),
        ),
        migrations.CreateModel(
            name='DitMission',
            fields=[
                ('mission_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='MEPS_ADMIN.mission')),
                ('dit_Mission', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='dit.dit')),
            ],
            bases=('MEPS_ADMIN.mission',),
        ),
        migrations.CreateModel(
            name='DitContactTel',
            fields=[
                ('contacttel_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='MEPS_ADMIN.contacttel')),
                ('dit_ContactTel', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='dit.dit')),
            ],
            bases=('MEPS_ADMIN.contacttel',),
        ),
        migrations.CreateModel(
            name='DitContactHoraire',
            fields=[
                ('contacthoraire_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='MEPS_ADMIN.contacthoraire')),
                ('dit_ContactHoraire', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='dit.dit')),
            ],
            bases=('MEPS_ADMIN.contacthoraire',),
        ),
        migrations.CreateModel(
            name='DitContactEmail',
            fields=[
                ('contactemail_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='MEPS_ADMIN.contactemail')),
                ('dit_ContactEmail', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='dit.dit')),
            ],
            bases=('MEPS_ADMIN.contactemail',),
        ),
        migrations.CreateModel(
            name='DitContactAddress',
            fields=[
                ('contactaddress_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='MEPS_ADMIN.contactaddress')),
                ('dit_ContactAddress', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='dit.dit')),
            ],
            bases=('MEPS_ADMIN.contactaddress',),
        ),
        migrations.CreateModel(
            name='DitContact',
            fields=[
                ('contact_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='MEPS_ADMIN.contact')),
                ('dit_Contact', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='dit.dit')),
            ],
            bases=('MEPS_ADMIN.contact',),
        ),
    ]
