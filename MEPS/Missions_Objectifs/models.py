from django.db import models
from MEPS.cabinet.models import DecretList
from MEPS.models import MepsPage

# Create your models here.

class MissionCategory(models.Model):
    title = models.CharField(max_length=100)

    class Meta:
        verbose_name_plural = 'Mission Categories'
    def __str__(self):
        # return str(self.category)
        return f'{self.title}'



class MissionsList(models.Model):
    # number = models.SmallAutoField(primary_key=True)
    sentence = models.TextField(max_length=500, unique=True)
    category = models.ForeignKey(MissionCategory, on_delete = models.SET_DEFAULT, default='Non spécifié')

    def __str__(self):
        return str(self.sentence[0:5])
    
class MissionsObjectif(MepsPage):
    pass

    class Meta:
        ordering = ('-post_published_on',)
        verbose_name_plural = 'Page'
