from django.db import models
from django.contrib.auth.models import User
from datetime import datetime

# Create your models here.
from django.urls import reverse
from MEPS_ADMIN.models import Post
from PUBLICATIONS.models import PublicationCategory


STATUS_CHOICES = (
                    ('draft', 'Draft'),
                    ('published', 'Published'),
                    # ('deleted', 'Deleted')
                )

COMMENT_STATUS_CHOICES = (
                            ('opened', 'Opened'),
                            ('closed', 'Closed')
                        )


POST_ON_PAGE = (
        ('le-ministere', 'LE MINISTÈRE'),
        ('cabinet', 'LE CABINET'),
        ('organigramme', 'ORGANIGRAMME'),
        ('directions-services', 'DIRECTIONS ET SERVICES'),
        ('structures-sous-tutelles', 'STRUCTURES SOUS-TUTELLES'),
        ('ecoles-spécialisées','ÉCOLES SPÉCIALISÉES'),
        ('décret-organisation', "DECRET D'ORGANISATION"),
        ('missions-objectifs', 'MISSIONS & OBJECTIFS')
    )


PARENT_PAGE = [
    ('MEPS', 'meps'),
     ('DIRECTIONS_GENERALES', 'directions'),
]


CIVILITE = [

    ('1', 'Mr'),
    ('2', 'Mme'),
]

list_months = ('Janv', 'Fév', 'Mar', 'Avr', 'Mai', 'Juin', 'Juil', 'Août', 'Sept', 'Oct', 'Nov', 'Déc')

MONTHS = list([ (m,m) for m in list_months])

first_year = 2000
current_year = datetime.today().year
START_YEAR = list([ (str(y),str(y)) for y in range(first_year, current_year+1, 1)])

END_YEAR =  [ (str(y), str(y)) for y in range(first_year, current_year+1, 1)]
END_YEAR.append(("Aujourd'hui","Aujourd'hui"))



class MepsPage(Post):
    category = models.ForeignKey(PublicationCategory, on_delete=models.SET_DEFAULT, default='uncategorized', null=True, blank=True)
    



# class LeCabinet(MepsPage):
#     pass

#     class Meta:
#         verbose_name_plural = 'Le Cabinet'


# class Organigramme(models.Model):
#     pdf = models.FileField(upload_to='pdfs/')
    

# class StructureSousTutelle(MepsPage):
#     pass

#     class Meta:
#         pass
        #verbose_name_plural = 'Structures Sous-tutelles'

# class EcoleSpecialisee(FlipCard):
#     pass

#     class Meta:
#         verbose_name = 'École Spécialisée'
#         verbose_name_plural = 'Écoles Spécialisées'


# class DecretOrganisation(models.Model):
#     pdf = models.FileField(upload_to='pdfs/')


# class MissionEtObjectif(MepsPage):
#     pass

#     class Meta:
#         pass
#         #verbose_name_plural = 'Décret Organisation'

