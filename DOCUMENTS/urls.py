from django.urls import path
# from django.urls import re_path as url

from . import views

#app_name = 'DOCUMENTS'

# urlpatterns = [
#     url(r'^$', views.index, name='documents'),
#     url('<str:CATEGORY>/<slug:SLUG>', views.single_document, name='single_document')
# ]

urlpatterns = [
    path('', views.index, name='documents'),
    path('<str:SLUG>', views.single_document, name='single_document')
]