from django.db import models

# Create your models here.

from MEPS_ADMIN.models import DirectionDetail, Mission, Project, Objectif, SousDirection, Contact, ContactAddress, ContactTel, ContactEmail, ContactHoraire

class Dit(DirectionDetail):
    pass
    class Meta:
        verbose_name_plural = 'Page'


class DitMission(Mission):
    # pass
    dit_Mission = models.ForeignKey(Dit, on_delete=models.SET_NULL, null=True)

class DitProject(Project):
    # pass
    dit_Project = models.ForeignKey(Dit, on_delete=models.SET_NULL, null=True)


class DitObjectif(Objectif):
    # pass
    dit_Objectif = models.ForeignKey(Dit, on_delete=models.SET_NULL, null=True)


class DitSousDirection(SousDirection):
    # pass
    dit_Sous_direction = models.ForeignKey(Dit, on_delete=models.SET_NULL, null=True)


class DitContact(Contact):
    # pass
    dit_Contact = models.ForeignKey(Dit, on_delete=models.SET_NULL, null=True)

class DitContactAddress(ContactAddress):
    # pass
    # dit_ContactAddress = models.ForeignKey(DitContact, on_delete=models.SET_NULL, null=True)
    dit_ContactAddress = models.ForeignKey(Dit, on_delete=models.SET_NULL, null=True)
    
class DitContactTel(ContactTel):
    # pass
    dit_ContactTel = models.ForeignKey(Dit, on_delete=models.SET_NULL, null=True)
    
class DitContactEmail(ContactEmail):
    # pass
    dit_ContactEmail = models.ForeignKey(Dit, on_delete=models.SET_NULL, null=True)
    
class DitContactHoraire(ContactHoraire):
    # pass
    dit_ContactHoraire = models.ForeignKey(Dit, on_delete=models.SET_NULL, null=True)



