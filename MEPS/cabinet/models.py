from django.db import models
from MEPS_ADMIN.models import Post
from PUBLICATIONS.models import PublicationCategory
from django.utils.safestring import mark_safe
# Create your models here.

class Chapter(models.Model):
    number = models.PositiveSmallIntegerField(primary_key=True)
    title = models.CharField(max_length=100, unique=True)
    
    class Meta:
        ordering = ('number',)

    def __str__(self):
        return str(self.number) +': ' + self.title


class Article(models.Model):
    #CHAPTER_CHOICES = [int(ch) for ch in Chapter.objects.all().values_list('number','number')]
    number = models.PositiveSmallIntegerField(primary_key=True)
    title = models.CharField(max_length=150, unique=False)
    # description = models.TextField(max_length=350, blank=True)
    #chapter = models.CharField(max_length=200, choices=CHAPTER_CHOICES, default=1)
    chapter = models.ForeignKey(Chapter, on_delete=models.SET_NULL, null=True,  default=1)
    
    class Meta:
        ordering = ('number',)

    def __str__(self):
        return str(self.number) +': ' + self.title


class ArticleList(models.Model):
    number = models.PositiveSmallIntegerField(primary_key=True)
    sentence = models.TextField(max_length=500, unique=True)
    article = models.ForeignKey(Article, on_delete=models.SET_NULL, null=True,  default=1)
    
    class Meta:
        ordering = ('number',)

    def __str__(self):
        return str(self.number)

class DecretCabinet(Post):
    post_category =  models.ForeignKey(PublicationCategory, verbose_name='Category', related_name='decrets', on_delete=models.CASCADE, null=True,  default=1)
    fait_a = models.CharField(max_length=50)
    fait_le = models.DateField(auto_now=False, auto_now_add=False)
    
    def __str__(self):
        return self.post_title

class DecretList(models.Model):
    number = models.SmallAutoField(primary_key=True)
    sentence = models.TextField(max_length=500, unique=True)
    
    class Meta:
        ordering = ('-number',)

    def __str__(self):
        return str(self.number) +': ' + self.sentence


class Cabinet(Post):
    pass

    class Meta:
        verbose_name_plural = 'Le Cabinet'

class CabinetDecretArticle(models.Model):
    pass

class CabinetSidebar(models.Model):
    pass

    class Meta:
        verbose_name_plural = 'Le Cabinet'



class CabinetDecretChapter(CabinetSidebar):
    title = models.CharField(max_length=50, unique=True)


    class Meta:
        # verbose_name_plural = ''
        pass
