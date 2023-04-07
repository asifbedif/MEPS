from django.db import models

# Create your models here.

from MEPS_ADMIN.models import DirectionDetail, Mission, Project, Objectif, SousDirection, Contact, ContactAddress, ContactTel, ContactEmail, ContactHoraire

class Dssm(DirectionDetail):
    pass
    class Meta:
        verbose_name_plural = 'Page'


class DssmMission(Mission):
    # pass
    dssm_Mission = models.ForeignKey(Dssm, on_delete=models.SET_NULL, null=True)

class DssmProject(Project):
    # pass
    dssm_Project = models.ForeignKey(Dssm, on_delete=models.SET_NULL, null=True)


class DssmObjectif(Objectif):
    # pass
    dssm_Objectif = models.ForeignKey(Dssm, on_delete=models.SET_NULL, null=True)


class DssmSousDirection(SousDirection):
    # pass
    dssm_Sous_direction = models.ForeignKey(Dssm, on_delete=models.SET_NULL, null=True)


class DssmContact(Contact):
    # pass
    dssm_Contact = models.ForeignKey(Dssm, on_delete=models.SET_NULL, null=True)

class DssmContactAddress(ContactAddress):
    # pass
    # dssm_ContactAddress = models.ForeignKey(DssmContact, on_delete=models.SET_NULL, null=True)
    dssm_ContactAddress = models.ForeignKey(Dssm, on_delete=models.SET_NULL, null=True)
    
class DssmContactTel(ContactTel):
    # pass
    dssm_ContactTel = models.ForeignKey(Dssm, on_delete=models.SET_NULL, null=True)
    
class DssmContactEmail(ContactEmail):
    # pass
    dssm_ContactEmail = models.ForeignKey(Dssm, on_delete=models.SET_NULL, null=True)
    
class DssmContactHoraire(ContactHoraire):
    # pass
    dssm_ContactHoraire = models.ForeignKey(Dssm, on_delete=models.SET_NULL, null=True)



