
from django.db import models

# Create your models here.

from MEPS_ADMIN.models import DirectionDetail, Mission, Project, Objectif, SousDirection, Contact, ContactAddress, ContactTel, ContactEmail, ContactHoraire

class Dsepe(DirectionDetail):
    pass
    class Meta:
        verbose_name_plural = 'Page'


class DsepeMission(Mission):
    # pass
    dsepe_Mission = models.ForeignKey(Dsepe, on_delete=models.SET_NULL, null=True)

class DsepeProject(Project):
    # pass
    dsepe_Project = models.ForeignKey(Dsepe, on_delete=models.SET_NULL, null=True)


class DsepeObjectif(Objectif):
    # pass
    dsepe_Objectif = models.ForeignKey(Dsepe, on_delete=models.SET_NULL, null=True)


class DsepeSousDirection(SousDirection):
    # pass
    dsepe_Sous_direction = models.ForeignKey(Dsepe, on_delete=models.SET_NULL, null=True)


class DsepeContact(Contact):
    # pass
    dsepe_Contact = models.ForeignKey(Dsepe, on_delete=models.SET_NULL, null=True)

class DsepeContactAddress(ContactAddress):
    # pass
    # dsepe_ContactAddress = models.ForeignKey(DsepeContact, on_delete=models.SET_NULL, null=True)
    dsepe_ContactAddress = models.ForeignKey(Dsepe, on_delete=models.SET_NULL, null=True)
    
class DsepeContactTel(ContactTel):
    # pass
    dsepe_ContactTel = models.ForeignKey(Dsepe, on_delete=models.SET_NULL, null=True)
    
class DsepeContactEmail(ContactEmail):
    # pass
    dsepe_ContactEmail = models.ForeignKey(Dsepe, on_delete=models.SET_NULL, null=True)
    
class DsepeContactHoraire(ContactHoraire):
    # pass
    dsepe_ContactHoraire = models.ForeignKey(Dsepe, on_delete=models.SET_NULL, null=True)

