# from django.db import models

# # Create your models here.
# from MEPS_ADMIN.models import DirectionSidebar, Contact

# class DasMission(DirectionSidebar):
#     pass


# class DasProject(DirectionSidebar):
#     pass

# class DasObjectif(DirectionSidebar):
#     pass

# class DasSousDirection(DirectionSidebar):
#     pass

# class DasContact(Contact):
#     pass


from django.db import models

# Create your models here.

from MEPS_ADMIN.models import DirectionDetail, Mission, Project, Objectif, SousDirection, Contact, ContactAddress, ContactTel, ContactEmail, ContactHoraire

class Das(DirectionDetail):
    pass
    class Meta:
        verbose_name_plural = 'Page'


class DasMission(Mission):
    # pass
    das_Mission = models.ForeignKey(Das, on_delete=models.SET_NULL, null=True)

class DasProject(Project):
    # pass
    das_Project = models.ForeignKey(Das, on_delete=models.SET_NULL, null=True)


class DasObjectif(Objectif):
    # pass
    das_Objectif = models.ForeignKey(Das, on_delete=models.SET_NULL, null=True)


class DasSousDirection(SousDirection):
    # pass
    das_Sous_direction = models.ForeignKey(Das, on_delete=models.SET_NULL, null=True)


class DasContact(Contact):
    # pass
    das_Contact = models.ForeignKey(Das, on_delete=models.SET_NULL, null=True)

class DasContactAddress(ContactAddress):
    # pass
    # das_ContactAddress = models.ForeignKey(DasContact, on_delete=models.SET_NULL, null=True)
    das_ContactAddress = models.ForeignKey(Das, on_delete=models.SET_NULL, null=True)
    
class DasContactTel(ContactTel):
    # pass
    das_ContactTel = models.ForeignKey(Das, on_delete=models.SET_NULL, null=True)
    
class DasContactEmail(ContactEmail):
    # pass
    das_ContactEmail = models.ForeignKey(Das, on_delete=models.SET_NULL, null=True)
    
class DasContactHoraire(ContactHoraire):
    # pass
    das_ContactHoraire = models.ForeignKey(Das, on_delete=models.SET_NULL, null=True)



