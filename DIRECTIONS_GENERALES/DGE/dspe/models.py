
from django.db import models

# Create your models here.

from MEPS_ADMIN.models import DirectionDetail, Mission, Project, Objectif, SousDirection, Contact, ContactAddress, ContactTel, ContactEmail, ContactHoraire

class Dspe(DirectionDetail):
    pass
    class Meta:
        verbose_name_plural = 'Page'


class DspeMission(Mission):
    # pass
    dspe_Mission = models.ForeignKey(Dspe, on_delete=models.SET_NULL, null=True)

class DspeProject(Project):
    # pass
    dspe_Project = models.ForeignKey(Dspe, on_delete=models.SET_NULL, null=True)


class DspeObjectif(Objectif):
    # pass
    dspe_Objectif = models.ForeignKey(Dspe, on_delete=models.SET_NULL, null=True)


class DspeSousDirection(SousDirection):
    # pass
    dspe_Sous_direction = models.ForeignKey(Dspe, on_delete=models.SET_NULL, null=True)


class DspeContact(Contact):
    # pass
    dspe_Contact = models.ForeignKey(Dspe, on_delete=models.SET_NULL, null=True)

class DspeContactAddress(ContactAddress):
    # pass
    # dspe_ContactAddress = models.ForeignKey(DspeContact, on_delete=models.SET_NULL, null=True)
    dspe_ContactAddress = models.ForeignKey(Dspe, on_delete=models.SET_NULL, null=True)
    
class DspeContactTel(ContactTel):
    # pass
    dspe_ContactTel = models.ForeignKey(Dspe, on_delete=models.SET_NULL, null=True)
    
class DspeContactEmail(ContactEmail):
    # pass
    dspe_ContactEmail = models.ForeignKey(Dspe, on_delete=models.SET_NULL, null=True)
    
class DspeContactHoraire(ContactHoraire):
    # pass
    dspe_ContactHoraire = models.ForeignKey(Dspe, on_delete=models.SET_NULL, null=True)

