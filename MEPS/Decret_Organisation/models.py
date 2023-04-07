from django.db import models

from dynamic_filenames import FilePattern
from MEPS_ADMIN.models import StatusMixinModel

# Create your models here.

# uploaded_to_folder = FilePattern(file_pattern = '{app_label:25}/{model_name:30}/{instance.title: 40slug}{ext}')
uploaded_to_folder = FilePattern(
    file_pattern = "{app_label:25}/{model_name:30}/{ext}"
    )


print(uploaded_to_folder)


class DecretOrganisation(StatusMixinModel):
    pdf = models.FileField(upload_to='PDF/decret-organisation/%Y/%m/%d/')
    title = models.CharField(max_length=50, default="Decret d'Organisation du MEPS")
    slug = models.SlugField(max_length=70, unique=True)
    description = models.TextField(max_length=1000, blank=True)
    
    class Meta:
        verbose_name_plural = 'Page'

    def __str__(self):
        return self.pdf.name[11:4]