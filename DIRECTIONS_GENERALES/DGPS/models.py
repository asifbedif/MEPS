from django.db import models

from MEPS.models import STATUS_CHOICES

# Create your models here.
class Dgps(models.Model):
    full_form_name = models.CharField('title', max_length=100, default="Direction Générale de  la Protection Sociale")
    short_form_name = models.CharField('sigle', max_length=10)     
    slug = models.SlugField(max_length=100)
    description = models.TextField(max_length=1000, blank=True)
    status = models.CharField("Status", max_length=10, choices= STATUS_CHOICES, default='draft')
  
    class Meta:
        verbose_name = 'DGPS';
        verbose_name_plural = 'page';

    def __str__(self):
        return self.full_form_name
