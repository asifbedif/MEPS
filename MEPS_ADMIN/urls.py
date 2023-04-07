# from django.conf.urls import url
# from django.urls import re_path as url

# from . import views

# urlpatterns = [
#     url(r'^$', views.meps_admin, name="meps-admin"),

#     url('le-ministere/', views.admin_ministere, name="admin-le-ministere"),

#     url('documents/', views.admin_documents, name="admin-documents"),


#     url('Publications/communiques/', views.admin_communiques, name="admin-communiques"),
#     url('Publications/actualite/', views.admin_actualite, name="admin-actualite"),

#     url('profile/', views.admin_profile, name="admin-profile"),
#     url('register/', views.admin_register, name="admin-register"),
#     url('rest-password/', views.admin_reset_password, name="admin-reset-password"),
#     url('login/', views.admin_login, name="admin-login"),
#     url('lock-screen/', views.admin_lock_screen, name="admin-lock-screen"),

#     url('mail/', views.admin_mail, name="admin-mail"),
#     url('media/', views.admin_media, name="admin-media"),

# ]


from django.contrib import admin

# from django.conf.urls import url
from django.urls import path, include, re_path as url

from .admin import dsi_superuser_site, meps_superuser_site
from . import views

urlpatterns = [
    path('dsi/', dsi_superuser_site.urls),
    path('meps/', meps_superuser_site.urls),
    path('', views.meps_admin, name="meps-admin"),
    url('le-ministere/', views.admin_ministere, name="admin-le-ministere"),

    url('documents/', views.admin_documents, name="admin-documents"),

    url('Publications/communiques/', views.admin_communiques, name="admin-communiques"),
    url('Publications/actualite/', views.admin_actualite, name="admin-actualite"),

    url('users/', include('MEPS_ADMIN.Users.urls')),
    # url('profile/', views.admin_profile, name="admin-profile"),
    # url('register/', views.admin_register, name="admin-register"),
    # url('rest-password/', views.admin_reset_password, name="admin-reset-password"),
    # url('login/', views.admin_login, name="admin-login"),
    # url('logout/', views.admin_logout, name="admin-logout"),
    # url('lock-screen/', views.admin_lock_screen, name="admin-lock-screen"),

    url('media/', views.admin_media, name="admin-media"),

]
