from MEPS_ADMIN.admin import *
from MEPS_ADMIN.Users.models import *
from django.contrib.auth.models import User, Group

# ----------------------------------#
#   REGISTER MODELS FOR DSI USERS   #
# ----------------------------------#


def REGISTER_MODELS_FOR_DSI_DASHBOARD():
    

    # dsi_superuser_site.register(Slider)
    dsi_superuser_site.register(Group)
    dsi_superuser_site.register(User)
    dsi_superuser_site.register(UserProfile, UserProfileAdmin)
    dsi_superuser_site.register(Writter, WritterAdmin)
    dsi_superuser_site.register(ServiceDirection)
    dsi_superuser_site.register(Service)
    # dsi_superuser_site.register(HeaderLeftLogo)
    # dsi_superuser_site.register(HeaderRightLogo)
    # dsi_superuser_site.register(HeaderBanner)

    # Register Blog models
    # dsi_superuser_site.register(Post, PostAdmin)
    dsi_superuser_site.register(PostComment, PostCommentAdmin)
    # dsi_superuser_site.register(Category, CategoryAdmin)

    # Register PUBLICATIONS models
    dsi_superuser_site.register(PublicationCategory, PublicationCategoryAdmin)
    dsi_superuser_site.register(PublicationSousCategory, PublicationSousCategoryAdmin)
    dsi_superuser_site.register(PostActualite, PostActualiteAdmin)
    dsi_superuser_site.register(PostCommunique, PostCommuniqueAdmin)

    # Register PRODUCTS models
    dsi_superuser_site.register(PostProduct, PostProductAdmin)
    # dsi_superuser_site.register(ProductSidebar, ProductSidebarAdmin)
    dsi_superuser_site.register(ProductCategory, ProductCategoryAdmin)
    # dsi_superuser_site.register(ProductCmu, ProductCmuAdmin)
    # dsi_superuser_site.register(ProductRsti, ProductRstiAdmin)
    # dsi_superuser_site.register(ProductComplementaire, ProductComplementaireAdmin)

    # # Register  MEPS models
    
    dsi_superuser_site.register(LeMinistere, LeMinistereAdmin)
    dsi_superuser_site.register(LeMinistre, LeMinistreAdmin)
    # dsi_superuser_site.register(AproposDuMeps, AproposDuMepsAdmin)
    dsi_superuser_site.register(MinistersList, MinistersListAdmin)
    dsi_superuser_site.register(DirectionCard, DirectionCardAdmin)
    dsi_superuser_site.register(Cta, CtaAdmin)
    dsi_superuser_site.register(InfoPersonnelle, InfoPersonnelleAdmin)
    dsi_superuser_site.register(ParcoursProfessionnel, ParcoursProfessionnelAdmin)
    dsi_superuser_site.register(ExpérienceAdministrative, ExpérienceAdministrativeAdmin)
    dsi_superuser_site.register(Distinction, DistinctionAdmin)

    
    dsi_superuser_site.register(DirectionsServicesRattachés, DirectionsServicesRattachésAdmin)
    dsi_superuser_site.register(Cabinet, CabinetAdmin)
    dsi_superuser_site.register(DecretCabinet, DecretCabinetAdmin)
    dsi_superuser_site.register(Chapter, ChapterAdmin)
    dsi_superuser_site.register(Article, ArticleAdmin)
    dsi_superuser_site.register(ArticleList, ArticleListAdmin)
    dsi_superuser_site.register(DecretList, DecretListAdmin)

    dsi_superuser_site.register(Organigramme, OrganigrammeAdmin)
    dsi_superuser_site.register(StructuresSousTutelle, StructuresSousTutelleAdmin)
    dsi_superuser_site.register(EcoleSpecialisee, EcoleSpecialiseeAdmin)
    dsi_superuser_site.register(DecretOrganisation, DecretOrganisationAdmin)
    dsi_superuser_site.register(MissionsObjectif, MissionsObjectifAdmin)
    dsi_superuser_site.register(MissionsList, MissionsListAdmin)
    dsi_superuser_site.register(MissionCategory, MissionCategoryAdmin)




    # # DIRECTIONS

    #------ Register Directions Générales Emploi models --------
    dsi_superuser_site.register(Emploi, EmploiAdmin)
    # dsi_superuser_site.register(Dge, DgeAdmin)
    dsi_superuser_site.register(Doem, DoemAdmin)
    dsi_superuser_site.register(Dspe, DspeAdmin)
    dsi_superuser_site.register(Dsepe, DsepeAdmin)
    # dsi_superuser_site.register(DirectionDetail, DirectionDetailAdmin)


    # dsi_superuser_site.register(DspeMission, DspeMissionAdmin)
    # dsi_superuser_site.register(DsepeMission, DsepeMissionAdmin)
    # dsi_superuser_site.register(DoemMission)
    # --------------------------------------------------------
    # dsi_superuser_site.register(DspeProject, DspeProjectAdmin)
    # dsi_superuser_site.register(DsepeProject, DsepeProjectAdmin)
    # dsi_superuser_site.register(DoemProject, DoemProjectAdmin)
    # --------------------------------------------------------
    # dsi_superuser_site.register(DspeObjectif, DspeObjectifAdmin)
    # dsi_superuser_site.register(DsepeObjectif, DsepeObjectifAdmin)
    # dsi_superuser_site.register(DoemObjectif, DoemObjectifAdmin)
    # --------------------------------------------------------
    # dsi_superuser_site.register(DspeContact, DspeContactAdmin)
    # dsi_superuser_site.register(DsepeContact, DsepeContactAdmin)
    # dsi_superuser_site.register(DoemContact, DoemContactAdmin)
    # --------------------------------------------------------
    # dsi_superuser_site.register(DspeSousDirection, DspeSousDirectionAdmin)
    # dsi_superuser_site.register(DsepeSousDirection, DsepeSousDirectionAdmin)
    # dsi_superuser_site.register(DoemSousDirection, DoemSousDirectionAdmin)
    # # --------------------------------------------------------


    # -------------- Register Directions Générales Protection Sociale models -------------- 
    dsi_superuser_site.register(ProtectionSociale, ProtectionSocialeAdmin)
    # dsi_superuser_site.register(Dgps, DgpsAdmin)
    dsi_superuser_site.register(Das, DasAdmin)
    dsi_superuser_site.register(Dpph, DpphAdmin)
    dsi_superuser_site.register(Dssm, DssmAdmin)


    # --------------------------------------------------------
    # dsi_superuser_site.register(DasMission, DasMissionAdmin)
    # dsi_superuser_site.register(DpphMission, DpphMissionAdmin)
    # dsi_superuser_site.register(DssmMission, DssmMissionAdmin)
    # --------------------------------------------------------
    # dsi_superuser_site.register(DasProject, DasProjectAdmin)
    # dsi_superuser_site.register(DpphProject, DpphProjectAdmin)
    # dsi_superuser_site.register(DssmProject, DssmProjectAdmin)
    # --------------------------------------------------------
    # dsi_superuser_site.register(DasObjectif, DasObjectifAdmin)
    # dsi_superuser_site.register(DpphObjectif, DpphObjectifAdmin)
    # dsi_superuser_site.register(DssmObjectif, DssmObjectifAdmin)
    # --------------------------------------------------------
    # dsi_superuser_site.register(DasSousDirection, DasSousDirectionAdmin)
    # dsi_superuser_site.register(DpphSousDirection, DpphSousDirectionAdmin)
    # dsi_superuser_site.register(DssmSousDirection, DssmSousDirectionAdmin)
    # --------------------------------------------------------
    # dsi_superuser_site.register(DasContact, DasContactAdmin)
    # dsi_superuser_site.register(DpphContact, DpphContactAdmin)
    # dsi_superuser_site.register(DssmContact, DssmContactAdmin)
    # dsi_superuser_site.register(DoemContactAddress, DoemContactAddressAdmin)


    # -------------- Register Directions Générales Travail models -------------- 
    dsi_superuser_site.register(Travail, TravailAdmin)
    # dsi_superuser_site.register(Dgt, DgtAdmin)
    dsi_superuser_site.register(Dit, DitAdmin)
    dsi_superuser_site.register(Dlte, DlteAdmin)
    dsi_superuser_site.register(Drt, DrtAdmin)
    dsi_superuser_site.register(Dsst, DsstAdmin)


    # --------------------------------------------------------
    # dsi_superuser_site.register(DitMission, DitMissionAdmin)
    # dsi_superuser_site.register(DlteMission, DlteMissionAdmin)
    # dsi_superuser_site.register(DrtMission, DrtMissionAdmin)
    # dsi_superuser_site.register(DsstMission, DsstMissionAdmin)
    # --------------------------------------------------------
    # dsi_superuser_site.register(DitObjectif, DitObjectifAdmin)
    # dsi_superuser_site.register(DlteObjectif, DlteObjectifAdmin)
    # dsi_superuser_site.register(DrtObjectif, DrtObjectifAdmin)
    # dsi_superuser_site.register(DsstObjectif, DsstObjectifAdmin)
    # --------------------------------------------------------
    # dsi_superuser_site.register(DitProject, DitProjectAdmin)
    # dsi_superuser_site.register(DlteProject, DlteProjectAdmin)
    # dsi_superuser_site.register(DrtProject, DrtProjectAdmin)
    # dsi_superuser_site.register(DsstProject, DsstProjectAdmin)
    # --------------------------------------------------------
    # dsi_superuser_site.register(DitSousDirection, DitSousDirectionAdmin)
    # dsi_superuser_site.register(DlteSousDirection, DlteSousDirectionAdmin)
    # dsi_superuser_site.register(DrtSousDirection, DrtSousDirectionAdmin)
    # dsi_superuser_site.register(DsstSousDirection, DsstSousDirectionAdmin)
    # --------------------------------------------------------
    # dsi_superuser_site.register(DitContact, DitContactAdmin)
    # dsi_superuser_site.register(DlteContact, DlteContactAdmin)
    # dsi_superuser_site.register(DrtContact, DrtContactAdmin)
    # dsi_superuser_site.register(DsstContact, DsstContactAdmin)
    # --------------------------------------------------------
    # # --------------------------------------------------------


    #--------------  Register Documents models -------------- 
    dsi_superuser_site.register(Document, DocumentAdmin)
    dsi_superuser_site.register(DocumentSousCategory, DocumentSousCategoryAdmin)
    dsi_superuser_site.register(DocumentCategory, DocumentCategoryAdmin)




dsi_superuser_site.register(Faq, FaqAdmin)
# dsi_superuser_site.register(ContactDG, ContactDGAdmin)

dsi_superuser_site.register(ContactsDGE, ContactsDGEAdmin)
dsi_superuser_site.register(ContactsDGT, ContactsDGTAdmin)
dsi_superuser_site.register(ContactsDGPS, ContactsDGPSAdmin)
dsi_superuser_site.register(ContactsCABINET, ContactsCABINETAdmin)



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
