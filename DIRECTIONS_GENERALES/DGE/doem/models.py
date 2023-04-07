from django.db import models

# Create your models here.

from MEPS_ADMIN.models import DirectionDetail, Mission, Project, Objectif, SousDirection, Contact, ContactAddress, ContactTel, ContactEmail, ContactHoraire

class Doem(DirectionDetail):
    pass
    class Meta:
        verbose_name_plural = 'Page'
        

class DoemMission(Mission):
    # pass
    doem_Mission = models.ForeignKey(Doem, on_delete=models.CASCADE, null=True)

class DoemProject(Project):
    # pass
    doem_Project = models.ForeignKey(Doem, on_delete=models.CASCADE, null=True)


class DoemObjectif(Objectif):
    # pass
    doem_Objectif = models.ForeignKey(Doem, on_delete=models.CASCADE, null=True)


class DoemSousDirection(SousDirection):
    # pass
    doem_Sous_direction = models.ForeignKey(Doem, on_delete=models.CASCADE, null=True)


class DoemContact(Contact):
    # pass
    doem_Contact = models.ForeignKey(Doem, on_delete=models.CASCADE, null=True)

class DoemContactAddress(ContactAddress):
    # pass
    # doem_ContactAddress = models.ForeignKey(DoemContact, on_delete=models.CASCADE, null=True)
    doem_ContactAddress = models.ForeignKey(Doem, on_delete=models.CASCADE, null=True)
    
class DoemContactTel(ContactTel):
    # pass
    doem_ContactTel = models.ForeignKey(Doem, on_delete=models.CASCADE, null=True)
    
class DoemContactEmail(ContactEmail):
    # pass
    doem_ContactEmail = models.ForeignKey(Doem, on_delete=models.CASCADE, null=True)
    
class DoemContactHoraire(ContactHoraire):
    # pass
    doem_ContactHoraire = models.ForeignKey(Doem, on_delete=models.CASCADE, null=True)



# DirectionDetail,  DoemSousDirection, DoemProject, DoemObjectif, DoemContact
# class Doem(models.Model):
#     doem_Mission = models.ForeignKey(DoemMission, on_delete=models.CASCADE, null=True)
#     doem_Project = models.ForeignKey(DoemProject, on_delete=models.CASCADE, null=True)
#     doem_Objectif = models.ForeignKey(DoemObjectif, on_delete=models.CASCADE, null=True)
#     doem_Sous_direction = models.ForeignKey(DoemSousDirection, on_delete=models.CASCADE, null=True)
#     doem_Contact = models.ForeignKey(DoemContact, on_delete=models.CASCADE, null=True)


#     class Meta:
#         verbose_name_plural: 'Doem'