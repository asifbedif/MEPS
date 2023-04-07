from django.db import models
import uuid
from django.utils import timezone
from django.utils.safestring import mark_safe
from django.contrib.auth.models import User
from django.contrib.auth import get_user_model
from django.urls import reverse




# Create your models here.

#======  POST MODELS  =====#
#-------------------------#

class PublishedManager(models.Manager):
    def get_queryset(self):
        return super().get_queryset().filter(post_status='published')

class Post(models.Model):
    POST_STATUS_CHOICES = (
                        ('draft', 'Draft'),
                        ('published', 'Published'),
                        ('deleted', 'Deleted')
                    )

    COMMENT_STATUS_CHOICES = (
        ('opened', 'Opened'),
        ('closed', 'Closed')
    )

    # post_id = models.UUIDField("ID", primary_key=True, unique=True, default=uuid.uuid4, editable=False)
    post_image = models.ImageField("Feature Image", upload_to="images/", null=True, height_field=None, width_field=None, max_length=None)
    post_title = models.CharField("Title", max_length=250)
    post_slug = models.SlugField("Slug", max_length=250,unique_for_date='post_published_on')
    post_author = models.ForeignKey(User, on_delete=models.CASCADE, verbose_name= "Author", related_name='meps_admin_posts')
    post_content = models.TextField()
    post_published_on = models.DateTimeField("Published On", default=timezone.now)
    post_created_on = models.DateTimeField(verbose_name= "Created On",auto_now_add=True)
    post_modified_on = models.DateTimeField(verbose_name= "Modified On",auto_now=True)
    post_category = models.ForeignKey('Category', on_delete=models.SET_NULL, verbose_name="Category", blank=True, null=True)
    post_status = models.CharField("Status", max_length=10, choices= POST_STATUS_CHOICES, default='draft')
    comment_status = models.CharField("Comment status", choices= COMMENT_STATUS_CHOICES, default='opened', max_length=10)
    comment_count = models.PositiveIntegerField("Comments", default=0)
    

    objects = models.Manager() # The default manager.
    published = PublishedManager() # Our custom manager.
    

    class Meta:
        ordering = ('-post_published_on',)
        indexes = [
        models.Index(fields=['-post_published_on']),
        ]

    
    def __str__(self):
        return self.post_title

    def Feature_Image(self):
        return mark_safe('<img src="../../../Media/%s" width="75" height="50" />' % (self.post_image))

    Feature_Image.allow_tags = True

    def get_absolute_url(self):
        return reverse('actualite', args=[self.id])



# ======  CATEGORY MODELS  =====#
#-----------------------------#

class Category(models.Model):
    category_id = models.UUIDField("ID", primary_key=True, unique=True, default=uuid.uuid4, editable=False)
    category_name = models.CharField("Name", max_length=50)    
    category_slug = models.SlugField(max_length=50)

    class Meta:
        verbose_name_plural = 'Categories'

    def __str__(self):
        return self.category_name
    


# ======  COMMENT MODELS  =====#
#-----------------------------#

class Comment(models.Model):
    comment_ID = models.UUIDField(primary_key=True, unique=True, default=uuid.uuid4, editable=False)
    comment_post = models.ForeignKey(Post, on_delete=models.CASCADE,related_name='Comments',editable=True, null=True, verbose_name="Related post")
    comment_author = models.ForeignKey(get_user_model(), on_delete = models.CASCADE, verbose_name='User')
    # comment_author_email = models.EmailField()
    # comment_author_url = models.URLField("Profile", max_length=200)
    comment_content = models.TextField(verbose_name="Comment")
    comment_parent = models.ForeignKey('self' , null=True , blank=True , on_delete=models.CASCADE , related_name='replies')
    comment_posted_on = models.DateTimeField(verbose_name="Posted On", auto_now_add=True)
    comment_updated_on = models.DateTimeField(verbose_name="Modified On", auto_now=True)
    comment_approved = models.BooleanField(verbose_name="Approved", default=False)
    

    @property
    def children(self):
        return Comment.objects.filter(comment_parent=self).reverse()

    @property
    def is_parent(self):
        if self.comment_parent is None:
            return True
        return False


    class Meta:
        ordering = ('comment_posted_on',)
    
    
    def __str__(self):
        return f'Commented by {self.comment_author} on {self.comment_post}'



    def approve(self):
        self.comment_approved = True
        self.save()

    