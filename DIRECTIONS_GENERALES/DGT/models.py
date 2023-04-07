from django.db import models

from MEPS.models import STATUS_CHOICES

from datetime import datetime

# Create your models here.

class Dgt(models.Model):
    full_form_name = models.CharField('titre', max_length=100, default="Direction Générale du Travail")
    short_form_name = models.CharField('sigle', max_length=10)     
    slug = models.SlugField(max_length=100)
    description = models.TextField(max_length=1000, blank=True)
    status = models.CharField("Statut", max_length=10, choices= STATUS_CHOICES, default='draft')
    # published_on = models.DateTimeField(auto_now_add = True)
    # modified_on = models.DateTimeField(auto_now = True)

    # published_on = models.DateTimeField(default= datetime.now)
    # modified_on = models.DateTimeField(default= datetime.now)
    class Meta:
        verbose_name = 'DGT';
        verbose_name_plural = 'pagee'

    def __str__(self):
        return self.full_form_name

