
# from django.conf.urls import url
from django.urls import re_path as url

from . import views

#app_name = 'DIRECTIONS_GENERALES'


urlpatterns = [
    url(r'^$', views.directions_generales, name='directions-generales'),
    url('cnps/', views.cnps, name='cnps'),
    url('das/', views.das, name='das'),
    url('dge/', views.dge, name='DGE'),
    # url('dge/<slug:direction_slug>', views.dge_doem, name='dge_doem'),
    url('dgps/', views.dgps, name='DGPS'),    
    url('dgt/', views.dgt, name='DGT'),
    url('dit/', views.dit, name='dit'),
    url('dlte/', views.dlte, name='dlte'),
    url('doem/', views.doem, name='doem'),
    url('dpph/', views.dpph, name='dpph'),
    url('drt/', views.drt, name='drt'),
    url('dsepe/', views.dsepe, name='dsepe'),
    url('dspe/', views.dspe, name='dspe'),
    url('dssm/', views.dssm, name='dssm'),
    url('dsst/', views.dsst, name='dsst'),
    # url('dge/', views.dge, name='DGE'),
    
   
]
