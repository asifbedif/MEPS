from django.shortcuts import render, get_object_or_404
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from .models import PostProduct

# Create your views here.

def products_list(req):   
    return render(req, 'produits/index.html',
                    {
                        'all_products': PostProduct.objects.filter(status='published').order_by('-published_on'),
                    }
                 )

def product_details(request, LINK):
    data = {}
    prod = get_object_or_404(PostProduct, status='published', slide_link=LINK )
    
    if prod:
        data['product'] = prod
    else:
        data['product'] = None   
    print(data)
    return render(request, 'produits/product-detail.html', data, )

# def prod_rsti(req):

#     rsti = get_object_or_404(
#                                 ProductCmu,
#                                 title=SLUG,
#                                 published_on__year=YEAR,
#                                 published_on__month=MONTH,
#                                 published_on__day=DAY,
#                                 post_status='published'
#                                 )
    
#     return render(req, 'produits/rsti.html')

# def prod_cmu(req):
#     return render(req, 'produits/cmu.html')

# def prod_complementaire(req):
#     return render(req, 'produits/complementaire.html')