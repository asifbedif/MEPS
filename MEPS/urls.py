
# from django.conf.urls import url
from django.urls import re_path as url

from . import views

#app_name = 'MEPS'

urlpatterns = [
    url('directions-generales', views.directions, name='directions'),
    url('ministere/', views.ministere, name='ministere'),
    url('decret-d-organisation/', views.decret_d_organisation, name='decret-d-organisation'),
    url('ecoles-specialisees/', views.ecoles_specialisees, name='ecoles-specialisees'),
    url('epn/', views.epn, name='epn'),
    url('le-cabinet/', views.le_cabinet, name='le-cabinet'),
    url('le-ministre/', views.le_ministre, name='le-ministre'),
    url('organigramme/', views.organigramme, name='organigramme'),
    url('structures-sous-tutelles/', views.structures_sous_tutelles, name='structures-sous-tutelles'),
    url('missions-et-objectifs/', views.missions_objectifs, name='missions-et-objectifs'),
    url('equipe-du-cabinet/', views.equipe_du_cabinet, name='equipe-du-cabinet'),
    url('inspection-generale/', views.inspection_generale, name='inspection-generale'),
    url('directions-et-services-rattaches/', views.directions_services_rattaches, name='directions-et-services-rattaches'),
    url('missions-et-objectifs', views.missions_objectifs, name='missions-et-objectifs'),

    url('directions-et-services-rattaches/dafm', views.dafm, name='dafm'),
    url('directions-et-services-rattaches/daj', views.daj, name='daj'),
    url('directions-et-services-rattaches/ddca', views.ddca, name='ddca'),
    url('directions-et-services-rattaches/dsi', views.dsi, name='dsi'),
    url('directions-et-services-rattaches/drh', views.drh, name='drh'),
    url('directions-et-services-rattaches/sgp', views.sgp, name='sgp'),
    url('directions-et-services-rattaches/smht', views.smht, name='smht'),
    url('directions-et-services-rattaches/cellule-de-passation', views.cellulepassation, name='cellulepassation'),
    url('directions-et-services-rattaches/dpcsps', views.dpcsps, name='dpcsps'),
      
]

