from django.db import models
from django.db.models.signals import post_save
from django.dispatch import receiver
from django.contrib.auth.models import User

# Create your models here.

STATUS_CHOICES = [
                    ('active', 'Active', ),
                    ('inactive', 'Inactive', ),
]

ROLE_CHOICES = [
                ('superadmin', 'SuperAdmin'),
                ('admin', 'Admin'),
                ('auteur', 'Auteur'),
                ('staff', 'Staff'),
]

class TitleSlug(models.Model):
    title = models.CharField(max_length=100, default='')
    slug = models.SlugField(max_length=250)
    
    class Meta:
        abstract = True

class ServiceDirection(TitleSlug):
    # service_direction_id = models.AutoField(primary_key=True)
    pass

    def __str__(self):
        return self.title

class Service(TitleSlug):
    # service_id = models.AutoField(primary_key=True)
    direction = models.ForeignKey(ServiceDirection, on_delete=models.SET_NULL, null=True)
    
    def __str__(self):
        return self.title

class UserRole(TitleSlug):
    pass
    # role_id = models.AutoField(primary_key=True)
    def __str__(self):
        return self.title


class UserProfile(models.Model):
    current_user = models.OneToOneField(User, on_delete=models.CASCADE)
    photo = models.ImageField(upload_to='images/faces/', blank=True, height_field=None, width_field=None, max_length=None)
    # role = models.CharField(max_length=10, choices=ROLE_CHOICES, default='staff')
    role = models.ForeignKey(UserRole, on_delete=models.SET_NULL, default='',null=True, blank=True)
    first_name = models.CharField(max_length=100, blank=True)
    last_name = models.CharField(max_length=100, blank=True)
    biography = models.CharField(max_length=500, default='', blank=True)
    status = models.CharField(max_length=10, choices=STATUS_CHOICES, default='inactive')
    phone = models.IntegerField(default=0)
    email = models.EmailField(max_length=254, default='example@emploi.gouv.ci')
    service = models.ForeignKey(Service, on_delete=models.SET_NULL, default='', null=True, blank=True)

    def __str__(self):
        return self.current_user.username

@receiver(post_save, sender=User)
def create_user_profile(sender, instance, created, **kwargs):
    if created:
        UserProfile.objects.create(current_user=instance)

@receiver(post_save, sender=User)
def save_user_profile(sender, instance, **kwargs):
    if instance:
        instance.userprofile.save()

post_save.connect(create_user_profile, sender=User)


class Writter(models.Model):
    added_by = models.ForeignKey(User, on_delete=models.SET_NULL, null=True, default='')
    photo = models.ImageField(upload_to='images/faces/', blank=True, height_field=None, width_field=None, max_length=None)
    user_name = models.CharField(max_length=50, default='', blank=True)
    first_name = models.CharField(max_length=50, blank=True)
    last_name = models.CharField(max_length=50, blank=True)
    biography = models.CharField(max_length=500, default='', blank=True)
    email = models.EmailField(max_length=254, default='example@emploi.gouv.ci')
    phone = models.IntegerField(default=0)
    
    def __str__(self):
        return  self.user_name
    
    

