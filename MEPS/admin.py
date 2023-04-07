from django.contrib import admin

# Register your models here.

class MepsAdminArea(admin.AdminSite):
    site_header = 'MEPS ADMINISTRATEUR'
    
admin_meps_site = MepsAdminArea(name="Meps Administrateur")

