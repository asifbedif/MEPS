from django.shortcuts import render

from MEPS.cabinet.models import * 
from MEPS.ministere.models import *
from MEPS.ministre.models import * 
from MEPS.Missions_Objectifs.models import *
from MEPS.Directions_Services_Rattaches.models import *
from MEPS.Decret_Organisation.models import *
from MEPS.organigramme.models import *
from MEPS.StructuresSousTutelles.models import *
from MEPS.EcolesSpecialisees.models import *

 
# Create your views here.

def directions(req):
    return render(req, 'meps/directions-generales.html')

def ministere(req):
    return render(req, 'meps/ministere.html',
                  {
                    'LeMinistere': LeMinistere.objects.filter(post_status='published').first(),
                    'MinistersList': MinistersList.objects.filter(status='published'),
                    'DirectionCard': DirectionCard.objects.all(),
                    'CTA_btn': Cta.objects.filter(activated='True').order_by('-activated').first(),
                    
                  }
                )


def decret_d_organisation(req):
    decret_file = DecretOrganisation.objects.filter(post_status='published').first()
    # print(decret_file)   
    # print("********************************")
    # print(decret_file.pdf.name[11:-4].replace('_', ' '))
    return render(req, 'meps/decret-d-organisation.html', { 'decret': decret_file, })

def ecoles_specialisees(req):
    ecoles = EcoleSpecialisee.objects.filter(post_status='published')
    return render(req, 'meps/ecoles-specialisees.html', {'ecoles': ecoles,})


def epn(req):
    return render(req, 'meps/epn.html')


def le_cabinet(req):
    return render(req, 'meps/le-cabinet.html', 
                  {
                    # 'cabinet': Cabinet.objects.filter(post_status='published').first(),
                    'chapters': Chapter.objects.all(),
                    'articles': Article.objects.all(),
                    'articles_list': ArticleList.objects.all(),
                    # 'decrets': DecretCabinet.objects.all(),
                    'cabinet': DecretCabinet.objects.filter(post_status='published').first(),                                                         
                    'decret_list': DecretList.objects.all(),
                  }
                  )

def directions_services_rattaches(req):
    directions_services = DirectionsServicesRattachés.objects.filter(post_status='published').order_by('-display_first')
    # print(directions_services)
    return render(req, 'meps/directions-et-services-rattaches.html',
                  {
                       'directions_services': directions_services,
                  }
    )


def equipe_du_cabinet(req):
    return render(req, 'meps/equipe-du-cabinet.html')

def inspection_generale(req):
    return render(req, 'meps/inspection-generale.html')


def le_ministre(req):
    return render(req, 'meps/le-ministre.html', {
                                
                        'ministre': LeMinistre.objects.filter(status='published').first(),
                        'biographie': Biographie.objects.filter(status='published'),
                        'infos_personnelle': InfoPersonnelle.objects.filter(status='published'),
                        'parcours_professionnel': ParcoursProfessionnel.objects.filter(status='published'),
                        'parcours_politique':ParcoursPolitique.objects.filter(status='published'),                        
                        'experience_administrative': ExpérienceAdministrative.objects.filter(status='published'),
                        'distinctions': Distinction.objects.filter(status='published'),
                     }
                                                      
                  )

def organigramme(req):
    orga_file = Organigramme.objects.filter(post_status='published').first()    
    # print("********************************")
    # print(orga_file.pdf.name[28:-4].replace('_', ' '))
    return render(req, 'meps/organigramme.html', {'organigramme': orga_file, })

def structures_sous_tutelles(req):
    structures = StructuresSousTutelle.objects.filter(post_status = 'published')
    # print(structures)
    return render(req, 'meps/structures-sous-tutelles.html', {'structures': structures,})

def missions_objectifs(req):
    return render(req, 'meps/missions-et-objectifs.html',
                                                        {
                                                            'page': MissionsObjectif.objects.filter(post_status='published').first(),
                                                            'missions_categories': MissionCategory.objects.all(),
                                                            'missions_list': MissionsList.objects.all(),
                                                        }
                  )

# DIRECTIONS RATTACHEES

def dafm(req):
    return render(req, 'meps/directions-et-services-rattaches/dafm.html')

def daj(req):
    return render(req, 'meps/directions-et-services-rattaches/daj.html')
    
def ddca(req):
    return render(req, 'meps/directions-et-services-rattaches/ddca.html')
    
def dpcsps(req):
    return render(req, 'meps/directions-et-services-rattaches/dpcsps.html')
    
def dsi(req):
    return render(req, 'meps/directions-et-services-rattaches/dsi.html')
    
def sgp(req):
    return render(req, 'meps/directions-et-services-rattaches/sgp.html')
    
def smht(req):
    return render(req, 'meps/directions-et-services-rattaches/smht.html')
  
def drh(req):
    return render(req, 'meps/directions-et-services-rattaches/drh.html')

def cellulepassation(req):
    return render(req, 'meps/directions-et-services-rattaches/cellulepassation.html')