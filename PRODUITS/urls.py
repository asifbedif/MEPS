
# from django.conf.urls import url
from django.urls import path, re_path as url

from . import views

#app_name = 'PRODUITS'

urlpatterns = [
    path('', views.products_list, name='products-list'),    
    path('<slug:LINK>/', views.product_details, name='product-details'),
    
    # url('rsti/', views.prod_rsti, name='rsti'),
    # url('cmu/', views.prod_cmu, name='cmu'),
    # url('complementaire/', views.prod_complementaire, name='complementaire'),
]