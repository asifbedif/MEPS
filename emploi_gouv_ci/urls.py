"""emploi_gouv_ci URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import include, path, re_path as url

# Add MEDIA folder to static files

from . import settings
from django.contrib.staticfiles.urls import static
from django.contrib.staticfiles.urls import staticfiles_urlpatterns
# from MEPS_ADMIN.admin import admin_meps_site
# from MEPS_ADMIN.admin import admin_dsi_site

from . import views

admin.site.index_template = 'admin/admin.html'

urlpatterns = [
    path('admin/doc/', include('django.contrib.admindocs.urls')),
    # path('admin/meps/', admin_meps_site.urls),
    # path('admin/dsi/', admin_dsi_site.urls),
    path('admin/developers/', admin.site.urls),
    path('admin/', include('MEPS_ADMIN.urls')),
    
    path('', views.home, name='index'),
    #path('admin/', include('admin.urls')),
    path('MEPS/', include('MEPS.urls')),
    path('DIRECTIONS_GENERALES/', include('DIRECTIONS_GENERALES.urls')),
    path('DOCUMENTS/', include('DOCUMENTS.urls')),
    path('PRODUITS/', include('PRODUITS.urls')),
    path('PUBLICATIONS/', include('PUBLICATIONS.urls')),
    path('NOUS_JOINDRE/', include('NOUS_JOINDRE.urls')),
    url(r'^ckeditor/', include('ckeditor_uploader.urls')), # The CKEditor path
]

urlpatterns +=staticfiles_urlpatterns()

if settings.DEBUG:
    urlpatterns +=static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
