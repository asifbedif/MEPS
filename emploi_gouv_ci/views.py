from django.shortcuts import render, get_list_or_404

from MEPS_ADMIN.models import HeaderLeftLogo, HeaderBanner, HeaderRightLogo
from PRODUITS.models import PostProduct
from MEPS.ministere.models import LeMinistere, MinistrePage
from MEPS.ministre.models import LeMinistre
from MEPS.Missions_Objectifs.models import MissionsObjectif
from PUBLICATIONS.models import PostActualite

the_header_upper = {}
# the_header_upper['left_logo'] = HeaderLeftLogo.objects.all()
# the_header_upper['right_logo'] = HeaderRightLogo.objects.first()
# the_header_upper['banner'] = HeaderBanner.objects.first()

def header_top(req):
    marquee_posts = PostActualite.objects.filter(post_status='published').order_by('-post_published_on')[:4]
    return render(request=req, template_name='Layouts/_headerTop.html', context=marquee_posts)

# HEADER 
def headerUpper(req):
    
    header_upper = {}
    header_upper['left_logo'] = HeaderLeftLogo.objects.first()
    header_upper['right_logo'] = HeaderRightLogo.objects.first()
    header_upper['banner'] = HeaderBanner.objects.first()
    
    # print('=============', header_upper, '=============')
    return render(request=req, template_name='Layouts/_headerUpper.html', context=
                  {
                    'left_logo': HeaderLeftLogo.objects.first(),
                    'right_logo': HeaderRightLogo.objects.first(),
                    'banner': HeaderBanner.objects.first(),
                  }
                  )


def home(req):
    
    data = {}
    # data['header_upper'] =  headerUpper(req)
        
    # recent_5_posts = Post.objects.filter(post_status='published').order_by('-post_published_on')[:5]
    all_products = PostProduct.objects.filter(status='published', visible=True)
    le_ministere= LeMinistere.objects.filter(post_status='published').first()
    le_ministre= LeMinistre.objects.filter(status='published').order_by('-published_on').first()
    missions_objectifs = MissionsObjectif.objects.filter(post_status='published').first()
    recent_4_posts = PostActualite.objects.filter(post_status='published').order_by('-post_published_on')[:4]
    
    if le_ministere is not None:
        data['ministere'] = le_ministere
        
    if le_ministre is not None:
        data['ministre'] = le_ministre
        
    if missions_objectifs is not None:
        data['missions_objectifs'] = missions_objectifs
        
    if len(all_products) > 0:
        data['total_products'] = all_products.count
        data['products'] = get_list_or_404(all_products)
    else:
        data['total_products']  = 0
        data['products']  = None
        
    if recent_4_posts is not None:
        data['recent_4_posts'] = recent_4_posts
    
    return render(request=req, template_name='index.html', context=data, )