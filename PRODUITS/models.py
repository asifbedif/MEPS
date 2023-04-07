from django.db import models

# Create your models here.
from django.contrib.auth.models import User
from django.utils import timezone
from django.utils.safestring import mark_safe


from django.urls import reverse
from MEPS_ADMIN.models import POST_STATUS_CHOICES, Slider, Category


class ProductCategory(models.Model):
    category_name = models.CharField("Name", max_length=50)    
    category_slug = models.SlugField('Slug', max_length=50, unique=True)


    class Meta:
        ordering = ['category_name']
        indexes = [
        models.Index(fields=['category_name']),
        ]
        verbose_name = 'category'
        verbose_name_plural = 'categories'

    def __str__(self):
        return self.category_name



class Product(models.Model):
    image = models.ImageField("Feature Image", upload_to="images/produits/", null=True, height_field=None, width_field=None, max_length=None)
    title = models.CharField("Title", max_length=250)
    slug = models.SlugField("Slug", max_length=250,unique_for_date='published_on')
    author = models.ForeignKey(User, on_delete=models.CASCADE, verbose_name= "Author", related_name='product_posts')
    content = models.TextField('content', blank=True)
    place = models.CharField("Lieu", max_length=250, default='Abidjan')
    published_on = models.DateTimeField("Published On", default=timezone.now)
    created_on = models.DateTimeField(verbose_name= "Created On",auto_now_add=True)
    modified_on = models.DateTimeField(verbose_name= "Modified On",auto_now=True)
    # category = models.CharField('Category' , choices=Category , max_length=50)
    category = models.ForeignKey(ProductCategory, related_name='product_category', on_delete=models.CASCADE)
    status = models.CharField("Status", max_length=10, choices= POST_STATUS_CHOICES, default='draft')
    comment_status = models.CharField("Comment status", choices= (('opened', 'Opened'), ('closed', 'Closed')), default='opened', max_length=10)
    comment_count = models.PositiveIntegerField("Comments", default=0)
    
    class Meta:
        indexes = [ 
            models.Index(fields=['id', 'slug']),
            models.Index(fields=['title']),
            models.Index(fields=['-created_on']),
            
        ]

    def __str__(self):
        return self.title

    def Feature_Image(self):
        return mark_safe('<img src="../../../Media/%s" width="75" height="50" />' % (self.image))

    Feature_Image.allow_tags = True
    

class PostProduct(Product, Slider):
    pass

    class Meta:
        verbose_name = 'Régime'
        verbose_name_plural = 'Régimes'
        ordering = ('-published_on',)

class ProductCmu(models.Model):
    category = models.ForeignKey(ProductCategory, on_delete=models.SET_DEFAULT, default='uncategorized')

    class Meta:
        verbose_name_plural = 'Régime CMU'




class ProductRsti(models.Model):
    category = models.ForeignKey(ProductCategory, on_delete=models.SET_DEFAULT, default='uncategorized')

    class Meta:
        verbose_name_plural = 'Régime RSTI'




class ProductComplementaire(models.Model):
    category = models.ForeignKey(ProductCategory, on_delete=models.SET_DEFAULT, default='uncategorized')

    class Meta:
        verbose_name_plural = 'Régime COMPLEMENTAIRE'


class ProductSidebar(models.Model):
    pass
#     SIDEBAR_PAGE_CHOICES = (
#         ('cmu', 'CMU'),
#         ('rsti', 'RSTI'),
#         ('complementaire', 'COMPLEMENTAIRE')
#     )
#     item_title = models.CharField(max_length=50)
#     item_link = models.URLField()
#     product_page_sidebar =  models.CharField("On Page", choices= SIDEBAR_PAGE_CHOICES, max_length=50, null=True, blank=True)
   