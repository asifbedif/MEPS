from django.db import models
import uuid
from MEPS_ADMIN.Users.models import Writter
# from MEPS_ADMIN.Users.models import UserProfile

from taggit.managers import TaggableManager
from phonenumber_field.modelfields import PhoneNumberField
from taggit.managers import TaggableManager
from django.utils import timezone
from datetime import datetime
from django.utils.safestring import mark_safe
from django.contrib.auth.models import User
from django.contrib.auth import get_user_model
from django.utils.text import slugify
from django.urls import reverse
from ckeditor_uploader.fields import RichTextUploadingField

# Create your models here.

POST_STATUS_CHOICES = (
                        ('draft', 'Draft'),
                        ('published', 'Published'),
                    )

class StatusMixinModel(models.Model):
    
    class POST_STATUS(models.TextChoices):
        DRAFT = 'draft', 'Draft'
        PUBLISHED = 'published', 'Published'
        # DELETED = 'deleted', 'Deleted'

    class COMMENT_STATUS(models.TextChoices):
        OPENDED = 'opened', 'Opened'
        CLOSED = 'closed', 'Closed'
            
    post_published_on = models.DateTimeField("Published On", default=timezone.now)
    post_created_on = models.DateTimeField(verbose_name= "Created On",auto_now_add=True)
    post_modified_on = models.DateTimeField(verbose_name= "Modified On",auto_now=True)
    #post_category = models.ForeignKey('Category', on_delete=models.SET_NULL, verbose_name="Category", blank=True, null=True)
    post_status = models.CharField("Status", max_length=10, choices= POST_STATUS.choices, default=POST_STATUS.DRAFT)
    comment_status = models.CharField("Comment status", choices= COMMENT_STATUS.choices, default=COMMENT_STATUS.OPENDED, max_length=10)
    comment_count = models.PositiveIntegerField(default=0)
    
    class Meta:
        ordering = ('-post_published_on',)
        abstract = True

#======  POST MODELS  =====#
#-------------------------#

class PublishedManager(models.Manager):
    def get_queryset(self):
        return super().get_queryset().filter(post_status='published')


# ======  CATEGORY MODELS  =====#
#-----------------------------#

class Category(models.Model):
    category_id = models.UUIDField("ID", primary_key=True, unique=True, default=uuid.uuid4, editable=False)
    category_name = models.CharField("Name", max_length=50)    
    category_slug = models.SlugField('Slug', max_length=50, unique=True)

    class Meta:
        verbose_name_plural = 'Categories'

    def __str__(self):
        return self.category_name


class Post(StatusMixinModel):
            
    # post_id = models.UUIDField("ID", primary_key=True, unique=True, default=uuid.uuid4, editable=False)
    post_image = models.ImageField("Feature Image", upload_to="images/posts/%Y/%m/%d/", null=True, height_field=None, width_field=None, max_length=None)
    post_title = models.CharField("Title", max_length=250)
    post_slug = models.SlugField("Slug", max_length=250,unique_for_date='post_published_on')
    post_content = RichTextUploadingField('content', config_name='awesome_ckeditor', blank=True)
    post_place = models.CharField("Lieu", max_length=250, default='Abidjan')
    post_tags = TaggableManager("Tags", blank=True)
    published_by = models.ForeignKey(get_user_model(), on_delete=models.CASCADE, related_name='meps_admin_posts')
    written_by = models.ForeignKey(Writter, on_delete=models.SET_NULL, null=True)
    objects = models.Manager() # The default manager.
    published = PublishedManager() # Our custom manager.
    
    class Meta:
        # abstract = True
        indexes = [ models.Index(fields=['-post_published_on']),]

    
    def __str__(self):
        return self.post_title

    def Feature_Image(self):
        print("Media/", self.post_image)
        # print((self.post_created_on.year, self.post_created_on.month, self.post_created_on.day, self.post_image))
        return mark_safe('<img src="../../../../Media/%s" width="75" height="50" />' %(self.post_image))

    Feature_Image.allow_tags = True

    def get_absolute_url(self):
        return reverse('actualite-details', kwargs={"ID": self.id, "SLUG": self.post_slug, "TAG_SLUG": self.post_tags.slug})

# class Category(models.Model):
#     name = models.CharField(max_length=255)

#     def __str__(self):
#        return self.name

#     def get_absolute_url(self): #url name
#        # return reverse('article-detail', args=(str(self.id)))
#        return reverse('home')

class Slider(models.Model):
    slideID = models.AutoField(primary_key=True)
    slide_image = models.ImageField("Image", upload_to='images/main-slider', max_length=None, null=True, blank=True)
    slide_title = models.CharField("Title", max_length=150, null=True, blank=True)
    slide_subtitle = models.CharField("Subtitle", max_length=250, null=True, blank=True)
    slide_link = models.SlugField( max_length=200, null=True, blank=True, unique=True)
    visible = models.BooleanField(default=False)

    class Meta:
        verbose_name = "Slider"
        verbose_name_plural = "Sliders"

    def __str__(self):
        return self.slide_title

    def save(self, *args, **kwargs):
        self.slide_link = slugify(self.slide_title)
        super(Slider, self).save(*args, **kwargs)
    

class DirectionSidebar(models.Model):
    name = models.CharField(max_length=100, blank=True)

    class Meta:
        ordering = ['name']
     
    def __str__(self):
        return f"{self.name}"

    # def save(self, *args, **kwargs):
    #     self.slug = slugify(self.name)
    #     super(DirectionSidebar, self).save(*args, **kwargs)


class Direction(models.Model):
    #CHOICES = Category.objects.all().values_list('category_name','category_name') 
    #direction = models.CharField(max_length=1000, blank=True)
    image = models.ImageField(upload_to ='images/directions/', null=True)
    full_form_name = models.CharField(max_length=1000)
    short_form_name = models.CharField(max_length=10, blank=True)
    slug = models.SlugField(max_length=1000, allow_unicode=True, blank=True)
    content = models.TextField(blank=True)
    status = models.CharField("Status", max_length=10, choices= POST_STATUS_CHOICES, default='draft')
    published_on = models.DateTimeField(auto_now_add = True)
    modified_on = models.DateTimeField(auto_now = True)
    
    
    class Meta:
        ordering = ['short_form_name']

    def Feature_Image(self):
        return mark_safe('<img src="../../../Media/%s" width="75" height="50" />' % (self.image))

    Feature_Image.allow_tags = True
     
    def __str__(self):
        return f"{self.short_form_name + ' - ' + self.full_form_name }"
    


class FlipCard(models.Model):
    logo = models.ImageField(upload_to ='images/directions/cards/', null=True, blank=True)
    full_form_name = models.CharField('Name', max_length=1000)
    short_form_name = models.CharField('Sigle', max_length=15, unique=True, default='', help_text='Ex: ECIS (école ivoirienne pour les sourds)', blank=True)
    slug = models.SlugField(max_length=100, allow_unicode=True, blank=True)
    # status = models.CharField(max_length=50, choices=POST_STATUS_CHOICES)
    address = models.CharField(max_length=300, blank=True, null=True)
    bp = models.CharField("BP", max_length=300, blank=True, null=True)
    tel = models.CharField('Tel', max_length=300, blank=True)
    phone = models.CharField('Phone', max_length=300,  blank=True)
    fax = models.CharField('Fax', max_length=300, blank=True)
    email = models.EmailField(blank=True, null=True)
    website = models.URLField(max_length=150, blank=True) 
    
    class Meta:
        abstract = True
    
    def __str__(self):
        return f"{self.short_form_name + '('+ self.full_form_name +')'}"

class DirectionDetail(models.Model):
    DirectionDetail_id = models.SmallAutoField(primary_key=True)
    image = models.ImageField(upload_to ='images/directions/', null=True)
    full_form_name = models.CharField(max_length=100) 
    short_form_name = models.CharField(max_length=10) 
    slug = models.SlugField(max_length=150, unique=True) 
    description = models.TextField(max_length=5000, blank=True)
    status = models.CharField("Status", max_length=10, choices= POST_STATUS_CHOICES, default='draft')
    published_on = models.DateTimeField(auto_now_add = True)
    modified_on = models.DateTimeField(auto_now = True)

    class Meta:
        verbose_name_plural = 'page';
        ordering = ['-published_on']

    def __str__(self):
        return self.full_form_name
    


class Mission(models.Model):
    mission_id = models.SmallAutoField(primary_key=True)
    title = models.CharField(max_length=100, blank=True)

    class Meta:
       pass

    def __str__(self):
        return self.title 
    

class Project(models.Model):
    project_id = models.SmallAutoField(primary_key=True)
    project = models.CharField(max_length=100, blank=True)

    class Meta:
        pass

    def __str__(self):
        return self.project 


class Objectif(models.Model):
    objectif_id = models.SmallAutoField(primary_key=True)
    objectif = models.CharField(max_length=100, blank=True)

    class Meta:
       pass

    def __str__(self):
        return self.objectif


class SousDirection(models.Model):
    sous_direction_id = models.SmallAutoField(primary_key=True)
    sous_direction = models.CharField(max_length=100, blank=True)

    class Meta:
       pass

    def __str__(self):
        return self.sous_direction


class Contact(models.Model):
    contact_id = models.SmallAutoField(primary_key=True)
    address= models.CharField('addresse', max_length=200, blank=True)
    tel = models.CharField('Téléphone', max_length=50, blank=True)
    email = models.EmailField('Email', max_length=50, blank=True)
    horaire = models.CharField('Horaire', max_length=1000, blank=True)

    # address_1 = models.CharField('addresse 1', max_length=200)
    # address_2= models.CharField('addresse 2', max_length=200, blank=True)

    # tel_1 = models.CharField('Téléphone 1', max_length=50)
    # tel_2 = models.CharField('Téléphone 2', max_length=50, blank=True)

    # email_1 = models.EmailField('Email 1', max_length=50)
    # email_2 = models.EmailField('Email 2', max_length=50, blank=True)

    # horaire_1 = models.CharField('Horaire 1', max_length=1000)
    # horaire_2 = models.CharField('Horaire 2', max_length=1000, blank=True)
    
    class Meta:
       pass


    def __str__(self):
        return 'Address: ' + self.address + ' - Tel: ' + self.tel
    
class ContactAddress(models.Model):
    address_id = models.SmallAutoField(primary_key=True)
    address= models.CharField('addresse', max_length=200, blank=True)
    
class ContactTel(models.Model):
    tel_id = models.SmallAutoField(primary_key=True)
    tel = models.CharField('Téléphone', max_length=50, blank=True)
    
class ContactEmail(models.Model):
    email_id = models.SmallAutoField(primary_key=True)
    email = models.EmailField('Email', max_length=50, blank=True)
    
class ContactHoraire(models.Model):
    horaire_id = models.SmallAutoField(primary_key=True)
    horaire = models.CharField('Horaire', max_length=1000, blank=True)



# ======  PDF DOCUMENTS MODELS  =====#
#------------------------------------#

class PdfType(models.Model):
    type = models.CharField(max_length=255, unique=True)    
    slug = models.SlugField(max_length=100, allow_unicode=True, blank=True)
    

    def __str__(self):
       return self.type

    # def save(self, *args, **kwargs):
    #     self.slug = slugify(self.type)
    #     super(PdfType, self).save(*args, **kwargs)


    # def get_absolute_url(self): 
    #    return reverse('home')


class PdfDocument(models.Model):
    # FOLDER_CHOICES = PdfType.objects.all().values_list('type','type') 
    file = models.FileField(upload_to='documents/%Y/%m/%d')
    title = models.CharField(max_length=200)
    slug = models.SlugField(max_length=250, allow_unicode=True, blank=True)
    # Type = models.ForeignKey(PdfType, on_delete=models.SET_DEFAULT, default='Autres')
    

    class Meta:
        ordering = ['title']

    def __str__(self):
        return self.title

    def save(self, *args, **kwargs):
        self.slug = slugify(self.title)
        super(PdfDocument, self).save(*args, **kwargs)


# ======  COMMENT MODELS  =====#
#-----------------------------#

class Comment(models.Model):
    # comment_ID = models.UUIDField(primary_key=True, unique=True, default=uuid.uuid4, editable=False)
    comment_post = models.ForeignKey(Post, on_delete=models.CASCADE,related_name='comments', editable=True, null=True, verbose_name="Related post")
    comment_author_name = models.CharField( max_length=100, verbose_name='Name')
    comment_author_email = models.EmailField(default='', verbose_name='Email')
    comment_author_phone = models.CharField(verbose_name='Phone', default='', max_length=15, blank=True)
    comment_content = models.TextField(verbose_name="Comment")
    comment_parent = models.ForeignKey("self" , null=True , blank=True , on_delete=models.CASCADE , related_name='replies')
    comment_posted_on = models.DateTimeField(verbose_name="Posted On", auto_now_add=True)
    comment_updated_on = models.DateTimeField(verbose_name="Modified On", auto_now=True)
    comment_approved = models.BooleanField(verbose_name="Approved", default=True)
    

    class Meta:
        ordering = ('-comment_posted_on',)
    
    
    def __str__(self):
        return f'Commented by {self.comment_author_name} on {self.comment_post}'


    
    def children(self):
        return Comment.objects.filter(comment_parent=self).reverse()

    @property
    def is_parent(self):
        if self.comment_parent is None:
            return True
        return False

    def approve(self):
        self.comment_approved = True
        self.save()

    
class HeaderLeftLogo(models.Model):
    title = models.CharField(max_length=200, default='Logo')
    image = models.ImageField(upload_to='images/logo', null=True, default='')
    link = models.URLField()
    
    class Meta:
        verbose_name = 'Header Left'
        verbose_name_plural = 'Header Left'
        
    def __str__(self):
        return self.title

class HeaderBanner(models.Model):
    title = models.CharField(max_length=200, default='image banner')
    image = models.ImageField(upload_to='images/logo', null=True, default='')
    link = models.URLField()
    
    class Meta:
        verbose_name = 'Header Banner'
        verbose_name_plural = 'Header Banner'
        
    def __str__(self):
        return self.title

class HeaderRightLogo(models.Model):
    title = models.CharField(max_length=200, default='Logo')
    image = models.ImageField(upload_to='images/logo', null=True, default='')
    link = models.URLField()
    
    class Meta:
        verbose_name = 'Header Right'
        verbose_name_plural = 'Header Right'
        
    def __str__(self):
        return self.title
