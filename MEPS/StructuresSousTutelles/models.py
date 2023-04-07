from django.db import models
from MEPS_ADMIN.models import FlipCard
from MEPS_ADMIN.models import StatusMixinModel
# Create your models here.

class StructuresSousTutelle(StatusMixinModel, FlipCard):
    pass

    class Meta:
        verbose_name_plural = 'Page'