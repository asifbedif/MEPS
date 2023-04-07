from django.db import models

# Create your models here.

from MEPS_ADMIN.models import DirectionDetail, Mission, Project, Objectif, SousDirection, Contact, ContactAddress, ContactTel, ContactEmail, ContactHoraire

class Dsst(DirectionDetail):
    pass
    class Meta:
        verbose_name_plural = 'Page'


class DsstMission(Mission):
    # pass
    dsst_Mission = models.ForeignKey(Dsst, on_delete=models.SET_NULL, null=True)

class DsstProject(Project):
    # pass
    dsst_Project = models.ForeignKey(Dsst, on_delete=models.SET_NULL, null=True)


class DsstObjectif(Objectif):
    # pass
    dsst_Objectif = models.ForeignKey(Dsst, on_delete=models.SET_NULL, null=True)


class DsstSousDirection(SousDirection):
    # pass
    dsst_Sous_direction = models.ForeignKey(Dsst, on_delete=models.SET_NULL, null=True)


class DsstContact(Contact):
    # pass
    dsst_Contact = models.ForeignKey(Dsst, on_delete=models.SET_NULL, null=True)

class DsstContactAddress(ContactAddress):
    # pass
    # dsst_ContactAddress = models.ForeignKey(DsstContact, on_delete=models.SET_NULL, null=True)
    dsst_ContactAddress = models.ForeignKey(Dsst, on_delete=models.SET_NULL, null=True)
    
class DsstContactTel(ContactTel):
    # pass
    dsst_ContactTel = models.ForeignKey(Dsst, on_delete=models.SET_NULL, null=True)
    
class DsstContactEmail(ContactEmail):
    # pass
    dsst_ContactEmail = models.ForeignKey(Dsst, on_delete=models.SET_NULL, null=True)
    
class DsstContactHoraire(ContactHoraire):
    # pass
    dsst_ContactHoraire = models.ForeignKey(Dsst, on_delete=models.SET_NULL, null=True)



