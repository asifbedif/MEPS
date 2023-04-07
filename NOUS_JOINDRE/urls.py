# from django.conf.urls import url
from django.urls import re_path as url

from . import views

#app_name = 'NOUS_JOINDRE'

urlpatterns = [
    url('nos-contacts/', views.contacts, name='nos-contacts'),
    url('faq/', views.faq, name='faq'),
]
