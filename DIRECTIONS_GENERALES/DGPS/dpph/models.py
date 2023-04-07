from django.db import models

# Create your models here.

from MEPS_ADMIN.models import DirectionDetail, Mission, Project, Objectif, SousDirection, Contact, ContactAddress, ContactTel, ContactEmail, ContactHoraire

class Dpph(DirectionDetail):
    pass
    class Meta:
        verbose_name_plural = 'Page'


class DpphMission(Mission):
    # pass
    dpph_Mission = models.ForeignKey(Dpph, on_delete=models.SET_NULL, null=True)

class DpphProject(Project):
    # pass
    dpph_Project = models.ForeignKey(Dpph, on_delete=models.SET_NULL, null=True)


class DpphObjectif(Objectif):
    # pass
    dpph_Objectif = models.ForeignKey(Dpph, on_delete=models.SET_NULL, null=True)


class DpphSousDirection(SousDirection):
    # pass
    dpph_Sous_direction = models.ForeignKey(Dpph, on_delete=models.SET_NULL, null=True)


class DpphContact(Contact):
    # pass
    dpph_Contact = models.ForeignKey(Dpph, on_delete=models.SET_NULL, null=True)

class DpphContactAddress(ContactAddress):
    # pass
    # dpph_ContactAddress = models.ForeignKey(DpphContact, on_delete=models.SET_NULL, null=True)
    dpph_ContactAddress = models.ForeignKey(Dpph, on_delete=models.SET_NULL, null=True)
    
class DpphContactTel(ContactTel):
    # pass
    dpph_ContactTel = models.ForeignKey(Dpph, on_delete=models.SET_NULL, null=True)
    
class DpphContactEmail(ContactEmail):
    # pass
    dpph_ContactEmail = models.ForeignKey(Dpph, on_delete=models.SET_NULL, null=True)
    
class DpphContactHoraire(ContactHoraire):
    # pass
    dpph_ContactHoraire = models.ForeignKey(Dpph, on_delete=models.SET_NULL, null=True)



