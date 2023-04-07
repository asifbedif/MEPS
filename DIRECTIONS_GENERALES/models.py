from django.db import models
from django.utils.text import slugify
from django.urls import reverse
# Create your models here.

from MEPS_ADMIN.models import Direction, DirectionSidebar

class Emploi(Direction):
    direction_generale = models.CharField(max_length=100, blank=True, default='EMPLOI')

    class Meta:
        verbose_name_plural = "DGE"
    
    # def save(self, *args, **kwargs):
    #     self.slug = slugify(self.short_form_name)
    #     super(type(self), self).save(*args, **kwargs)


class Travail(Direction):
    direction_generale = models.CharField(max_length=100, blank=True, default='TRAVAIL')

    class Meta:
        verbose_name_plural = 'DGT'
    
    # def save(self, *args, **kwargs):
    #     self.slug = slugify(self.title)
    #     super(Travail, self).save(*args, **kwargs)


class ProtectionSociale(Direction):
    direction_generale = models.CharField(max_length=100, blank=True, default='PROTECTION SOCIALE')


    class Meta:
        verbose_name_plural = 'DGPS'
            
    # def save(self, *args, **kwargs):
    #     self.slug = slugify(self.title)
    #     super(ProtectionSociale, self).save(*args, **kwargs)
