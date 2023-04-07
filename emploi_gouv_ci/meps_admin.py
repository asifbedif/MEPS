from MEPS_ADMIN.admin import *
from MEPS_ADMIN.Users.models import *
from django.contrib.auth.models import User, Group

# ----------------------------------#
#   REGISTER MODELS FOR MEPS USERS   #
# ----------------------------------#


def REGISTER_MODELS_FOR_MEPS_DASHBOARD():

    # Register Blog models
    # meps_superuser_site.register(Post, PostAdmin)
    # meps_superuser_site.register(Comment, CommentAdmin)
    # meps_superuser_site.register(Category, CategoryAdmin)

    # Register PUBLICATIONS models
    meps_superuser_site.register(PublicationCategory, PublicationCategoryAdmin)
    meps_superuser_site.register(PublicationSousCategory, PublicationSousCategoryAdmin)
    meps_superuser_site.register(PostActualite, PostActualiteAdmin)
    meps_superuser_site.register(PostCommunique, PostCommuniqueAdmin)

    # Register PRODUCTS models
    meps_superuser_site.register(PostProduct, PostProductAdmin)
    # meps_superuser_site.register(ProductSidebar, ProductSidebarAdmin)
    meps_superuser_site.register(ProductCategory, ProductCategoryAdmin)
    # meps_superuser_site.register(ProductCmu, ProductCmuAdmin)
    # meps_superuser_site.register(ProductRsti, ProductRstiAdmin)
    # meps_superuser_site.register(ProductComplementaire, ProductComplementaireAdmin)

    # # Register  MEPS models
    # meps_superuser_site.register(LeMinistere, LeMinistereAdmin)
    # meps_superuser_site.register(LeMinistre, LeMinistreAdmin)
    # # meps_superuser_site.register(AproposDuMeps, AproposDuMepsAdmin)
    # meps_superuser_site.register(MinistersList, MinistersListAdmin)
    # meps_superuser_site.register(DirectionCard, DirectionCardAdmin)
    # meps_superuser_site.register(Cta, CtaAdmin)
    # meps_superuser_site.register(InfoPersonnelle, InfoPersonnelleAdmin)
    # meps_superuser_site.register(ParcoursProfessionnel, ParcoursProfessionnelAdmin)
    # meps_superuser_site.register(ExpérienceAdministrative, ExpérienceAdministrativeAdmin)
    # meps_superuser_site.register(Distinction, DistinctionAdmin)

    # meps_superuser_site.register(LeCabinet, LeCabinetAdmin)
    # meps_superuser_site.register(DirectionsServicesRattachés, DirectionsServicesRattachésAdmin)

    # meps_superuser_site.register(DecretCabinet, DecretCabinetAdmin)
    # meps_superuser_site.register(Chapter, ChapterAdmin)
    # meps_superuser_site.register(Article, ArticleAdmin)
    # meps_superuser_site.register(ArticleList, ArticleListAdmin)
    # meps_superuser_site.register(DecretList, DecretListAdmin)

    # meps_superuser_site.register(Organigramme, OrganigrammeAdmin)
    # meps_superuser_site.register(StructuresSousTutelle, StructuresSousTutelleAdmin)
    # meps_superuser_site.register(EcoleSpecialisee, EcoleSpecialiseeAdmin)
    # meps_superuser_site.register(DecretOrganisation, DecretOrganisationAdmin)
    # meps_superuser_site.register(MissionsObjectif, MissionsObjectifAdmin)
    # meps_superuser_site.register(MissionsList, MissionsListAdmin)
    # meps_superuser_site.register(MissionCategory, MissionCategoryAdmin)




    # # DIRECTIONS

    #------ Register Directions Générales Emploi models --------
    # meps_superuser_site.register(Emploi, EmploiAdmin)
    # # meps_superuser_site.register(Dge, DgeAdmin)
    # meps_superuser_site.register(Doem, DoemAdmin)
    # meps_superuser_site.register(Dspe, DspeAdmin)
    # meps_superuser_site.register(Dsepe, DsepeAdmin)
    # meps_superuser_site.register(DirectionDetail, DirectionDetailAdmin)


    # meps_superuser_site.register(DspeMission, DspeMissionAdmin)
    # meps_superuser_site.register(DsepeMission, DsepeMissionAdmin)
    # meps_superuser_site.register(DoemMission)
    # --------------------------------------------------------
    # meps_superuser_site.register(DspeProject, DspeProjectAdmin)
    # meps_superuser_site.register(DsepeProject, DsepeProjectAdmin)
    # meps_superuser_site.register(DoemProject, DoemProjectAdmin)
    # --------------------------------------------------------
    # meps_superuser_site.register(DspeObjectif, DspeObjectifAdmin)
    # meps_superuser_site.register(DsepeObjectif, DsepeObjectifAdmin)
    # meps_superuser_site.register(DoemObjectif, DoemObjectifAdmin)
    # --------------------------------------------------------
    # meps_superuser_site.register(DspeContact, DspeContactAdmin)
    # meps_superuser_site.register(DsepeContact, DsepeContactAdmin)
    # meps_superuser_site.register(DoemContact, DoemContactAdmin)
    # --------------------------------------------------------
    # meps_superuser_site.register(DspeSousDirection, DspeSousDirectionAdmin)
    # meps_superuser_site.register(DsepeSousDirection, DsepeSousDirectionAdmin)
    # meps_superuser_site.register(DoemSousDirection, DoemSousDirectionAdmin)
    # # --------------------------------------------------------


    # -------------- Register Directions Générales Protection Sociale models -------------- 
    # meps_superuser_site.register(ProtectionSociale, ProtectionSocialeAdmin)
    # meps_superuser_site.register(Dgps, DgpsAdmin)
    # meps_superuser_site.register(Das, DasAdmin)
    # meps_superuser_site.register(Dpph, DpphAdmin)
    # meps_superuser_site.register(Dssm, DssmAdmin)


    # --------------------------------------------------------
    # meps_superuser_site.register(DasMission, DasMissionAdmin)
    # meps_superuser_site.register(DpphMission, DpphMissionAdmin)
    # meps_superuser_site.register(DssmMission, DssmMissionAdmin)
    # --------------------------------------------------------
    # meps_superuser_site.register(DasProject, DasProjectAdmin)
    # meps_superuser_site.register(DpphProject, DpphProjectAdmin)
    # meps_superuser_site.register(DssmProject, DssmProjectAdmin)
    # --------------------------------------------------------
    # meps_superuser_site.register(DasObjectif, DasObjectifAdmin)
    # meps_superuser_site.register(DpphObjectif, DpphObjectifAdmin)
    # meps_superuser_site.register(DssmObjectif, DssmObjectifAdmin)
    # --------------------------------------------------------
    # meps_superuser_site.register(DasSousDirection, DasSousDirectionAdmin)
    # meps_superuser_site.register(DpphSousDirection, DpphSousDirectionAdmin)
    # meps_superuser_site.register(DssmSousDirection, DssmSousDirectionAdmin)
    # --------------------------------------------------------
    # meps_superuser_site.register(DasContact, DasContactAdmin)
    # meps_superuser_site.register(DpphContact, DpphContactAdmin)
    # meps_superuser_site.register(DssmContact, DssmContactAdmin)
    # meps_superuser_site.register(DoemContactAddress, DoemContactAddressAdmin)


    # -------------- Register Directions Générales Travail models -------------- 
    # meps_superuser_site.register(Travail, TravailAdmin)
    # meps_superuser_site.register(Dgt, DgtAdmin)
    # meps_superuser_site.register(Dit, DitAdmin)
    # meps_superuser_site.register(Dlte, DlteAdmin)
    # meps_superuser_site.register(Drt, DrtAdmin)
    # meps_superuser_site.register(Dsst, DsstAdmin)


    # --------------------------------------------------------
    # meps_superuser_site.register(DitMission, DitMissionAdmin)
    # meps_superuser_site.register(DlteMission, DlteMissionAdmin)
    # meps_superuser_site.register(DrtMission, DrtMissionAdmin)
    # meps_superuser_site.register(DsstMission, DsstMissionAdmin)
    # --------------------------------------------------------
    # meps_superuser_site.register(DitObjectif, DitObjectifAdmin)
    # meps_superuser_site.register(DlteObjectif, DlteObjectifAdmin)
    # meps_superuser_site.register(DrtObjectif, DrtObjectifAdmin)
    # meps_superuser_site.register(DsstObjectif, DsstObjectifAdmin)
    # --------------------------------------------------------
    # meps_superuser_site.register(DitProject, DitProjectAdmin)
    # meps_superuser_site.register(DlteProject, DlteProjectAdmin)
    # meps_superuser_site.register(DrtProject, DrtProjectAdmin)
    # meps_superuser_site.register(DsstProject, DsstProjectAdmin)
    # --------------------------------------------------------
    # meps_superuser_site.register(DitSousDirection, DitSousDirectionAdmin)
    # meps_superuser_site.register(DlteSousDirection, DlteSousDirectionAdmin)
    # meps_superuser_site.register(DrtSousDirection, DrtSousDirectionAdmin)
    # meps_superuser_site.register(DsstSousDirection, DsstSousDirectionAdmin)
    # --------------------------------------------------------
    # meps_superuser_site.register(DitContact, DitContactAdmin)
    # meps_superuser_site.register(DlteContact, DlteContactAdmin)
    # meps_superuser_site.register(DrtContact, DrtContactAdmin)
    # meps_superuser_site.register(DsstContact, DsstContactAdmin)
    # --------------------------------------------------------
    # # --------------------------------------------------------


    #--------------  Register Documents models -------------- 
    meps_superuser_site.register(Document, DocumentAdmin)
    meps_superuser_site.register(DocumentSousCategory, DocumentSousCategoryAdmin)
    meps_superuser_site.register(DocumentCategory, DocumentCategoryAdmin)




    # meps_superuser_site.register(Faq, FaqAdmin)
    # meps_superuser_site.register(ContactDG, ContactDGAdmin)

    # meps_superuser_site.register(ContactsDGE, ContactsDGEAdmin)
    # meps_superuser_site.register(ContactsDGT, ContactsDGTAdmin)
    # meps_superuser_site.register(ContactsDGPS, ContactsDGPSAdmin)
    # meps_superuser_site.register(ContactsCABINET, ContactsCABINETAdmin)

