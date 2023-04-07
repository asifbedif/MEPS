from datetime import date
from django.db import models
from MEPS.cabinet.models import *
from django.utils import timezone

from MEPS.models import STATUS_CHOICES, COMMENT_STATUS_CHOICES




# Create your models here.
class custumModel(models.Model):
    # title = models.CharField(max_length=250, default='')
    content = models.TextField(max_length=250, default='')
    published_on = models.DateTimeField("Published On", default=timezone.now)
    status = models.CharField("Status", max_length=10, choices= STATUS_CHOICES, default='draft')
    
    class Meta:
        abstract = True

    
    class Meta:
        ordering = ['-published_on']
    def __str__(self):
        return str(self.id)


# class MotDuMinistre(models.Model):
#     mot_ministre_title = models.CharField("Title", max_length=100, default='')
#     mot_ministre_content = models.TextField("Content", max_length=500, default='')
#     mot_ministre_status  = models.CharField("Status", max_length=10, choices= STATUS_CHOICES, default='draft')
    
    
# class Declaration(models.Model):
#     declaration_title    = models.CharField("Title", max_length=100, default='')
#     declaration_content  = models.TextField("Content", max_length=500, default='')
#     declaration_status   = models.CharField("Status", max_length=10, choices= STATUS_CHOICES, default='draft')


class Biographie(models.Model):
    nom = models.CharField('Nom', max_length=50)
    prenoms = models.CharField('Prénoms', max_length=100)
    date_de_naissance = models.DateField(blank=True, null=True)
    Lieu_de_naissance = models.CharField(max_length=200)
    nationalite = models.CharField('Nationalité', max_length=100)
    parti_politique = models.CharField(max_length=50)
    diplome_de = models.CharField('Diplômé de', max_length=200)
    Profession = models.CharField(max_length=200)
    published_on = models.DateTimeField("Published On", default=timezone.now)
    status = models.CharField("Status", max_length=10, choices= STATUS_CHOICES, default='draft')
    # ministre_Biographie = models.ForeignKey(LeMinistre, verbose_name='Le Ministre', related_name="ministre_Biographie", on_delete=models.CASCADE, default=None)
    
    
    def __str__(self):
        return self.prenoms + ' ' + self.nom
    
    class Meta:
        ordering = ('-published_on',) 
        verbose_name_plural = 'Biographie'



class LeMinistre(Biographie):
    photo = models.ImageField(upload_to="Media/images/ministre/%Y/%m/%d/", null=True, height_field=None, width_field=None, max_length=None)
    # name = models.CharField(max_length=100)
    slug = models.SlugField("Slug", max_length=250,unique_for_date='published_on')
    biographie  = models.TextField("biographie", max_length=500, default='', blank=True, null=True)
    declaration  = models.TextField("declaration", max_length=1500, default='', blank=True, null=True)
    mot_du_ministre = models.TextField("mot du ministre", max_length=1500, default='', blank=True, null=True)
    
    # published_on = models.DateTimeField("Published On", default=timezone.now)
    # status = models.CharField("Status", max_length=10, choices= STATUS_CHOICES, default='draft')
    
    # comment_status = models.CharField("Comment status", choices= COMMENT_STATUS_CHOICES, default='opened', max_length=10)
    # comment_count = models.PositiveIntegerField("Num Comments", default=0)
    


    class Meta:
        verbose_name_plural = 'Le Ministre'
        ordering = ('-published_on',)

    def __str__(self):
        return self.prenoms + ' ' + self.nom

    def Feature_Image(self):
        return mark_safe('<img src="../../../Media/%s" width="75" height="50" />' % (self.image))

    Feature_Image.allow_tags = True
 
 
class InfoPersonnelle(custumModel):
    ministre_Infos = models.ForeignKey(LeMinistre, verbose_name='Le Ministre', related_name="ministre_Infos", on_delete=models.CASCADE, default=None)


class ParcoursProfessionnel(custumModel):
    ministre_parcours_professionnel = models.ForeignKey(LeMinistre, verbose_name='Le Ministre', related_name="ministre_ParcoursProfessionnel", on_delete=models.CASCADE, default=None)
    
class ParcoursPolitique(custumModel):
    ministre_parcours_politique = models.ForeignKey(LeMinistre, verbose_name='Le Ministre', related_name="ministre_ParcoursPolitique", on_delete=models.CASCADE, default=None)


class ExpérienceAdministrative(custumModel):
    ministre_Experience = models.ForeignKey(LeMinistre, verbose_name='Le Ministre', related_name="ministre_Experience", on_delete=models.CASCADE, default=None)
    

class Distinction(custumModel):
    ministre_distinction = models.ForeignKey(LeMinistre, verbose_name='Le Ministre', related_name="ministre_distinction", on_delete=models.CASCADE, default=None)
    
    
