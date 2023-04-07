from django.db import models
from django.utils import timezone

from django.utils.safestring import mark_safe
from django.contrib.auth.models import User
import itertools
from django.utils.safestring import mark_safe
from PUBLICATIONS.models import PublicationCategory
from MEPS.models import STATUS_CHOICES, COMMENT_STATUS_CHOICES, PARENT_PAGE, CIVILITE, MONTHS, START_YEAR, END_YEAR
from MEPS_ADMIN.models import StatusMixinModel

# Create your models here.

class LeMinistere(StatusMixinModel):
    
    # id = models.UUIDField("ID", primary_key=True, unique=True, default=uuid.uuid4, editable=False)
    image = models.ImageField("Feature Image", upload_to="images/ministere/", null=True, height_field=None, width_field=None, max_length=None)
    title = models.CharField("Title", max_length=250)
    slug = models.SlugField("Slug", max_length=250,unique_for_date='post_published_on')
    author = models.ForeignKey(User, on_delete=models.CASCADE, verbose_name= "Author", related_name='meps_ministere')
    content = models.TextField('content', blank=True)
    category = models.ForeignKey(PublicationCategory, on_delete=models.SET_DEFAULT, default='uncategorized', null=True, blank=True)
    place = models.CharField("Lieu", max_length=250, default='Abidjan')
    #published_on = models.DateTimeField("Published On", default=timezone.now)
    #created_on = models.DateTimeField(verbose_name= "Created On",auto_now_add=True)
    #modified_on = models.DateTimeField(verbose_name= "Modified On",auto_now=True)
    # category = models.ForeignKey('PublicationCategory', on_delete=models.SET_NULL, verbose_name="Category", blank=True, null=True)
    #status = models.CharField("Status", max_length=10, choices= STATUS_CHOICES, default='draft')
    comment_status = models.CharField("Comment status", choices= COMMENT_STATUS_CHOICES, default='opened', max_length=10)
    comment_count = models.PositiveIntegerField("Comments", default=0)
    
    class Meta:
        verbose_name_plural =  'À Propos Du Meps'
        ordering = ('-post_published_on',)
        indexes = [ models.Index(fields=['-post_published_on']),]

    
    def __str__(self):
        return self.title

    def Feature_Image(self):
        return mark_safe('<img src="../../../Media/%s" width="75" height="50" />' % (self.image))

    Feature_Image.allow_tags = True

    # def get_absolute_url(self, id, slug):
    #     return reverse('actualite-details', kwargs={"ID": self.id, "SLUG": self.slug})



class MinistrePage(models.Model):
    image = models.ImageField(upload_to='Ministres/')
    title = models.CharField(max_length=100)
    context = models.TextField(max_length=1000)

    class Meta:
        verbose_name_plural = 'Le Ministre'

    def __str__(self):
        return self.title

class MinistersList(models.Model):

    STATUS_CHOICES = (
                        ('draft', 'Draft'),
                        ('published', 'Published'),
                        # ('deleted', 'Deleted')
                    )

    photo = models.ImageField(upload_to='images/Ministres/')
    name = models.CharField(max_length=100)
    civilite = models.CharField(max_length=3, choices=CIVILITE, blank=True)
    content = models.TextField(max_length=500)
    in_function = models.CharField(max_length=20, choices=[('Ancien ministre', 'Ancien'),('Actuel Ministre', 'Actuel'),])
    start_month = models.CharField(max_length=20, choices=MONTHS)
    start_year = models.CharField(max_length=15, choices=START_YEAR)
    end_month = models.CharField(max_length=15, choices=MONTHS, blank=True)
    end_year= models.CharField(max_length=15, choices=END_YEAR)
    status = models.CharField("Status", max_length=10, choices= STATUS_CHOICES, default='draft')
    wikipedia = models.CharField(max_length=200, blank=True)

    class Meta:
        verbose_name_plural = 'un Ministre'
        verbose_name_plural = 'Historique'
        ordering = ('in_function', '-start_month','-start_year',)

    def __str__(self) -> str:
        return self.name
    
    def Feature_Image(self):
        return mark_safe('<img src="../../../Media/%s" width="75" height="50" />' % (self.photo))

    Feature_Image.allow_tags = True



class DirectionCard(models.Model):
    image = models.ImageField(upload_to='images/directions/')
    title = models.CharField(max_length=50)
    sigle = models.CharField(max_length=50, help_text="Saisir le sigle d'une direction du menu Direction Générale")
    parent = models.CharField(max_length=50, choices=PARENT_PAGE, blank=True)
    slug = models.SlugField(max_length=50)


    def __str__(self):
        return self.sigle + ' - ' + self.title
    
    def Feature_Image(self):
        return mark_safe('<img src="../../../Media/%s" width="75" height="50" />' % (self.image))

    Feature_Image.allow_tags = True

class Cta(models.Model):
    text = models.CharField(max_length=50, help_text='Saisir une rubrique du menu MEPS')
    link = models.SlugField()
    activated = models.BooleanField(default=False)

    class Meta:
        verbose_name_plural = 'CTA Button'
        ordering = ('-activated',)
    def __str__(self):
        return self.text

