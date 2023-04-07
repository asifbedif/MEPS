from django.db import models
from django.utils.text import slugify
from MEPS_ADMIN.models import POST_STATUS_CHOICES

# Create your models here.

DG  = (
        ('DGE', "Direction Générale de l'Emploi"),
        ('DGT', "Direction Générale du Travail"),
        ('DGPS', "Direction Générale de la Protection Sociale")
    )

class NosContactsCustomModel(models.Model):
    full_form_name = models.CharField(max_length=100, unique=True)
    short_form_name = models.CharField(max_length=10)
    slug = models.SlugField(max_length=100, allow_unicode=True, blank=True)
    address = models.CharField(max_length=200, default='Plateau - Abidjan')
    tel = models.CharField(max_length=25, blank=True, default='(+225) ')
    email = models.EmailField(max_length=50, blank=True)
    horaire = models.CharField(max_length=50, default="Lund- Vend: 07h30 à 16h30")
    status = models.CharField("Status", max_length=10, choices= POST_STATUS_CHOICES, default='draft')

    class Meta:
        ordering = ['status', 'short_form_name',]
        verbose_name = "Une Direction Générale"
        verbose_name_plural = "Liste des Directions - Générales"

    def __str__(self):
        return self.full_form_name
    
    def save(self, *args, **kwargs):
        self.slug = slugify(self.short_form_name)
        super(NosContactsCustomModel, self).save(*args, **kwargs)

class DirectionCustomModel(models.Model):
    full_form_name = models.CharField(max_length=100, unique=True)
    short_form_name = models.CharField(max_length=10)
    address = models.CharField(max_length=200, default='Plateau - Abidjan')
    tel = models.CharField(max_length=25, blank=True, default='(+225) ')
    email = models.EmailField(max_length=50, blank=True)
    horaire = models.CharField(max_length=50, default="Lund- Vend: 07h30 à 16h30")
    status = models.CharField("Status", max_length=10, choices= POST_STATUS_CHOICES, default='draft')

    class Meta:
        ordering = ['status', 'short_form_name',]
        verbose_name = "Une Direction Générale"
        verbose_name_plural = "Liste des Directions - Générales"

    def __str__(self):
        return self.full_form_name

class ContactsDGE(NosContactsCustomModel):
    pass
    class Meta:
        verbose_name = "Contact de la DGE"
        verbose_name_plural = "Directions de la DGE"

class DGE_directions_contacts(DirectionCustomModel):
    direction_generale = models.ForeignKey(ContactsDGE, on_delete=models.SET_DEFAULT, default='DGE', related_name='DGE_directions')



class ContactsDGT(NosContactsCustomModel):
    pass
    class Meta:
        verbose_name = "Contact de la DGT"
        verbose_name_plural = "Directions de la DGT"



class DGT_directions_contacts(DirectionCustomModel):
    direction_generale = models.ForeignKey(ContactsDGT, on_delete=models.SET_DEFAULT, default='DGT', related_name='DGT_directions')



class ContactsDGPS(NosContactsCustomModel):
    pass
    class Meta:
        verbose_name = "Contact de la DGPS"
        verbose_name_plural = "Directions de la DGPS"


class DGPS_directions_contacts(DirectionCustomModel):
    direction_generale = models.ForeignKey(ContactsDGPS, on_delete=models.SET_DEFAULT, default='DGPS', related_name='DGPS_directions')



class ContactsCABINET(NosContactsCustomModel):
    pass
    class Meta:
        verbose_name = " Service & Direction rattaché au CABINET"
        verbose_name_plural = "Directions & Services du Cabinet"

class CABINET_directions_contacts(DirectionCustomModel):
    direction_generale = models.ForeignKey(ContactsCABINET, on_delete=models.SET_DEFAULT, default='CABINET', related_name='CABINET_directions')
    


class Faq(models.Model):
    question = models.CharField(max_length=500)
    response = models.TextField()
    status = models.CharField("Status", max_length=10, choices= POST_STATUS_CHOICES, default='draft')
    published_on = models.DateTimeField(auto_now_add = True)
    modified_on = models.DateTimeField(auto_now = True)

    class Meta:
        ordering = ['status', '-published_on']
        verbose_name_plural = 'FAQ'

    def __str__(self):
        return f"{self.question}"
    
