from MEPS_ADMIN.admin import *
from MEPS_ADMIN.Users.models import *
from django.contrib.auth.models import User, Group

from .dsi_admin import REGISTER_MODELS_FOR_DSI_DASHBOARD
from .meps_admin import REGISTER_MODELS_FOR_MEPS_DASHBOARD


REGISTER_MODELS_FOR_DSI_DASHBOARD()

REGISTER_MODELS_FOR_MEPS_DASHBOARD()

# MEPS_ADMIN_models = apps.get_app_config('MEPS_ADMIN').get_models()
# MEPS_models = apps.get_app_config('MEPS').get_models()
# DIRECTIONS_GENERALES_models = apps.get_app_config('DIRECTIONS_GENERALES').get_models()
# PUBLICATIONS_models = apps.get_app_config('PUBLICATIONS').get_models()
# DOEM_models = apps.get_app_config('doem').get_models()
# DOC_models = apps.get_app_config('DOCUMENTS').get_models()

# specific_apps_models = [  MEPS_ADMIN_models,
#                 MEPS_models, 
#                 DIRECTIONS_GENERALES_models,
#                 PUBLICATIONS_models,
#                 DOEM_models,
#                 DOC_models,
            
#                 ]



# all_apps_models = apps.get_models()

# for model in specific_apps_models:
#     admin_class = type('AdminClass', (ListAdminMixin, admin.ModelAdmin), {})
    
#     try:
#         if(admin_class is PostAdmin):
#             admin_class = PostAdmin
#         dsi_superuser_site.register(model, admin_class)
#     except dsi_superuser_sites.AlreadyRegistered:
#         pass

