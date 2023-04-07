from django.shortcuts import render, get_object_or_404
from .models import *

# Create your views here.
def index(req):
    return render(req, 'documents/index.html',
        {
            # 'documents': Document.filter(status = 'published').all(),.filter(status = 'published').all(),          
            'docs_categories': DocumentCategory.objects.all(),
            'docs_subcategories': DocumentSousCategory.objects.all(),
        }
    )

def single_document(req, SLUG):
    sousCategory_slug = DocumentSousCategory.objects.get(slug=SLUG)
    list_of_docs = Document.objects.filter(sous_category=sousCategory_slug).filter(status = 'published')

    print(SLUG)
    print(sousCategory_slug.category)          
    print(list_of_docs)
    return render(req, 'documents/single-document.html', { 
                                                            'list_of_docs': list_of_docs,
                                                            'documents_category': sousCategory_slug.category,
                                                            'documents_subcategory': sousCategory_slug.type,
                                                        }
                                                        )