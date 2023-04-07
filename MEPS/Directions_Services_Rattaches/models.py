from django.db import models
from django.utils import timezone

from MEPS_ADMIN.models import FlipCard, POST_STATUS_CHOICES

# Create your models here.
class DirectionsServicesRattachés(FlipCard):
    post_published_on = models.DateTimeField("Published On", default=timezone.now)
    post_created_on = models.DateTimeField(verbose_name= "Created On",auto_now_add=True)
    post_modified_on = models.DateTimeField(verbose_name= "Modified On",auto_now=True)
    #post_category = models.ForeignKey('Category', on_delete=models.SET_NULL, verbose_name="Category", blank=True, null=True)
    post_status = models.CharField("Status", max_length=10, choices= POST_STATUS_CHOICES, default='draft')
    display_first = models.BooleanField(default=False)

    class Meta:
        verbose_name_plural = 'Page'

    def __str__(self):
        return f"{self.full_form_name}"
    