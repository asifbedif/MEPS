from django.db import models

# Create your models here.
from django.urls import reverse

from django.utils.text import slugify
from django.contrib.auth.models import User
from MEPS_ADMIN.Users.models import Writter
from MEPS_ADMIN.models import Post, PublishedManager, Comment
# from MEPS_ADMIN.Users.models import Writter
from django.utils import timezone


class PublicationCategory(models.Model):
    name = models.CharField(max_length=50, unique=True)
    slug = models.SlugField(max_length=100)

    class Meta:
        ordering = ['id']
        verbose_name= 'Catégorie'
        verbose_name_plural= '_Catégories'

    def __str__(self):
        return self.name
     

class PublicationSousCategory(models.Model):
    name = models.CharField(max_length=50, unique=True)
    slug = models.SlugField(max_length=200)
    category = models.ForeignKey(PublicationCategory, on_delete=models.SET_NULL, blank=True, null=True)


    class Meta:
        ordering = ['id']
        verbose_name= 'Sous-Catégorie'
        verbose_name_plural= '_Sous-Catégories'

    def __str__(self):
        return  self.name
    
   
class PostActualite(Post):
    post_category = models.ForeignKey(PublicationCategory, on_delete=models.CASCADE, blank=True, null=True)
    
    
    class Meta:
        ordering = ['post_title']
        verbose_name= 'Actualité'
        verbose_name_plural= 'Actualités'
     

    # def get_absolute_url(self):
    #     return reverse('actualite_details', args=[self.post_slug])

    def get_absolute_url(self):
        return reverse('actualite_details', args=[  self.post_published_on.year,
                                                    self.post_published_on.month,
                                                    self.post_published_on.day,
                                                    self.post_slug
                                                    ]
                        )


class PostAlbum(models.Model):
    post = models.ForeignKey(PostActualite, verbose_name='Album', default=None, on_delete=models.CASCADE, related_name='post_album')
    images = models.ImageField(upload_to='images/posts/%Y/%m/%d/Album/%m/%d/')
    photos = models.FileField(upload_to='images/posts/%Y/%m/%d/Album/%m/%d/', default=None, null=True)
    
    def __str__(self):
        return self.post.post_title
    
    class Meta:
        verbose_name = 'Album'
        verbose_name_plural = 'Albums'
 



class PostCommunique(models.Model):
    post_pdf = models.FileField(upload_to='communique/%Y/%m/%d/')
    post_title = models.CharField(max_length = 1000, unique_for_date='post_created_on')
    com_category = models.ForeignKey( PublicationCategory, verbose_name='Category', on_delete=models.CASCADE, default=4)
    com_sous_category = models.ForeignKey(PublicationSousCategory, verbose_name='Sous-Category', on_delete=models.SET_NULL, blank=True, null=True)
    post_status = models.CharField("Status", max_length=10, choices= Post.POST_STATUS.choices, default='draft')
    post_published_on = models.DateTimeField("Published On", default=timezone.now)
    post_created_on = models.DateTimeField(verbose_name= "Created On", auto_now_add=False, default=timezone.now)
    post_slug = models.SlugField(max_length=200, blank=True)
    # published = PublishedManager() # Our custom manager.
    
    class Meta:
        ordering = ['-post_published_on']
        verbose_name = 'Communiqué'
        verbose_name_plural = 'Communiqués'
     
    def __str__(self):
        return f"{self.post_title}"

    def save(self, *args, **kwargs):
        self.post_slug = slugify(self.post_title)
        super(PostCommunique, self).save(*args, **kwargs)
    
    def get_absolute_url(self):
        return reverse('communique_details', args=[ self.post_published_on.year,
                                                    self.post_published_on.month,
                                                    self.post_published_on.day,
                                                    self.post_slug,
                                                    ]
                        )
    
    
    
class PostComment(Comment):
    pass
