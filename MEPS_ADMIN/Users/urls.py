
# from django.conf.urls import url
from django.urls import path, include, re_path as url
from . import views

urlpatterns = [

    url('profile/', views.admin_profile, name="admin-profile"),
    url('register/', views.admin_register, name="admin-register"),
    url('rest-password/', views.admin_reset_password, name="admin-reset-password"),
    url('login/', views.admin_login, name="admin-login"),
    url('logout/', views.admin_logout, name="admin-logout"),
    url('lock-screen/', views.admin_lock_screen, name="admin-lock-screen"),

    url('mail/', views.admin_mail, name="admin-mail"),
    
]
