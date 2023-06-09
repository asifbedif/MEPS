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
            name='Dlte',
            fields=[
                ('directiondetail_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='MEPS_ADMIN.directiondetail')),
            ],
            options={
                'verbose_name_plural': 'Page',
            },
            bases=('MEPS_ADMIN.directiondetail',),
        ),
        migrations.CreateModel(
            name='DlteSousDirection',
            fields=[
                ('sousdirection_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='MEPS_ADMIN.sousdirection')),
                ('dlte_Sous_direction', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='dlte.dlte')),
            ],
            bases=('MEPS_ADMIN.sousdirection',),
        ),
        migrations.CreateModel(
            name='DlteProject',
            fields=[
                ('project_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='MEPS_ADMIN.project')),
                ('dlte_Project', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='dlte.dlte')),
            ],
            bases=('MEPS_ADMIN.project',),
        ),
        migrations.CreateModel(
            name='DlteObjectif',
            fields=[
                ('objectif_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='MEPS_ADMIN.objectif')),
                ('dlte_Objectif', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='dlte.dlte')),
            ],
            bases=('MEPS_ADMIN.objectif',),
        ),
        migrations.CreateModel(
            name='DlteMission',
            fields=[
                ('mission_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='MEPS_ADMIN.mission')),
                ('dlte_Mission', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='dlte.dlte')),
            ],
            bases=('MEPS_ADMIN.mission',),
        ),
        migrations.CreateModel(
            name='DlteContactTel',
            fields=[
                ('contacttel_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='MEPS_ADMIN.contacttel')),
                ('dlte_ContactTel', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='dlte.dlte')),
            ],
            bases=('MEPS_ADMIN.contacttel',),
        ),
        migrations.CreateModel(
            name='DlteContactHoraire',
            fields=[
                ('contacthoraire_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='MEPS_ADMIN.contacthoraire')),
                ('dlte_ContactHoraire', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='dlte.dlte')),
            ],
            bases=('MEPS_ADMIN.contacthoraire',),
        ),
        migrations.CreateModel(
            name='DlteContactEmail',
            fields=[
                ('contactemail_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='MEPS_ADMIN.contactemail')),
                ('dlte_ContactEmail', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='dlte.dlte')),
            ],
            bases=('MEPS_ADMIN.contactemail',),
        ),
        migrations.CreateModel(
            name='DlteContactAddress',
            fields=[
                ('contactaddress_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='MEPS_ADMIN.contactaddress')),
                ('dlte_ContactAddress', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='dlte.dlte')),
            ],
            bases=('MEPS_ADMIN.contactaddress',),
        ),
        migrations.CreateModel(
            name='DlteContact',
            fields=[
                ('contact_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='MEPS_ADMIN.contact')),
                ('dlte_Contact', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='dlte.dlte')),
            ],
            bases=('MEPS_ADMIN.contact',),
        ),
    ]
