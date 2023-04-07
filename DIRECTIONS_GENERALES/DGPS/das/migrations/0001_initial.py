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
            name='Das',
            fields=[
                ('directiondetail_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='MEPS_ADMIN.directiondetail')),
            ],
            options={
                'verbose_name_plural': 'Page',
            },
            bases=('MEPS_ADMIN.directiondetail',),
        ),
        migrations.CreateModel(
            name='DasSousDirection',
            fields=[
                ('sousdirection_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='MEPS_ADMIN.sousdirection')),
                ('das_Sous_direction', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='das.das')),
            ],
            bases=('MEPS_ADMIN.sousdirection',),
        ),
        migrations.CreateModel(
            name='DasProject',
            fields=[
                ('project_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='MEPS_ADMIN.project')),
                ('das_Project', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='das.das')),
            ],
            bases=('MEPS_ADMIN.project',),
        ),
        migrations.CreateModel(
            name='DasObjectif',
            fields=[
                ('objectif_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='MEPS_ADMIN.objectif')),
                ('das_Objectif', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='das.das')),
            ],
            bases=('MEPS_ADMIN.objectif',),
        ),
        migrations.CreateModel(
            name='DasMission',
            fields=[
                ('mission_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='MEPS_ADMIN.mission')),
                ('das_Mission', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='das.das')),
            ],
            bases=('MEPS_ADMIN.mission',),
        ),
        migrations.CreateModel(
            name='DasContactTel',
            fields=[
                ('contacttel_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='MEPS_ADMIN.contacttel')),
                ('das_ContactTel', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='das.das')),
            ],
            bases=('MEPS_ADMIN.contacttel',),
        ),
        migrations.CreateModel(
            name='DasContactHoraire',
            fields=[
                ('contacthoraire_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='MEPS_ADMIN.contacthoraire')),
                ('das_ContactHoraire', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='das.das')),
            ],
            bases=('MEPS_ADMIN.contacthoraire',),
        ),
        migrations.CreateModel(
            name='DasContactEmail',
            fields=[
                ('contactemail_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='MEPS_ADMIN.contactemail')),
                ('das_ContactEmail', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='das.das')),
            ],
            bases=('MEPS_ADMIN.contactemail',),
        ),
        migrations.CreateModel(
            name='DasContactAddress',
            fields=[
                ('contactaddress_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='MEPS_ADMIN.contactaddress')),
                ('das_ContactAddress', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='das.das')),
            ],
            bases=('MEPS_ADMIN.contactaddress',),
        ),
        migrations.CreateModel(
            name='DasContact',
            fields=[
                ('contact_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='MEPS_ADMIN.contact')),
                ('das_Contact', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='das.das')),
            ],
            bases=('MEPS_ADMIN.contact',),
        ),
    ]