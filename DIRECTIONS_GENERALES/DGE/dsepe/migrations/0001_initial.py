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
            name='Dsepe',
            fields=[
                ('directiondetail_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='MEPS_ADMIN.directiondetail')),
            ],
            options={
                'verbose_name_plural': 'Page',
            },
            bases=('MEPS_ADMIN.directiondetail',),
        ),
        migrations.CreateModel(
            name='DsepeSousDirection',
            fields=[
                ('sousdirection_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='MEPS_ADMIN.sousdirection')),
                ('dsepe_Sous_direction', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='dsepe.dsepe')),
            ],
            bases=('MEPS_ADMIN.sousdirection',),
        ),
        migrations.CreateModel(
            name='DsepeProject',
            fields=[
                ('project_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='MEPS_ADMIN.project')),
                ('dsepe_Project', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='dsepe.dsepe')),
            ],
            bases=('MEPS_ADMIN.project',),
        ),
        migrations.CreateModel(
            name='DsepeObjectif',
            fields=[
                ('objectif_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='MEPS_ADMIN.objectif')),
                ('dsepe_Objectif', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='dsepe.dsepe')),
            ],
            bases=('MEPS_ADMIN.objectif',),
        ),
        migrations.CreateModel(
            name='DsepeMission',
            fields=[
                ('mission_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='MEPS_ADMIN.mission')),
                ('dsepe_Mission', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='dsepe.dsepe')),
            ],
            bases=('MEPS_ADMIN.mission',),
        ),
        migrations.CreateModel(
            name='DsepeContactTel',
            fields=[
                ('contacttel_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='MEPS_ADMIN.contacttel')),
                ('dsepe_ContactTel', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='dsepe.dsepe')),
            ],
            bases=('MEPS_ADMIN.contacttel',),
        ),
        migrations.CreateModel(
            name='DsepeContactHoraire',
            fields=[
                ('contacthoraire_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='MEPS_ADMIN.contacthoraire')),
                ('dsepe_ContactHoraire', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='dsepe.dsepe')),
            ],
            bases=('MEPS_ADMIN.contacthoraire',),
        ),
        migrations.CreateModel(
            name='DsepeContactEmail',
            fields=[
                ('contactemail_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='MEPS_ADMIN.contactemail')),
                ('dsepe_ContactEmail', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='dsepe.dsepe')),
            ],
            bases=('MEPS_ADMIN.contactemail',),
        ),
        migrations.CreateModel(
            name='DsepeContactAddress',
            fields=[
                ('contactaddress_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='MEPS_ADMIN.contactaddress')),
                ('dsepe_ContactAddress', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='dsepe.dsepe')),
            ],
            bases=('MEPS_ADMIN.contactaddress',),
        ),
        migrations.CreateModel(
            name='DsepeContact',
            fields=[
                ('contact_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='MEPS_ADMIN.contact')),
                ('dsepe_Contact', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='dsepe.dsepe')),
            ],
            bases=('MEPS_ADMIN.contact',),
        ),
    ]
