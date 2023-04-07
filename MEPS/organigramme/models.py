from django.db import models
from MEPS_ADMIN.models import StatusMixinModel

# Create your models here.
class Organigramme(StatusMixinModel):
    pdf = models.FileField(upload_to='PDF/organigramme/%Y/%m/%d/')
    title = models.CharField(max_length=100, default="Organigramme du MEPS")
    slug = models.SlugField(max_length=100)
    description = models.TextField(max_length=1000, blank=True)

    class Meta:
        verbose_name_plural = 'page'

    def __str__(self):
        return self.pdf.name[28:-4].replace('_', ' ')