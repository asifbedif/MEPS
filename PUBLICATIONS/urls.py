#from django.conf.urls import url
from django.urls import re_path as url
from django.urls import path


from . import views


#app_name = 'PUBLICATIONS'

urlpatterns = [
    url(r'^$', views.index, name='publications'),
    path('actualites/', views.actualites, name='actualites'),
    url('results/?$', views.search_results, name='search-results'),
    path('actualites/details/<int:YEAR>/<int:MONTH>/<int:DAY>/<slug:SLUG>/', views.actualite_details, name='actualite_details'),
    path('actualites/comments/reply', views.actualite_comment_reply, name='actualite_comment_reply'),
    path('actualites/tags/<slug:TAG_SLUG>', views.actualite_details, name='actualite_tags'),
    path('communiques/', views.communiques, name='communiques'),
    path('communiques/details/<int:YEAR>/<int:MONTH>/<int:DAY>/<int:ID>/<slug:SLUG>/', views.communique_details, name='communique_details'),
    path('médiathèque/', views.mediatheque, name='mediatheque'),
    path('médiathèque/photos', views.mediatheque_photos, name='mediatheque_photos'),
    path('médiathèque/videos', views.mediatheque_videos, name='mediatheque_videos'),
]