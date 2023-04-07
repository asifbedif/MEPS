from django.db import models
from MEPS_ADMIN.models import FlipCard, StatusMixinModel 

# Create your models here.
class EcoleSpecialisee(FlipCard, StatusMixinModel):
    pass

    class Meta:
        verbose_name = 'École Spécialisée'
        verbose_name_plural = 'Page'
