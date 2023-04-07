from importlib import import_module
from django.contrib import admin

from django.apps import apps

from django.conf import settings

from .models import *
from PUBLICATIONS.models import *

from NOUS_JOINDRE.models import *

from DIRECTIONS_GENERALES.models import *

from DIRECTIONS_GENERALES.DGE.models import *
from DIRECTIONS_GENERALES.DGE.dspe.models import *
from DIRECTIONS_GENERALES.DGE.dsepe.models import *
from DIRECTIONS_GENERALES.DGE.doem.models import *

from DIRECTIONS_GENERALES.DGT.models import *
from DIRECTIONS_GENERALES.DGT.dit.models import *
from DIRECTIONS_GENERALES.DGT.dlte.models import *
from DIRECTIONS_GENERALES.DGT.drt.models import *
from DIRECTIONS_GENERALES.DGT.dsst.models import *

from DIRECTIONS_GENERALES.DGPS.models import *
from DIRECTIONS_GENERALES.DGPS.das.models import *
from DIRECTIONS_GENERALES.DGPS.dpph.models import *
from DIRECTIONS_GENERALES.DGPS.dssm.models import *

from DOCUMENTS.models import *
from PRODUITS.models import *
from MEPS.admin import admin_meps_site
from MEPS.models import *
from MEPS.ministere.models import *
from MEPS.ministre.models import *
from MEPS.cabinet.models import *
from MEPS.organigramme.models import *
from MEPS.StructuresSousTutelles.models import *
from MEPS.Directions_Services_Rattaches.models import *
from MEPS.Decret_Organisation.models import *
from MEPS.EcolesSpecialisees.models import *
from MEPS.Missions_Objectifs.models import *
from MEPS_ADMIN.Users.models import *



DIRECTION_FIELDSET = [
            (None, {'fields': ('title', 'slug', 'description')}),
            ('Projects', {'fields': ['project',], 'classes': ['collapse']}),
            ('Missions', {'fields': ('mission',), 'classes': ['collapse']}),
            ('Objectifs', {'fields': ('objectif',), 'classes': ['collapse']}),
            ('sous_direction', {'fields': ('sous_direction',), 'classes': ['collapse']}),
            ('contact', {'fields': ('address_1', 'address_2', 'tel_1', 'tel_2', 'email_1', 'email_2', 'horaire_1', 'horaire_2'), 'classes': ['collapse']}),        
]

PROJECT_FIELDSET = ('Projects', {'fields': ['project',], 'classes': ['collapse']})

MISSION_FIELDSET = ('Missions', {'fields': ('mission',), 'classes': ['collapse']})

OBJECTIF_FIELDSET = ('Objectifs', {'fields': ('objectif',), 'classes': ['collapse']})
            

SOUS_DIRECTION_FIELDSET = ('sous_direction', {'fields': ('sous_direction',), 'classes': ['collapse']})
            
CONTACT_FIELDSET = ('contact', {'fields': ('address_1', 'address_2', 'tel_1', 'tel_2', 'email_1', 'email_2', 'horaire_1', 'horaire_2'), 'classes': ['collapse']})  




def directionDetailsOptions():
    
    from django.contrib.admin import ModelAdmin
    ModelAdmin.list_display = ['short_form_name', 'full_form_name', 'slug', 'status', 'published_on', 'modified_on',]
    ModelAdmin.list_display_links = ['full_form_name', 'short_form_name' ]  
    ModelAdmin.list_editable = ['status',]
    ModelAdmin.prepopulated_fields = {'slug': ('short_form_name',)}

class DsiAdminArea(admin.AdminSite):
    site_header = 'DSI ADMINISTRATEUR'
    
admin_dsi_site = DsiAdminArea(name="Dsi Administrateur")



class CustomModelAdmin(admin.ModelAdmin):
    
    def __init__(self, model, admin_site):
        self.list_display = [field.name for field in model._meta.fields if field.name != "id"]
        self.list_per_page = 9
        super(CustomModelAdmin, self).__init__(model, admin_site)

class ListAdminMixin(object):
    def __init__(self, model, admin_site):
        self.list_display = [field.name for field in model._meta.fields]
        super(ListAdminMixin, self).__init__(model, admin_site)


class StatusMixin(admin.ModelAdmin):
    ordering = ('post_status', '-post_published_on')


class PostAdmin(admin.ModelAdmin):

    #list of fields to display in django admin
    list_display = ('Feature_Image', 'post_title', 'post_slug', 'short_post_content', 'post_author', 'post_created_on', 'post_published_on', 'post_modified_on', 'post_status', 'comment_status', 'comment_count')
    # list_display = [field.name for field in PostActualite._meta.get_fields()]

    list_display_links = ('post_title', 'short_post_content')

    list_per_page = 6
    
    list_filter = ('post_status', 'post_created_on', 'post_published_on', 'post_author')
    
    #if you want django admin to show the search bar, just add this line
    search_fields = ('post_author__startswith', 'post_title', 'post_content')
    
    prepopulated_fields = {'post_slug': ('post_title',)}
    
    raw_id_fields = ('post_author',)
    
    date_hierarchy = 'post_published_on'

    editable_list = ['post_status', 'comment_status']
    
    #to define model data list ordering
    ordering = ('post_status', '-post_published_on')

    def short_post_content(self, obj):
        from django.utils.html import format_html
        return format_html("<em style='color: green'>{}</em>", obj.post_content if len(obj.post_content) < 50 else (obj.post_content[:46] + '  [..]'))
    short_post_content.short_description = 'Content'

    

class CommentAdmin(admin.ModelAdmin):
    list_display = ('short_comment', 'comment_author','comment_post', 'comment_posted_on', 'comment_updated_on', 'comment_approved')
    list_filter = ('comment_approved', 'comment_posted_on', 'comment_updated_on')
    search_fields = ('comment_content', 'comment_author')
    list_per_page = 5
    actions = ['approve_comments', 'disapprove_comments']

    def approve_comments(self, request, queryset):
        queryset.update(comment_approved=True)

    def disapprove_comments(self, request, queryset):
        queryset.update(comment_approved=False)

    def short_comment(self, obj):
        return obj.comment_content if len(obj.comment_content) < 30 else (obj.comment_content[:27] + '..')


class CategoryAdmin(admin.ModelAdmin):
    list_display = ('category_name', 'category_slug')
    prepopulated_fields = {'category_slug': ('category_name',)}


class PublicationCategoryAdmin(admin.ModelAdmin):
    prepopulated_fields = {'slug': ('name',)}
    list_display = ['id','name',]



class PublicationSousCategoryAdmin(admin.ModelAdmin):
    prepopulated_fields = {'slug': ('name',)}
    list_display = ['id','name', 'category',]
    list_display_links = ['name', ]



class PostActualiteAdmin(PostAdmin):
    pass
    # list_display = [field.name for field in PostActualite._meta.get_fields()]
    # prepopulated_fields = {'post_slug': ('post_title',)}

    # readonly_fields = ['post_category',]


class PostCommuniqueAdmin(admin.ModelAdmin):
    #pass
    list_display = [field.name for field in PostCommunique._meta.get_fields()]
    list_display_links = ('title',)

    # readonly_fields = ['post_category',]

class PostProductAdmin(admin.ModelAdmin):
    list_display = [field.name for field in PostProduct._meta.get_fields()]
    ordering = ('post_status', '-published_on')


# PRODUITS App
class ProductCategoryAdmin(admin.ModelAdmin):
    list_display = [field.name for field in ProductCategory._meta.get_fields()]
    prepopulated_fields = {'slug': ('name',)}

class ProductCmuAdmin(admin.ModelAdmin):
    list_display = [field.name for field in ProductCmu._meta.get_fields()]
    prepopulated_fields = {'post_slug': ('post_title',)}

class ProductComplementaireAdmin(admin.ModelAdmin):
    list_display = [field.name for field in ProductComplementaire._meta.get_fields()]
    prepopulated_fields = {'post_slug': ('post_title',)}

class ProductRstiAdmin(admin.ModelAdmin):
    list_display = [field.name for field in ProductRsti._meta.get_fields()]
    prepopulated_fields = {'post_slug': ('post_title',)}



class ProductSidebarAdmin(admin.ModelAdmin):
    list_display = [field.name for field in ProductSidebar._meta.get_fields()]


# class PostMepsAdmin(admin.ModelAdmin):
#     list_display = [field.name for field in PostMeps._meta.get_fields()]

# ===========#
# MEPS App   #
# ===========#
class LeMinistereAdmin(admin.ModelAdmin):
    # list_display = [field.name for field in LeMinistere._meta.get_fields()]
    list_display = ['image', 'title', 'author', 'post_status', 'post_published_on',]
    prepopulated_fields = {'slug': ('title',)}
    list_display_links = ('title',)

    
class LeMinistreAdmin(admin.ModelAdmin):
    list_display = [field.name for field in LeMinistre._meta.get_fields() if field.name !='custummodel_ptr']
    prepopulated_fields = {'slug': ('title',)}
    list_display_links = ('title',)

class InfoPersonnelleAdmin(admin.ModelAdmin):
    pass

class ParcoursProfessionnelAdmin(admin.ModelAdmin):
    list_display = [field.name for field in ParcoursProfessionnel._meta.get_fields() if field.name !='custummodel_ptr']
    list_display_links = ('content',)
class ExpérienceAdministrativeAdmin(admin.ModelAdmin):
    pass

class DistinctionAdmin(admin.ModelAdmin):
    pass
    
# class LeCabinetAdmin(PostAdmin):
#     pass


class CabinetAdmin(CustomModelAdmin):
     pass

class ChapterAdmin(CustomModelAdmin):
    pass

class ArticleAdmin(CustomModelAdmin):
    list_filter = ('chapter',)

class ArticleListAdmin(CustomModelAdmin):
    list_filter = ('article', )
    search_fields = ('sentence', )

class DecretListAdmin(CustomModelAdmin):
    list_per_page = 5

class DecretCabinetAdmin(PostAdmin):
    prepopulated_fields = {'post_slug': ('post_title',)}

class OrganigrammeAdmin(admin.ModelAdmin):   
    list_display = [field.name for field in Organigramme._meta.get_fields() if field.name not in ('pdf', 'description',)]
    list_display_links = ('title',)
    prepopulated_fields = {'slug': ('title',)}
    ordering = ( '-post_published_on', 'post_status',)
    list_editable = ['post_status',]

class DirectionsServicesRattachésAdmin(admin.ModelAdmin):
    # list_display = [field.name for field in DirectionsServicesRattachés._meta.get_fields() if field.name not in ('id', 'slug', 'fax', 'flipcard_ptr', 'post_modified_on', 'post_created_on', 'address', 'bp', 'website',)]
    list_display = ['full_form_name', 'short_form_name', 'post_status', 'post_published_on', 'display_first', ]
    prepopulated_fields = {'slug': ('short_form_name',)}
    list_display_links = ('full_form_name',)
    ordering = ( '-display_first', '-post_published_on', 'post_status',)
    list_editable = ['post_status', 'display_first',]
    exclude = ['logo', ]
    
class StructuresSousTutelleAdmin(admin.ModelAdmin):
    list_display = ['full_form_name', 'short_form_name', 'post_status', 'post_published_on', 'email', ]
    list_display_links = ('full_form_name',)
    prepopulated_fields = {'slug': ('short_form_name',)}
    ordering = ( '-post_published_on', 'post_status',)
    list_editable = ['post_status',]

class EcoleSpecialiseeAdmin(admin.ModelAdmin):
    list_display = ['full_form_name', 'short_form_name', 'post_status', 'post_published_on', ]
    prepopulated_fields = {'slug': ('short_form_name',)}
    list_display_links = ('full_form_name',)
    ordering = ( '-post_published_on', 'post_status',)
    list_editable = ['post_status', ]
    exclude = ['logo', ]
    
class DecretOrganisationAdmin(admin.ModelAdmin):
    list_display = [field.name for field in DecretOrganisation._meta.get_fields() if field.name not in ('pdf', 'description',)]
    list_display_links = ('title',)
    prepopulated_fields = {'slug': ('title',)}
    ordering = ( '-post_published_on', 'post_status',)
    list_editable = ['post_status',]

class MissionsObjectifAdmin(admin.ModelAdmin):
    list_display = ['post_title', 'post_author', 'post_published_on', 'post_modified_on', 'category', 'post_status', 'comment_status', 'comment_count',]
    list_editable = ['post_status', 'comment_status',]
    prepopulated_fields = {'post_slug': ('post_title',)}
    
class MissionsListAdmin(admin.ModelAdmin):
    list_display = ['shorten_content', 'category',]
    list_display_links = ['shorten_content', ]
    list_editable = ['category', ]
    list_per_page = 5
    
    def shorten_content(self, obj):
        from django.utils.html import format_html
        return format_html("<p style=''>{}</p>", obj.sentence if len(obj.sentence) < 120 else (obj.sentence[:116] + '  [..]'))
    shorten_content.short_description = 'sentence'



class MissionCategoryAdmin(admin.ModelAdmin):
    pass
    
class AproposDuMepsAdmin(admin.ModelAdmin):
    pass
    

class MinistersListAdmin(admin.ModelAdmin):
    # list_display = [field.name for field in MinistersList._meta.get_fields()]
    list_display = ['photo', 'name', 'start_month', 'start_year', 'end_month', 'end_year', 'status', 'in_function',]
    list_display_links = ('name',)
    list_editable = ['status', 'in_function',]
    

class DirectionCardAdmin(admin.ModelAdmin):
    list_display = [field.name for field in DirectionCard._meta.get_fields() if field.name !='slug']
    list_display_links = ('sigle', 'title',)
    prepopulated_fields = {'slug': ('sigle',)}
    list_editable = ['parent',]

class CtaAdmin(admin.ModelAdmin):
    list_display = [field.name for field in Cta._meta.get_fields() if field.name !='slug']
    list_display_links = ('text',)
    prepopulated_fields= {'link':('text' ,)} 
    list_editable = ['activated',]
     


#----------------------------#
#  DIRECTIONS GENERALES App  #
#----------------------------#
class DirectionAdmin(admin.ModelAdmin):
    list_display = [field.name for field in Direction._meta.get_fields() if field !='direction_ptr']
    list_display_links = ('full_form_name', 'short_form_name')
    readonly_fields = ['direction_generale']
    prepopulated_fields = {'slug': ('short_form_name',)}


class DirectionDetailAdmin(admin.ModelAdmin):
    list_display = [field.name for field in DirectionDetail._meta.get_fields()]
    list_display_links = ('full_form_name', 'short_form_name')
    readonly_fields = ['DirectionDetail_id']
    prepopulated_fields = {'slug': ('short_form_name',)}


class DirectionSidebarAdmin(admin.ModelAdmin):
    list_display = [field.name for field in DirectionSidebar._meta.get_fields() if field !='directionsidebar_ptr']
    # prepopulated_fields = {'slug': ('short_form_name',)}


class EmploiAdmin(admin.ModelAdmin):
    list_display = [field.name for field in Emploi._meta.get_fields() if field not in ('direction_ptr', 'content', 'modified_on','full_form_name',)]
    list_display_links = ('short_form_name',)
    list_editable = ['status',]
    readonly_fields = ['direction_generale']
    prepopulated_fields = {'slug': ('short_form_name',)}


# class Emploi_DSPEAdmin(admin.ModelAdmin):
#     list_display = [field.name for field in Emploi_DSPE._meta.get_fields()]
#     readonly_fields = ['direction_generale']


class TravailAdmin(admin.ModelAdmin):
    list_display = [field.name for field in Travail._meta.get_fields() if field not in ('direction_ptr', 'content', 'modified_on','full_form_name',)]
    list_display_links = ('short_form_name',)
    list_editable = ['status',]
    readonly_fields = ['direction_generale']
    prepopulated_fields = {'slug': ('short_form_name',)}


class ProtectionSocialeAdmin(admin.ModelAdmin):
    list_display = [field.name for field in ProtectionSociale._meta.get_fields() if field.name not in ('direction_ptr', 'content', 'modified_on', 'full_form_name',)]
    list_display_links = ('short_form_name',)
    list_editable = ['status',]
    readonly_fields = ['direction_generale']
    prepopulated_fields = {'slug': ('short_form_name',)}
    # exclude = ['direction_ptr']
    pass


#----------  DGE App  -----------
class DgeAdmin(admin.ModelAdmin):
    list_display = [field.name for field in Dge._meta.get_fields()]
    prepopulated_fields = {'slug': ('full_form_name',)}
    list_editable = ['status',]


#----------  DGT App  -----------
class DgtAdmin(admin.ModelAdmin):
    list_display = [field.name for field in Dgt._meta.get_fields()]
    list_display_links = ('full_form_name', 'short_form_name',)
    prepopulated_fields = {'slug': ('full_form_name',)}
    list_editable = ['status',]
#----------  DGPS App  -----------
class DgpsAdmin(admin.ModelAdmin):
    list_display = [field.name for field in Dgps._meta.get_fields()]
    prepopulated_fields = {'slug': ('full_form_name',)}
    list_editable = ['status',]
    exclude = ['DirectionDetail_id', 'directiondetail_ptr', 'directiondetail_ptr_id']


# ------------ sidebar Missions  --------------- 
class DspeMissionAdmin(admin.ModelAdmin):
    list_display = [field.name for field in DspeMission._meta.get_fields()]
    exclude = ['emploi',]
class DsepeMissionAdmin(admin.ModelAdmin):
    list_display = [field.name for field in DsepeMission._meta.get_fields()]

class DoemMissionAdmin(admin.ModelAdmin):
    list_display = [field.name for field in DoemMission._meta.get_fields()]

class DasMissionAdmin(admin.ModelAdmin):
    list_display = [field.name for field in DasMission._meta.get_fields()]

class DpphMissionAdmin(admin.ModelAdmin):
    list_display = [field.name for field in DpphMission._meta.get_fields()]

class DssmMissionAdmin(admin.ModelAdmin):
    list_display = [field.name for field in DssmMission._meta.get_fields()]

class DitMissionAdmin(admin.ModelAdmin):
    list_display = [field.name for field in DitMission._meta.get_fields()]

class DlteMissionAdmin(admin.ModelAdmin):
    list_display = [field.name for field in DlteMission._meta.get_fields()]

class DrtMissionAdmin(admin.ModelAdmin):
    list_display = [field.name for field in DrtMission._meta.get_fields()]

class DsstMissionAdmin(admin.ModelAdmin):
    list_display = [field.name for field in DsstMission._meta.get_fields()]


# ------------ sidebar projects  --------------- 
class DspeProjectAdmin(admin.ModelAdmin):
    list_display = [field.name for field in DspeProject._meta.get_fields()]

class DsepeProjectAdmin(admin.ModelAdmin):
    list_display = [field.name for field in DsepeProject._meta.get_fields()]

# class DoemProjectAdmin(admin.ModelAdmin):
#     list_display = [field.name for field in DoemProject._meta.get_fields()]

class DasProjectAdmin(admin.ModelAdmin):
    list_display = [field.name for field in DasProject._meta.get_fields()]

class DpphProjectAdmin(admin.ModelAdmin):
    list_display = [field.name for field in DpphProject._meta.get_fields()]

class DssmProjectAdmin(admin.ModelAdmin):
    list_display = [field.name for field in DssmProject._meta.get_fields()]

class DitProjectAdmin(admin.ModelAdmin):
    list_display = [field.name for field in DitProject._meta.get_fields()]

class DlteProjectAdmin(admin.ModelAdmin):
    list_display = [field.name for field in DlteProject._meta.get_fields()]

class DrtProjectAdmin(admin.ModelAdmin):
    list_display = [field.name for field in DrtProject._meta.get_fields()]

class DsstProjectAdmin(admin.ModelAdmin):
    list_display = [field.name for field in DsstProject._meta.get_fields()]



# ------------ sidebar objectifs  --------------- 
class DspeObjectifAdmin(admin.ModelAdmin):
    list_display = [field.name for field in DspeObjectif._meta.get_fields()]

class DsepeObjectifAdmin(admin.ModelAdmin):
    list_display = [field.name for field in DsepeObjectif._meta.get_fields()]

class DoemObjectifAdmin(admin.ModelAdmin):
    list_display = [field.name for field in DoemObjectif._meta.get_fields()]

class DasObjectifAdmin(admin.ModelAdmin):
    list_display = [field.name for field in DasObjectif._meta.get_fields()]

class DpphObjectifAdmin(admin.ModelAdmin):
    list_display = [field.name for field in DpphObjectif._meta.get_fields()]

class DssmObjectifAdmin(admin.ModelAdmin):
    list_display = [field.name for field in DssmObjectif._meta.get_fields()]

class DitObjectifAdmin(admin.ModelAdmin):
    list_display = [field.name for field in DitObjectif._meta.get_fields()]

class DlteObjectifAdmin(admin.ModelAdmin):
    list_display = [field.name for field in DlteObjectif._meta.get_fields()]

class DrtObjectifAdmin(admin.ModelAdmin):
    list_display = [field.name for field in DrtObjectif._meta.get_fields()]

class DsstObjectifAdmin(admin.ModelAdmin):
    list_display = [field.name for field in DsstObjectif._meta.get_fields()]



# ------------ sidebar Sous-Direction  --------------- 
class DspeSousDirectionAdmin(admin.ModelAdmin):
    list_display = [field.name for field in DspeSousDirection._meta.get_fields()]

class DsepeSousDirectionAdmin(admin.ModelAdmin):
    list_display = [field.name for field in DsepeSousDirection._meta.get_fields()]

class DoemSousDirectionAdmin(admin.ModelAdmin):
    list_display = [field.name for field in DoemSousDirection._meta.get_fields()]

class DasSousDirectionAdmin(admin.ModelAdmin):
    list_display = [field.name for field in DasSousDirection._meta.get_fields()]

class DpphSousDirectionAdmin(admin.ModelAdmin):
    list_display = [field.name for field in DpphSousDirection._meta.get_fields()]

class DssmSousDirectionAdmin(admin.ModelAdmin):
    list_display = [field.name for field in DssmSousDirection._meta.get_fields()]

class DitSousDirectionAdmin(admin.ModelAdmin):
    list_display = [field.name for field in DitSousDirection._meta.get_fields()]

class DlteSousDirectionAdmin(admin.ModelAdmin):
    list_display = [field.name for field in DlteSousDirection._meta.get_fields()]

class DrtSousDirectionAdmin(admin.ModelAdmin):
    list_display = [field.name for field in DrtSousDirection._meta.get_fields()]

class DsstSousDirectionAdmin(admin.ModelAdmin):
    list_display = [field.name for field in DsstSousDirection._meta.get_fields()]


# ------------ sidebar contact  --------------- 
class DspeContactAdmin(admin.ModelAdmin):
    list_display = [field.name for field in DspeContact._meta.get_fields()]

class DsepeContactAdmin(admin.ModelAdmin):
    list_display = [field.name for field in DsepeContact._meta.get_fields()]

class DoemContactAdmin(admin.ModelAdmin):
    list_display = [field.name for field in DoemContact._meta.get_fields()]

class DasContactAdmin(admin.ModelAdmin):
    list_display = [field.name for field in DasContact._meta.get_fields()]

class DpphContactAdmin(admin.ModelAdmin):
    list_display = [field.name for field in DpphContact._meta.get_fields()]

class DssmContactAdmin(admin.ModelAdmin):
    list_display = [field.name for field in DssmContact._meta.get_fields()]

class DitContactAdmin(admin.ModelAdmin):
    list_display = [field.name for field in DitContact._meta.get_fields()]


class DlteContactAdmin(admin.ModelAdmin):
    list_display = [field.name for field in DlteContact._meta.get_fields()]

class DrtContactAdmin(admin.ModelAdmin):
    list_display = [field.name for field in DrtContact._meta.get_fields()]

class DsstContactAdmin(admin.ModelAdmin):
    list_display = [field.name for field in DsstContact._meta.get_fields()]



# -------------  DOEM ----------------------

class DoemMissionInline(admin.StackedInline):
    model = DoemMission
    extra = 0

class DoemProjectInline(admin.StackedInline):
    model = DoemProject
    extra = 0
class DoemObjectifInline(admin.StackedInline):
    model = DoemObjectif
    extra = 0
class DoemSousDirectionInline(admin.StackedInline):
    model = DoemSousDirection
    extra = 0


class DoemContactAddressInline(admin.TabularInline):
    model = DoemContactAddress
    extra = 0

class DoemContactAddressAdmin(admin.ModelAdmin):
    list_display = [field.name for field in DoemContactAddress._meta.get_fields()]
    list_display_links = ['doem_ContactAddress', ]

    # fieldsets= [
    #         (None, {'fields': ('full_form_name', 'slug', 'description')}),                                           
    # ]

    inlines = [
               DoemContactAddressInline,
            ]

class DoemContactInline(admin.TabularInline):
    model = DoemContact
    extra = 1


class DoemContactAddressInline(admin.TabularInline):
    model = DoemContactAddress
    extra = 0
class DoemContactTelInline(admin.TabularInline):
    model = DoemContactTel
    extra = 0
class DoemContactEmailInline(admin.TabularInline):
    model = DoemContactEmail
    extra = 0
class DoemContactHoraireInline(admin.TabularInline):
    model = DoemContactHoraire
    extra = 0

class DoemAdmin(admin.ModelAdmin):
    list_display = ['short_form_name', 'full_form_name', 'slug', 'status',]
    list_display_links = ['full_form_name', 'short_form_name', ]  
    list_editable = ['status',] 
    prepopulated_fields = {'slug': ('short_form_name',)}
    ordering = ('status', '-published_on')

    # fieldsets= [
    #         (None, {'fields': ('full_form_name', 'slug', 'description')}),                                           
    # ]

    inlines = [
                DoemMissionInline, 
                DoemProjectInline, 
                DoemObjectifInline, 
                DoemSousDirectionInline, 
                DoemContactInline,
                DoemContactAddressInline,
                DoemContactTelInline,
                DoemContactEmailInline,
                DoemContactHoraireInline,
            ]

# -------------  DSEPE ----------------------
class DsepeMissionInline(admin.StackedInline):
    model = DsepeMission
    extra = 0

class DsepeProjectInline(admin.StackedInline):
    model = DsepeProject
    extra = 0
class DsepeObjectifInline(admin.StackedInline):
    model = DsepeObjectif
    extra = 0
class DsepeSousDirectionInline(admin.StackedInline):
    model = DsepeSousDirection
    extra = 0


class DsepeContactAddressInline(admin.TabularInline):
    model = DsepeContactAddress
    extra = 0

class DsepeContactAddressAdmin(admin.ModelAdmin):
    list_display = [field.name for field in DsepeContactAddress._meta.get_fields()]
    list_display_links = ['dsepe_ContactAddress', ]

    inlines = [
               DsepeContactAddressInline,
            ]

class DsepeContactInline(admin.TabularInline):
    model = DsepeContact
    extra = 1


class DsepeContactAddressInline(admin.TabularInline):
    model = DsepeContactAddress
    extra = 0
class DsepeContactTelInline(admin.TabularInline):
    model = DsepeContactTel
    extra = 0
class DsepeContactEmailInline(admin.TabularInline):
    model = DsepeContactEmail
    extra = 0
class DsepeContactHoraireInline(admin.TabularInline):
    model = DsepeContactHoraire
    extra = 0

class DsepeAdmin(admin.ModelAdmin):
    list_display = ['short_form_name', 'full_form_name', 'slug', 'status', ]
    list_display_links = ['full_form_name', 'short_form_name' ]
    list_editable = ['status',]    
    prepopulated_fields = {'slug': ('short_form_name',)}
    ordering = ('status', '-published_on')
    inlines = [
                DsepeMissionInline, 
                DsepeProjectInline, 
                DsepeObjectifInline, 
                DsepeSousDirectionInline, 
                DsepeContactInline,
                DsepeContactAddressInline,
                DsepeContactTelInline,
                DsepeContactEmailInline,
                DsepeContactHoraireInline,
            ]


# -------------  DSPE ----------------------
class DspeMissionInline(admin.StackedInline):
    model = DspeMission
    extra = 0

class DspeProjectInline(admin.StackedInline):
    model = DspeProject
    extra = 0
class DspeObjectifInline(admin.StackedInline):
    model = DspeObjectif
    extra = 0
class DspeSousDirectionInline(admin.StackedInline):
    model = DspeSousDirection
    extra = 0


class DspeContactAddressInline(admin.TabularInline):
    model = DspeContactAddress
    extra = 0

class DspeContactAddressAdmin(admin.ModelAdmin):
    list_display = [field.name for field in DspeContactAddress._meta.get_fields()]
    list_display_links = ['dspe_ContactAddress', ]

    inlines = [
               DspeContactAddressInline,
            ]

class DspeContactInline(admin.TabularInline):
    model = DspeContact
    extra = 1


class DspeContactAddressInline(admin.TabularInline):
    model = DspeContactAddress
    extra = 0
class DspeContactTelInline(admin.TabularInline):
    model = DspeContactTel
    extra = 0
class DspeContactEmailInline(admin.TabularInline):
    model = DspeContactEmail
    extra = 0
class DspeContactHoraireInline(admin.TabularInline):
    model = DspeContactHoraire
    extra = 0

class DspeAdmin(admin.ModelAdmin):
    list_display = ['short_form_name', 'full_form_name', 'slug', 'status', ]
    list_display_links = ['full_form_name', 'short_form_name',]  
    list_editable = ['status',]  
    prepopulated_fields = {'slug': ('short_form_name',)}
    ordering = ('status', '-published_on')
    inlines = [
                DspeMissionInline, 
                DspeProjectInline, 
                DspeObjectifInline, 
                DspeSousDirectionInline, 
                DspeContactInline,
                DspeContactAddressInline,
                DspeContactTelInline,
                DspeContactEmailInline,
                DspeContactHoraireInline,
            ]

# -------------  DAS ----------------------
class DasMissionInline(admin.StackedInline):
    model = DasMission
    extra = 0

class DasProjectInline(admin.StackedInline):
    model = DasProject
    extra = 0
class DasObjectifInline(admin.StackedInline):
    model = DasObjectif
    extra = 0
class DasSousDirectionInline(admin.StackedInline):
    model = DasSousDirection
    extra = 0


class DasContactAddressInline(admin.TabularInline):
    model = DasContactAddress
    extra = 0

class DasContactAddressAdmin(admin.ModelAdmin):
    list_display = [field.name for field in DasContactAddress._meta.get_fields()]
    list_display_links = ['das_ContactAddress', ]

    inlines = [
               DasContactAddressInline,
            ]

class DasContactInline(admin.TabularInline):
    model = DasContact
    extra = 1


class DasContactAddressInline(admin.TabularInline):
    model = DasContactAddress
    extra = 0
class DasContactTelInline(admin.TabularInline):
    model = DasContactTel
    extra = 0
class DasContactEmailInline(admin.TabularInline):
    model = DasContactEmail
    extra = 0
class DasContactHoraireInline(admin.TabularInline):
    model = DasContactHoraire
    extra = 0

class DasAdmin(admin.ModelAdmin):
    list_display = ['short_form_name', 'full_form_name', 'slug', 'status', ]
    list_display_links = ['full_form_name', 'short_form_name',]  
    list_editable = ['status',]  
    prepopulated_fields = {'slug': ('short_form_name',)}
    ordering = ('status', '-published_on')

    inlines = [
                DasMissionInline, 
                DasProjectInline, 
                DasObjectifInline, 
                DasSousDirectionInline, 
                DasContactInline,
                DasContactAddressInline,
                DasContactTelInline,
                DasContactEmailInline,
                DasContactHoraireInline,
            ]

# -------------  DPPH ----------------------
class DpphMissionInline(admin.StackedInline):
    model = DpphMission
    extra = 0

class DpphProjectInline(admin.StackedInline):
    model = DpphProject
    extra = 0
class DpphObjectifInline(admin.StackedInline):
    model = DpphObjectif
    extra = 0
class DpphSousDirectionInline(admin.StackedInline):
    model = DpphSousDirection
    extra = 0


class DpphContactAddressInline(admin.TabularInline):
    model = DpphContactAddress
    extra = 0

class DpphContactAddressAdmin(admin.ModelAdmin):
    list_display = [field.name for field in DpphContactAddress._meta.get_fields()]
    list_display_links = ['dpph_ContactAddress', ]

    inlines = [
               DpphContactAddressInline,
            ]

class DpphContactInline(admin.TabularInline):
    model = DpphContact
    extra = 1


class DpphContactAddressInline(admin.TabularInline):
    model = DpphContactAddress
    extra = 0
class DpphContactTelInline(admin.TabularInline):
    model = DpphContactTel
    extra = 0
class DpphContactEmailInline(admin.TabularInline):
    model = DpphContactEmail
    extra = 0
class DpphContactHoraireInline(admin.TabularInline):
    model = DpphContactHoraire
    extra = 0

class DpphAdmin(admin.ModelAdmin):
    list_display = ['short_form_name', 'full_form_name', 'slug', 'status', ]
    list_display_links = ['full_form_name', 'short_form_name',]  
    list_editable = ['status',]  
    prepopulated_fields = {'slug': ('short_form_name',)}
    ordering = ('status', '-published_on')

    inlines = [
                DpphMissionInline, 
                DpphProjectInline, 
                DpphObjectifInline, 
                DpphSousDirectionInline, 
                DpphContactInline,
                DpphContactAddressInline,
                DpphContactTelInline,
                DpphContactEmailInline,
                DpphContactHoraireInline,
            ]

# -------------  DSSM ----------------------
class DssmMissionInline(admin.StackedInline):
    model = DssmMission
    extra = 0

class DssmProjectInline(admin.StackedInline):
    model = DssmProject
    extra = 0
class DssmObjectifInline(admin.StackedInline):
    model = DssmObjectif
    extra = 0
class DssmSousDirectionInline(admin.StackedInline):
    model = DssmSousDirection
    extra = 0


class DssmContactAddressInline(admin.TabularInline):
    model = DssmContactAddress
    extra = 0

class DssmContactAddressAdmin(admin.ModelAdmin):
    list_display = [field.name for field in DssmContactAddress._meta.get_fields()]
    list_display_links = ['dssm_ContactAddress', ]

    inlines = [
               DssmContactAddressInline,
            ]

class DssmContactInline(admin.TabularInline):
    model = DssmContact
    extra = 1


class DssmContactAddressInline(admin.TabularInline):
    model = DssmContactAddress
    extra = 0
class DssmContactTelInline(admin.TabularInline):
    model = DssmContactTel
    extra = 0
class DssmContactEmailInline(admin.TabularInline):
    model = DssmContactEmail
    extra = 0
class DssmContactHoraireInline(admin.TabularInline):
    model = DssmContactHoraire
    extra = 0

class DssmAdmin(admin.ModelAdmin):
    list_display = ['short_form_name', 'full_form_name', 'slug', 'status', ]
    list_display_links = ['full_form_name', 'short_form_name',]  
    list_editable = ['status',]  
    prepopulated_fields = {'slug': ('short_form_name',)}
    ordering = ('status', '-published_on')

    inlines = [
                DssmMissionInline, 
                DssmProjectInline, 
                DssmObjectifInline, 
                DssmSousDirectionInline, 
                DssmContactInline,
                DssmContactAddressInline,
                DssmContactTelInline,
                DssmContactEmailInline,
                DssmContactHoraireInline,
            ]



# -------------  DIT ----------------------
class DitMissionInline(admin.StackedInline):
    model = DitMission
    extra = 0

class DitProjectInline(admin.StackedInline):
    model = DitProject
    extra = 0
class DitObjectifInline(admin.StackedInline):
    model = DitObjectif
    extra = 0
class DitSousDirectionInline(admin.StackedInline):
    model = DitSousDirection
    extra = 0


class DitContactAddressInline(admin.TabularInline):
    model = DitContactAddress
    extra = 0

class DitContactAddressAdmin(admin.ModelAdmin):
    list_display = [field.name for field in DitContactAddress._meta.get_fields()]
    list_display_links = ['dit_ContactAddress', ]

    inlines = [
               DitContactAddressInline,
            ]

class DitContactInline(admin.TabularInline):
    model = DitContact
    extra = 1


class DitContactAddressInline(admin.TabularInline):
    model = DitContactAddress
    extra = 0
class DitContactTelInline(admin.TabularInline):
    model = DitContactTel
    extra = 0
class DitContactEmailInline(admin.TabularInline):
    model = DitContactEmail
    extra = 0
class DitContactHoraireInline(admin.TabularInline):
    model = DitContactHoraire
    extra = 0

class DitAdmin(admin.ModelAdmin):
    list_display = ['short_form_name', 'full_form_name', 'slug', 'status', ]
    list_display_links = ['full_form_name', 'short_form_name',]  
    list_editable = ['status',]  
    prepopulated_fields = {'slug': ('short_form_name',)}
    ordering = ('status', '-published_on')

    inlines = [
                DitMissionInline, 
                DitProjectInline, 
                DitObjectifInline, 
                DitSousDirectionInline, 
                DitContactInline,
                DitContactAddressInline,
                DitContactTelInline,
                DitContactEmailInline,
                DitContactHoraireInline,
            ]

# -------------  DLTE ----------------------
class DlteMissionInline(admin.StackedInline):
    model = DlteMission
    extra = 0

class DlteProjectInline(admin.StackedInline):
    model = DlteProject
    extra = 0
class DlteObjectifInline(admin.StackedInline):
    model = DlteObjectif
    extra = 0
class DlteSousDirectionInline(admin.StackedInline):
    model = DlteSousDirection
    extra = 0


class DlteContactAddressInline(admin.TabularInline):
    model = DlteContactAddress
    extra = 0

class DlteContactAddressAdmin(admin.ModelAdmin):
    list_display = [field.name for field in DlteContactAddress._meta.get_fields()]
    list_display_links = ['dlte_ContactAddress', ]

    inlines = [
               DlteContactAddressInline,
            ]

class DlteContactInline(admin.TabularInline):
    model = DlteContact
    extra = 1


class DlteContactAddressInline(admin.TabularInline):
    model = DlteContactAddress
    extra = 0
class DlteContactTelInline(admin.TabularInline):
    model = DlteContactTel
    extra = 0
class DlteContactEmailInline(admin.TabularInline):
    model = DlteContactEmail
    extra = 0
class DlteContactHoraireInline(admin.TabularInline):
    model = DlteContactHoraire
    extra = 0

class DlteAdmin(admin.ModelAdmin):
    list_display = ['short_form_name', 'full_form_name', 'slug', 'status', ]
    list_display_links = ['full_form_name', 'short_form_name',]  
    list_editable = ['status',]  
    prepopulated_fields = {'slug': ('short_form_name',)}
    ordering = ('status', '-published_on')

    inlines = [
                DlteMissionInline, 
                DlteProjectInline, 
                DlteObjectifInline, 
                DlteSousDirectionInline, 
                DlteContactInline,
                DlteContactAddressInline,
                DlteContactTelInline,
                DlteContactEmailInline,
                DlteContactHoraireInline,
            ]


# -------------  DLTE ----------------------
class DrtMissionInline(admin.StackedInline):
    model = DrtMission
    extra = 0

class DrtProjectInline(admin.StackedInline):
    model = DrtProject
    extra = 0
class DrtObjectifInline(admin.StackedInline):
    model = DrtObjectif
    extra = 0
class DrtSousDirectionInline(admin.StackedInline):
    model = DrtSousDirection
    extra = 0


class DrtContactAddressInline(admin.TabularInline):
    model = DrtContactAddress
    extra = 0

class DrtContactAddressAdmin(admin.ModelAdmin):
    list_display = [field.name for field in DrtContactAddress._meta.get_fields()]
    list_display_links = ['drt_ContactAddress', ]

    inlines = [
               DrtContactAddressInline,
            ]

class DrtContactInline(admin.TabularInline):
    model = DrtContact
    extra = 1


class DrtContactAddressInline(admin.TabularInline):
    model = DrtContactAddress
    extra = 0
class DrtContactTelInline(admin.TabularInline):
    model = DrtContactTel
    extra = 0
class DrtContactEmailInline(admin.TabularInline):
    model = DrtContactEmail
    extra = 0
class DrtContactHoraireInline(admin.TabularInline):
    model = DrtContactHoraire
    extra = 0

class DrtAdmin(admin.ModelAdmin):
    list_display = ['short_form_name', 'full_form_name', 'slug', 'status', ]
    list_display_links = ['full_form_name', 'short_form_name',]  
    list_editable = ['status',]  
    prepopulated_fields = {'slug': ('short_form_name',)}
    ordering = ('status', '-published_on')

    inlines = [
                DrtMissionInline, 
                DrtProjectInline, 
                DrtObjectifInline, 
                DrtSousDirectionInline, 
                DrtContactInline,
                DrtContactAddressInline,
                DrtContactTelInline,
                DrtContactEmailInline,
                DrtContactHoraireInline,
            ]


# -------------  DLTE ----------------------
class DsstMissionInline(admin.StackedInline):
    model = DsstMission
    extra = 0

class DsstProjectInline(admin.StackedInline):
    model = DsstProject
    extra = 0
class DsstObjectifInline(admin.StackedInline):
    model = DsstObjectif
    extra = 0
class DsstSousDirectionInline(admin.StackedInline):
    model = DsstSousDirection
    extra = 0


class DsstContactAddressInline(admin.TabularInline):
    model = DsstContactAddress
    extra = 0

class DsstContactAddressAdmin(admin.ModelAdmin):
    list_display = [field.name for field in DsstContactAddress._meta.get_fields()]
    list_display_links = ['dsst_ContactAddress', ]

    inlines = [
               DsstContactAddressInline,
            ]

class DsstContactInline(admin.TabularInline):
    model = DsstContact
    extra = 1


class DsstContactAddressInline(admin.TabularInline):
    model = DsstContactAddress
    extra = 0
class DsstContactTelInline(admin.TabularInline):
    model = DsstContactTel
    extra = 0
class DsstContactEmailInline(admin.TabularInline):
    model = DsstContactEmail
    extra = 0
class DsstContactHoraireInline(admin.TabularInline):
    model = DsstContactHoraire
    extra = 0

class DsstAdmin(admin.ModelAdmin):
    list_display = ['short_form_name', 'full_form_name', 'slug', 'status', ]
    list_display_links = ['full_form_name', 'short_form_name',]  
    list_editable = ['status',]  
    prepopulated_fields = {'slug': ('short_form_name',)}
    ordering = ('status', '-published_on')
    inlines = [
                DsstMissionInline, 
                DsstProjectInline, 
                DsstObjectifInline, 
                DsstSousDirectionInline, 
                DsstContactInline,
                DsstContactAddressInline,
                DsstContactTelInline,
                DsstContactEmailInline,
                DsstContactHoraireInline,
            ]


# class DspeAdmin(admin.ModelAdmin):
#     fieldsets = DIRECTION_FIELDSET

# class DsepeAdmin(admin.ModelAdmin):
#     fieldsets = DIRECTION_FIELDSET


# --------------#
#   DOCUMENTS   #
# --------------#

class PdfDocumentAdmin(admin.ModelAdmin):
    # list_display = [field.name for field in PdfDocument._meta.get_fields()]
    prepopulated_fields = {'slug': ('title',)}

class PdfTypeAdmin(admin.ModelAdmin):
    # list_display = [field.name for field in PdfType._meta.get_fields()]
    # list_display_links = ['type']
    prepopulated_fields = {'slug': ('type',)}

class DocumentAdmin(PdfDocumentAdmin):
    list_display = ['title', 'category', 'slug',]


class DocumentSousCategoryAdmin(PdfTypeAdmin):
    list_display = ['type', 'category', 'slug',]
    prepopulated_fields = {'slug': ('type',)}
    # list_display_links = ['type']


class DocumentCategoryAdmin(PdfTypeAdmin):
    prepopulated_fields = {'slug': ('type', 'slug',)}

# ----------------#
#   NOUS JOINDRE  #
# ----------------#


class DGE_directions_contactsInline(admin.StackedInline):
    model = DGE_directions_contacts
    extra = 0
    fields = [('full_form_name', 'short_form_name', 'horaire'), ('tel', 'email', 'address'), 'status', ]
    verbose_name = "Direction de la DGE"
    verbose_name_plural = "Liste des Directions de la DGE"
    
class DGT_directions_contactsInline(admin.StackedInline):
    model = DGT_directions_contacts
    fields = [('full_form_name', 'short_form_name', 'horaire'), ('tel', 'email', 'address'), 'status', ]
    extra = 0
    verbose_name = "Direction de la DGT"
    verbose_name_plural = "Liste des Directions de la DGT"

   


class DGPS_directions_contactsInline(admin.StackedInline):
    model = DGPS_directions_contacts
    fields = [('full_form_name', 'short_form_name', 'horaire'), ('tel', 'email', 'address'), 'status', ]
    extra = 0
    verbose_name = "Direction de la DGPS"
    verbose_name_plural = "Liste des Directions de la DGPS"

class CABINET_directions_contactsInline(admin.StackedInline):
    model = CABINET_directions_contacts
    fields = [('full_form_name', 'short_form_name', 'horaire'), ('tel', 'email', 'address'), 'status', ]
    extra = 0
    verbose_name = "Direction-Service rattaché"
    verbose_name_plural = "Liste des Directions & Services rattachés au CABINET"

class ContactsDGEAdmin(admin.ModelAdmin):
    list_display = ['full_form_name','short_form_name',  'status', ]
    list_display_links = ['full_form_name', 'short_form_name',]  
    list_editable = ['status',]
    ordering = ('status', '-short_form_name')
    exclude = ['slug',]
    inlines = [
                DGE_directions_contactsInline,
            ]

class ContactsDGTAdmin(admin.ModelAdmin):
    list_display = ['full_form_name','short_form_name', 'status', ]
    list_display_links = ['full_form_name', 'short_form_name',]  
    list_editable = ['status',]
    exclude = ['slug',]
    ordering = ('status', '-short_form_name')
    inlines = [
                DGT_directions_contactsInline,
            ]
class ContactsDGPSAdmin(admin.ModelAdmin):
    list_display = ['full_form_name','short_form_name', 'status', ]
    list_display_links = ['full_form_name', 'short_form_name',]  
    list_editable = ['status',]
    exclude = ['slug',]
    ordering = ('status', '-short_form_name')
    inlines = [
                DGPS_directions_contactsInline,
            ]
    
class ContactsCABINETAdmin(admin.ModelAdmin):
    list_display = ['full_form_name','short_form_name', 'status', ]
    list_display_links = ['full_form_name', 'short_form_name',]  
    list_editable = ['status',]
    exclude = ['slug',]
    ordering = ('status', '-short_form_name')
    inlines = [
                CABINET_directions_contactsInline,
            ]



class FaqAdmin(admin.ModelAdmin):
    list_display = [field.name for field in Faq._meta.get_fields()]
    list_display_links = ['question',]
    list_editable = ['status',]
    


# class NosContactsAdmin(ContactDGAdmin):
#     pass
    # list_display = [field.name for field in NosContacts._meta.get_fields()]
    # list_display_links = ['short_form_name', 'full_form_name',]
    # list_editable = ['status',]


# ---------------------#
#   REGISTER MODELS    #
# ---------------------#

BLOG_models =[
            (Post, PostAdmin),
            (Comment, CommentAdmin),
            (Category, CategoryAdmin),
],
                                                                        
Publications_models =[
                (PublicationCategory, PublicationCategoryAdmin),
                (PublicationSousCategory, PublicationSousCategoryAdmin),
                (PostActualite, PostActualiteAdmin),
                (PostCommunique, PostCommuniqueAdmin),                           
],
PRODUCTS_models =[
                (ProductCategory, ProductCategoryAdmin),
                (ProductCmu, ProductCmuAdmin),
                (ProductCmu, ProductCmuAdmin),
                (ProductRsti, ProductRstiAdmin),
                (ProductComplementaire, ProductComplementaireAdmin),
],
MEPS_models =[
                (LeMinistere, LeMinistereAdmin),
                (LeMinistre, LeMinistreAdmin),
                #(AproposDuMeps, AproposDuMepsAdmin),
                (MinistersList, MinistersListAdmin),
                (DirectionCard, DirectionCardAdmin),
                (Cta, CtaAdmin),
                (InfoPersonnelle, InfoPersonnelleAdmin),
                (ParcoursProfessionnel, ParcoursProfessionnelAdmin),
                (ExpérienceAdministrative, ExpérienceAdministrativeAdmin),
                (Distinction, DistinctionAdmin),
                # (LeCabinet, LeCabinetAdmin)
                (DirectionsServicesRattachés, DirectionsServicesRattachésAdmin),
                (DecretCabinet, DecretCabinetAdmin),
                (Chapter, ChapterAdmin),
                (Article, ArticleAdmin),
                (ArticleList, ArticleListAdmin),
                (DecretList, DecretListAdmin),
                (Organigramme, OrganigrammeAdmin),
                (StructuresSousTutelle, StructuresSousTutelleAdmin),
                (EcoleSpecialisee, EcoleSpecialiseeAdmin),
                (DecretOrganisation, DecretOrganisationAdmin),
                (MissionsObjectif, MissionsObjectifAdmin),
                (MissionsList, MissionsListAdmin),
                (MissionCategory, MissionCategoryAdmin),
],

DGE_models = [                                   
                (Emploi, EmploiAdmin),
                # (Dge, DgeAdmin),
                (Doem, DoemAdmin),
                (Dspe, DspeAdmin),
                (Dsepe, DsepeAdmin),
                # (DirectionDetail, DirectionDetailAdmin),
],

DGT_models = [
            (Travail, TravailAdmin),
            # (Dgt, DgtAdmin),
            (Dit, DitAdmin),
            (Dlte, DlteAdmin),
            (Drt, DrtAdmin),
            (Dsst, DsstAdmin),
],


DGPS_models = [
            (ProtectionSociale, ProtectionSocialeAdmin),
            # (Dgps, DgpsAdmin),
            (Das, DasAdmin),
            (Dpph, DpphAdmin),
            (Dssm, DssmAdmin),
],

# Register Blog models
admin_dsi_site.register(Post, PostAdmin)
admin_dsi_site.register(Comment, CommentAdmin)
admin_dsi_site.register(Category, CategoryAdmin)

# Register PUBLICATIONS models
admin.site.register(PublicationCategory, PublicationCategoryAdmin)
admin.site.register(PublicationSousCategory, PublicationSousCategoryAdmin)
admin.site.register(PostActualite, PostActualiteAdmin)
admin.site.register(PostCommunique, PostCommuniqueAdmin)

# Register PRODUCTS models
# admin.site.register(PostProduct, PostProductAdmin)
# admin.site.register(ProductSidebar, ProductSidebarAdmin)
admin.site.register(ProductCategory, ProductCategoryAdmin)
admin.site.register(ProductCmu, ProductCmuAdmin)
admin.site.register(ProductRsti, ProductRstiAdmin)
admin.site.register(ProductComplementaire, ProductComplementaireAdmin)

# # Register  MEPS models
admin.site.register(LeMinistere, LeMinistereAdmin)
admin.site.register(LeMinistre, LeMinistreAdmin)
# admin.site.register(AproposDuMeps, AproposDuMepsAdmin)
admin.site.register(MinistersList, MinistersListAdmin)
admin.site.register(DirectionCard, DirectionCardAdmin)
admin.site.register(Cta, CtaAdmin)
admin.site.register(InfoPersonnelle, InfoPersonnelleAdmin)
admin.site.register(ParcoursProfessionnel, ParcoursProfessionnelAdmin)
admin.site.register(ExpérienceAdministrative, ExpérienceAdministrativeAdmin)
admin.site.register(Distinction, DistinctionAdmin)

# admin.site.register(LeCabinet, LeCabinetAdmin)
admin.site.register(DirectionsServicesRattachés, DirectionsServicesRattachésAdmin)

admin.site.register(DecretCabinet, DecretCabinetAdmin)
admin.site.register(Chapter, ChapterAdmin)
admin.site.register(Article, ArticleAdmin)
admin.site.register(ArticleList, ArticleListAdmin)
admin.site.register(DecretList, DecretListAdmin)

admin.site.register(Organigramme, OrganigrammeAdmin)
admin.site.register(StructuresSousTutelle, StructuresSousTutelleAdmin)
admin.site.register(EcoleSpecialisee, EcoleSpecialiseeAdmin)
admin.site.register(DecretOrganisation, DecretOrganisationAdmin)
admin.site.register(MissionsObjectif, MissionsObjectifAdmin)
admin.site.register(MissionsList, MissionsListAdmin)
admin.site.register(MissionCategory, MissionCategoryAdmin)




# # DIRECTIONS

#------ Register Directions Générales Emploi models --------
admin.site.register(Emploi, EmploiAdmin)
# admin.site.register(Dge, DgeAdmin)
admin.site.register(Doem, DoemAdmin)
admin.site.register(Dspe, DspeAdmin)
admin.site.register(Dsepe, DsepeAdmin)
# admin.site.register(DirectionDetail, DirectionDetailAdmin)


# admin.site.register(DspeMission, DspeMissionAdmin)
# admin.site.register(DsepeMission, DsepeMissionAdmin)
# admin.site.register(DoemMission)
# --------------------------------------------------------
# admin.site.register(DspeProject, DspeProjectAdmin)
# admin.site.register(DsepeProject, DsepeProjectAdmin)
# admin.site.register(DoemProject, DoemProjectAdmin)
# --------------------------------------------------------
# admin.site.register(DspeObjectif, DspeObjectifAdmin)
# admin.site.register(DsepeObjectif, DsepeObjectifAdmin)
# admin.site.register(DoemObjectif, DoemObjectifAdmin)
# --------------------------------------------------------
# admin.site.register(DspeContact, DspeContactAdmin)
# admin.site.register(DsepeContact, DsepeContactAdmin)
# admin.site.register(DoemContact, DoemContactAdmin)
# --------------------------------------------------------
# admin.site.register(DspeSousDirection, DspeSousDirectionAdmin)
# admin.site.register(DsepeSousDirection, DsepeSousDirectionAdmin)
# admin.site.register(DoemSousDirection, DoemSousDirectionAdmin)
# # --------------------------------------------------------


# -------------- Register Directions Générales Protection Sociale models -------------- 
admin.site.register(ProtectionSociale, ProtectionSocialeAdmin)
# admin.site.register(Dgps, DgpsAdmin)
admin.site.register(Das, DasAdmin)
admin.site.register(Dpph, DpphAdmin)
admin.site.register(Dssm, DssmAdmin)


# --------------------------------------------------------
# admin.site.register(DasMission, DasMissionAdmin)
# admin.site.register(DpphMission, DpphMissionAdmin)
# admin.site.register(DssmMission, DssmMissionAdmin)
# --------------------------------------------------------
# admin.site.register(DasProject, DasProjectAdmin)
# admin.site.register(DpphProject, DpphProjectAdmin)
# admin.site.register(DssmProject, DssmProjectAdmin)
# --------------------------------------------------------
# admin.site.register(DasObjectif, DasObjectifAdmin)
# admin.site.register(DpphObjectif, DpphObjectifAdmin)
# admin.site.register(DssmObjectif, DssmObjectifAdmin)
# --------------------------------------------------------
# admin.site.register(DasSousDirection, DasSousDirectionAdmin)
# admin.site.register(DpphSousDirection, DpphSousDirectionAdmin)
# admin.site.register(DssmSousDirection, DssmSousDirectionAdmin)
# --------------------------------------------------------
# admin.site.register(DasContact, DasContactAdmin)
# admin.site.register(DpphContact, DpphContactAdmin)
# admin.site.register(DssmContact, DssmContactAdmin)
# admin.site.register(DoemContactAddress, DoemContactAddressAdmin)


# -------------- Register Directions Générales Travail models -------------- 
admin.site.register(Travail, TravailAdmin)
# admin.site.register(Dgt, DgtAdmin)
admin.site.register(Dit, DitAdmin)
admin.site.register(Dlte, DlteAdmin)
admin.site.register(Drt, DrtAdmin)
admin.site.register(Dsst, DsstAdmin)


# --------------------------------------------------------
# admin.site.register(DitMission, DitMissionAdmin)
# admin.site.register(DlteMission, DlteMissionAdmin)
# admin.site.register(DrtMission, DrtMissionAdmin)
# admin.site.register(DsstMission, DsstMissionAdmin)
# --------------------------------------------------------
# admin.site.register(DitObjectif, DitObjectifAdmin)
# admin.site.register(DlteObjectif, DlteObjectifAdmin)
# admin.site.register(DrtObjectif, DrtObjectifAdmin)
# admin.site.register(DsstObjectif, DsstObjectifAdmin)
# --------------------------------------------------------
# admin.site.register(DitProject, DitProjectAdmin)
# admin.site.register(DlteProject, DlteProjectAdmin)
# admin.site.register(DrtProject, DrtProjectAdmin)
# admin.site.register(DsstProject, DsstProjectAdmin)
# --------------------------------------------------------
# admin.site.register(DitSousDirection, DitSousDirectionAdmin)
# admin.site.register(DlteSousDirection, DlteSousDirectionAdmin)
# admin.site.register(DrtSousDirection, DrtSousDirectionAdmin)
# admin.site.register(DsstSousDirection, DsstSousDirectionAdmin)
# --------------------------------------------------------
# admin.site.register(DitContact, DitContactAdmin)
# admin.site.register(DlteContact, DlteContactAdmin)
# admin.site.register(DrtContact, DrtContactAdmin)
# admin.site.register(DsstContact, DsstContactAdmin)
# --------------------------------------------------------
# # --------------------------------------------------------


#--------------  Register Documents models -------------- 
admin.site.register(Document, DocumentAdmin)
admin.site.register(DocumentSousCategory, DocumentSousCategoryAdmin)
admin.site.register(DocumentCategory, DocumentCategoryAdmin)




admin.site.register(Faq, FaqAdmin)
# admin.site.register(ContactDG, ContactDGAdmin)

admin.site.register(ContactsDGE, ContactsDGEAdmin)
admin.site.register(ContactsDGT, ContactsDGTAdmin)
admin.site.register(ContactsDGPS, ContactsDGPSAdmin)
admin.site.register(ContactsCABINET, ContactsCABINETAdmin)


# MEPS_ADMIN_models = apps.get_app_config('MEPS_ADMIN').get_models()
# MEPS_models = apps.get_app_config('MEPS').get_models()
# DIRECTIONS_GENERALES_models = apps.get_app_config('DIRECTIONS_GENERALES').get_models()
# PUBLICATIONS_models = apps.get_app_config('PUBLICATIONS').get_models()
# DOEM_models = apps.get_app_config("DIRECTIONS_GENERALES.DGE.doem").get_models()
# DOC_models = apps.get_app_config('DOCUMENTS').get_models()

# for app in all_apps:
#     all_apps_models += apps.get_app_config(app).get_models()
    
# print(all_apps_models)
# all_apps_models = apps.get_models()



# get complete list of all apps
list_of_apps = [apps.get_app_config(app_name.split('.')[-1]) for app_name in settings.MY_APPS]

# app_name.split('.')[-1] we need, because some system apps has dots in name
# like 'django.contrib.admin', and app_label is 'admin'


# get list of models for one specific app. For example first app in list_of_apps
# all_apps_models = [app.get_models() for app in list_of_apps]
all_apps_models = [apps.get_app_config(app_name.split('.')[-1]).get_models() for app_name in settings.MY_APPS]

# we outfiltered auto_created models, because they are not in models.py
# and had been created automatically by Django

all_excluded_models = []

print("\n===============================\n")

# print(all_apps_models)

# for model in all_apps_models:
#         admin_class = type('AdminClass', (ListAdminMixin, admin.ModelAdmin), {})
        
#         print(admin_class)
      
#         try:
#             if(admin_class is PostAdmin):
#                 admin_class = PostAdmin
#             admin_dsi_site.register(model, admin_class)
#             print((model, admin_class))
            
#         except admin.sites.AlreadyRegistered:
#             pass
    

# dsi_admin_models = [ MEPS_ADMIN_models,
#                     DIRECTIONS_GENERALES_models,]

MY_EXCLUDED_MODELS = [Dit,
                        DitMission, DitObjectif, DitProject, DitSousDirection, DitContact, DitSousDirection, DitContact, DitContactAddress, DitContactTel, DitContactEmail, DitContactHoraire,
                        DlteMission, DlteObjectif,DlteProject, DlteSousDirection, DlteContact, DlteSousDirection, DlteContact, DlteContactAddress, DlteContactTel, DlteContactEmail, DlteContactHoraire,
                        DrtMission, DrtObjectif, DrtProject, DrtSousDirection, DrtContact, DrtSousDirection, DrtContact, DrtContactAddress, DrtContactTel, DrtContactEmail, DrtContactHoraire,
                        DsstMission, DsstObjectif, DsstProject, DsstSousDirection, DsstContact, DsstSousDirection, DsstContact, DsstContactAddress, DsstContactTel, DsstContactEmail, DsstContactHoraire,
                    ]

DSI_ADMIN_REGISTERED_MODELS = BLOG_models[0] + \
                            MEPS_models[0] + \
                            PRODUCTS_models[0]  + \
                            Publications_models[0]  + \
                            DGE_models[0] + DGT_models[0] + DGPS_models[0]

MEPS_ADMIN_REGISTERED_MODELS = MEPS_models[0] + PRODUCTS_models[0]  + Publications_models[0]  + BLOG_models[0] 





for model, model_admin in [ i for i in DSI_ADMIN_REGISTERED_MODELS]:
    try:
        admin_dsi_site.register( model, model_admin)
    except admin.sites.AlreadyRegistered:
        pass
    
for model, model_admin in [ i for i in MEPS_ADMIN_REGISTERED_MODELS]:
    try:
        admin_meps_site.register( model, model_admin)
    except admin.sites.AlreadyRegistered:
        pass
    
# --------------------------------------------------------
# admin_dsi_site.register(Dit, DitAdmin)
# admin_dsi_site.unregister(DlteMission)
# admin_dsi_site.unregister(DrtMission)
# admin_dsi_site.unregister(DsstMission)


# --------------------------------------------------------
# admin.site.register(DitMission, DitMissionAdmin)
# admin.site.register(DlteMission, DlteMissionAdmin)
# admin.site.register(DrtMission, DrtMissionAdmin)
# admin.site.register(DsstMission, DsstMissionAdmin)
# --------------------------------------------------------
# admin.site.register(DitObjectif, DitObjectifAdmin)
# admin.site.register(DlteObjectif, DlteObjectifAdmin)
# admin.site.register(DrtObjectif, DrtObjectifAdmin)
# admin.site.register(DsstObjectif, DsstObjectifAdmin)
# --------------------------------------------------------
# admin.site.register(DitProject, DitProjectAdmin)
# admin.site.register(DlteProject, DlteProjectAdmin)
# admin.site.register(DrtProject, DrtProjectAdmin)
# admin.site.register(DsstProject, DsstProjectAdmin)
# --------------------------------------------------------
# admin.site.register(DitSousDirection, DitSousDirectionAdmin)
# admin.site.register(DlteSousDirection, DlteSousDirectionAdmin)
# admin.site.register(DrtSousDirection, DrtSousDirectionAdmin)
# admin.site.register(DsstSousDirection, DsstSousDirectionAdmin)
# --------------------------------------------------------
# admin.site.register(DitContact, DitContactAdmin)
# admin.site.register(DlteContact, DlteContactAdmin)
# admin.site.register(DrtContact, DrtContactAdmin)
# admin.site.register(DsstContact, DsstContactAdmin)
# --------------------------------------------------------