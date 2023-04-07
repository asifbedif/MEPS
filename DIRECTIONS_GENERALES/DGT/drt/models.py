from django.db import models

# Create your models here.

from MEPS_ADMIN.models import DirectionDetail, Mission, Project, Objectif, SousDirection, Contact, ContactAddress, ContactTel, ContactEmail, ContactHoraire

class Drt(DirectionDetail):
    pass
    class Meta:
        verbose_name_plural = 'Page'


class DrtMission(Mission):
    # pass
    drt_Mission = models.ForeignKey(Drt, on_delete=models.SET_NULL, null=True)

class DrtProject(Project):
    # pass
    drt_Project = models.ForeignKey(Drt, on_delete=models.SET_NULL, null=True)


class DrtObjectif(Objectif):
    # pass
    drt_Objectif = models.ForeignKey(Drt, on_delete=models.SET_NULL, null=True)


class DrtSousDirection(SousDirection):
    # pass
    drt_Sous_direction = models.ForeignKey(Drt, on_delete=models.SET_NULL, null=True)


class DrtContact(Contact):
    # pass
    drt_Contact = models.ForeignKey(Drt, on_delete=models.SET_NULL, null=True)

class DrtContactAddress(ContactAddress):
    # pass
    # drt_ContactAddress = models.ForeignKey(DrtContact, on_delete=models.SET_NULL, null=True)
    drt_ContactAddress = models.ForeignKey(Drt, on_delete=models.SET_NULL, null=True)
    
class DrtContactTel(ContactTel):
    # pass
    drt_ContactTel = models.ForeignKey(Drt, on_delete=models.SET_NULL, null=True)
    
class DrtContactEmail(ContactEmail):
    # pass
    drt_ContactEmail = models.ForeignKey(Drt, on_delete=models.SET_NULL, null=True)
    
class DrtContactHoraire(ContactHoraire):
    # pass
    drt_ContactHoraire = models.ForeignKey(Drt, on_delete=models.SET_NULL, null=True)



