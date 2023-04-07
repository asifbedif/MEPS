from django.db import models

# Create your models here.

from MEPS_ADMIN.models import DirectionDetail, Mission, Project, Objectif, SousDirection, Contact, ContactAddress, ContactTel, ContactEmail, ContactHoraire

class Dlte(DirectionDetail):
    pass
    class Meta:
        verbose_name_plural = 'Page'

class DlteMission(Mission):
    # pass
    dlte_Mission = models.ForeignKey(Dlte, on_delete=models.SET_NULL, null=True)

class DlteProject(Project):
    # pass
    dlte_Project = models.ForeignKey(Dlte, on_delete=models.SET_NULL, null=True)


class DlteObjectif(Objectif):
    # pass
    dlte_Objectif = models.ForeignKey(Dlte, on_delete=models.SET_NULL, null=True)


class DlteSousDirection(SousDirection):
    # pass
    dlte_Sous_direction = models.ForeignKey(Dlte, on_delete=models.SET_NULL, null=True)


class DlteContact(Contact):
    # pass
    dlte_Contact = models.ForeignKey(Dlte, on_delete=models.SET_NULL, null=True)

class DlteContactAddress(ContactAddress):
    # pass
    # dlte_ContactAddress = models.ForeignKey(DlteContact, on_delete=models.SET_NULL, null=True)
    dlte_ContactAddress = models.ForeignKey(Dlte, on_delete=models.SET_NULL, null=True)
    
class DlteContactTel(ContactTel):
    # pass
    dlte_ContactTel = models.ForeignKey(Dlte, on_delete=models.SET_NULL, null=True)
    
class DlteContactEmail(ContactEmail):
    # pass
    dlte_ContactEmail = models.ForeignKey(Dlte, on_delete=models.SET_NULL, null=True)
    
class DlteContactHoraire(ContactHoraire):
    # pass
    dlte_ContactHoraire = models.ForeignKey(Dlte, on_delete=models.SET_NULL, null=True)



