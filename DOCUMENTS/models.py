from django.db import models
from django.urls import reverse
# Create your models here.
from MEPS_ADMIN.models import POST_STATUS_CHOICES, PdfDocument, PdfType


class DocumentCategory(PdfType):
    pass

    class Meta:
        verbose_name_plural = 'Catégorie'


class DocumentSousCategory(PdfType):
    category = models.ForeignKey(DocumentCategory, on_delete=models.CASCADE, default='inconnu', related_name='document_category')
    
    class Meta:
        verbose_name = 'Sous-catégory'
        verbose_name_plural = 'Sous-catégories'

    
    

class Document(PdfDocument):
    sous_category = models.ForeignKey(DocumentSousCategory, on_delete=models.SET_DEFAULT, default='Autres', related_name='documents_subcategories')
    category = models.ForeignKey(DocumentCategory, on_delete=models.CASCADE, default='Inconnu', related_name='documents_categories')
    status = models.CharField("Status", max_length=10, choices= POST_STATUS_CHOICES, default='draft')

