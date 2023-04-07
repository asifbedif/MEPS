from django.shortcuts import render, get_object_or_404
from .models import *
from .DGE.models import *
# from .DGE.doem.models import Doem
from .DGE.dspe.models import *
from .DGE.dsepe.models import *
from .DGE.doem.models import *

from .DGT.dit.models import *
from .DGT.dlte.models import *
from .DGT.drt.models import *
from .DGT.dsst.models import *

from .DGPS.das.models import *
from .DGPS.dpph.models import *
from .DGPS.dssm.models import *

# Create your views here.
def directions_generales(req):
    directions= []
    e = Emploi.objects.filter(status='published').first()
    t = Travail.objects.filter(status='published').first()
    p = ProtectionSociale.objects.filter(status='published').first()

    if e is not None:
            directions.append(e)
    if t is not None:
            directions.append(t)
    if p is not None:
            directions.append(p)
    
    return render(req, 'directions_generales/index.html',
                  
                  {
                    'directions': directions,
                  }
                  
                  )

def dge(req):
    # doem = get_object_or_404(Doem, status = 'published').first()
    # dspe = get_object_or_404(Dspe, status = 'published').first()
    # dsepe = get_object_or_404(Dsepe, status = 'published').first()

    directions= []

    doem = Doem.objects.filter(status='published').order_by('-published_on').first()
    dspe = Dspe.objects.filter(status='published').order_by('-published_on').first()
    dsepe = Dsepe.objects.filter(status='published').order_by('-published_on').first()

    if doem is not None:
        directions.append(doem)
    if dspe is not None:
        directions.append(dspe)
    if dsepe is not None:
        directions.append(dsepe)

    return render(req, 'directions_generales/DGE.html',
                  {
                    'dge': Emploi.objects.filter(status='published').order_by('-published_on').first(),
                    'directions': directions,
                                                                         
                }
            )

# def dge_doem(req, direction_slug):
#     direction_detail = get_object_or_404(Doem,slug=direction_slug)
#     return render(req, 'directions_generales/dge/doem.html', direction_detail)


def cnps(req):
    return render(req, 'directions_generales/cnps.html')


def dlte(req):
    dlte = Dlte.objects.filter(status='published').order_by('-published_on', 'modified_on').first()
    dlte_infos = {}
    if dlte:
        dlte_infos = {
                    'missions': DlteMission.objects.all(),
                    'projects': DlteProject.objects.all(),
                    'objectifs': DlteObjectif.objects.all(),
                    'sousdirections': DlteSousDirection.objects.all(),
                    'contacts': {
                                    'contactAddress': DlteContactAddress.objects.all(),
                                    'contactTels': DlteContactTel.objects.all(),
                                    'contactEmails': DlteContactEmail.objects.all(),
                                    'contactHoraires': DlteContactHoraire.objects.all(), 
                    },                                                                    
                }
        
    return render(req, 'directions_generales/dlte.html',
                  {                    
                    'dlte': dlte,
                    'dlte_infos': dlte_infos,                                                                         
                }
                  )

def dssm(req):
    dssm = Dssm.objects.filter(status='published').order_by('-published_on', 'modified_on').first()
    dssm_infos = {}
    if dssm:
        dssm_infos = {
                    'missions': DssmMission.objects.all(),
                    'projects': DssmProject.objects.all(),
                    'objectifs': DssmObjectif.objects.all(),
                    'sousdirections': DssmSousDirection.objects.all(),
                    'contacts':{
                                'contactAddress': DssmContactAddress.objects.all(),
                                'contactTels': DssmContactTel.objects.all(),
                                'contactEmails': DssmContactEmail.objects.all(),
                                'contactHoraires': DssmContactHoraire.objects.all(),
                    },
                                                                                             
                }
        
    return render(req, 'directions_generales/dssm.html',
                  {                    
                    'dssm': dssm,
                    'dssm_infos': dssm_infos,                                                                         
                }
            )


def das(req):
    das = Das.objects.filter(status='published').order_by('-published_on', 'modified_on').first()
    das_infos = {}
    if das:
        das_infos = {
                    'missions': DasMission.objects.all(),
                    'projects': DasProject.objects.all(),
                    'objectifs': DasObjectif.objects.all(),
                    'sousdirections': DasSousDirection.objects.all(),
                    'contacts':{
                            'contactAddress': DasContactAddress.objects.all(),
                            'contactTels': DasContactTel.objects.all(),
                            'contactEmails': DasContactEmail.objects.all(),
                            'contactHoraires': DasContactHoraire.objects.all(),  
                            },
                                                                                           
                }
        
    return render(req, 'directions_generales/das.html',
                  {                    
                    'das': das,
                    'das_infos': das_infos,                                                                         
                }
            )

def dsst(req):
    dsst = Dsst.objects.filter(status='published').order_by('-published_on', 'modified_on').first()
    dsst_infos = {}
    if dsst:
        dsst_infos = {
                    'missions': DsstMission.objects.all(),
                    'projects': DsstProject.objects.all(),
                    'objectifs': DsstObjectif.objects.all(),
                    'sousdirections': DsstSousDirection.objects.all(),
                    'contacts':{
                                'contactAddress': DsstContactAddress.objects.all(),
                                'contactTels': DsstContactTel.objects.all(),
                                'contactEmails': DsstContactEmail.objects.all(),
                                'contactHoraires': DsstContactHoraire.objects.all(),  
                    },
                                                                                           
                }
        
    return render(req, 'directions_generales/dsst.html',
                  {                    
                    'dsst': dsst,
                    'dsst_infos': dsst_infos,                                                                         
                }
                  )


def dpph(req):
    dpph = Dpph.objects.filter(status='published').order_by('-published_on', 'modified_on').first()
    dpph_infos = {}
    if dpph:
        dpph_infos = {
                    'missions': DpphMission.objects.all(),
                    'projects': DpphProject.objects.all(),
                    'objectifs': DpphObjectif.objects.all(),
                    'sousdirections': DpphSousDirection.objects.all(),
                    'contacts': {
                                'contactAddress': DpphContactAddress.objects.all(),
                                'contactTels': DpphContactTel.objects.all(),
                                'contactEmails': DpphContactEmail.objects.all(),
                                'contactHoraires': DpphContactHoraire.objects.all(),    
                                },                                                               
                }
        
    return render(req, 'directions_generales/dpph.html',
                  {                    
                    'dpph': dpph,
                    'dpph_infos': dpph_infos,                                                                         
                }
            )


def drt(req):
    drt = Drt.objects.filter(status='published').order_by('-published_on', 'modified_on').first()
    drt_infos = {}
    if drt:
        drt_infos = {
                    'missions': DrtMission.objects.all(),
                    'projects': DrtProject.objects.all(),
                    'objectifs': DrtObjectif.objects.all(),
                    'sousdirections': DrtSousDirection.objects.all(),
                    'contacts': {
                                'contactAddress': DrtContactAddress.objects.all(),
                                'contactTels': DrtContactTel.objects.all(),
                                'contactEmails': DrtContactEmail.objects.all(),
                                'contactHoraires': DrtContactHoraire.objects.all(),   
                    },                                                                      
                }
    return render(req, 'directions_generales/drt.html',
                  {                    
                    'drt': drt,
                    'drt_infos': drt_infos,                                                                         
                })

def dit(req):
    dit = Dit.objects.filter(status='published').order_by('-published_on', 'modified_on').first()
    dit_infos = {}
    if dit:
        dit_infos = {
                    'missions': DitMission.objects.all(),
                    'projects': DitProject.objects.all(),
                    'objectifs': DitObjectif.objects.all(),
                    'sousdirections': DitSousDirection.objects.all(),
                    'contacts': {
                                'contactAddress': DitContactAddress.objects.all(),
                                'contactTels': DitContactTel.objects.all(),
                                'contactEmails': DitContactEmail.objects.all(),
                                'contactHoraires': DitContactHoraire.objects.all(), 
                    },                                                                   
                }
        
    return render(req, 'directions_generales/dit.html',
                  {                    
                    'dit': dit,
                    'dit_infos': dit_infos,                                                                         
                }
                  )

def doem(req):
    doem = Doem.objects.filter(status='published').order_by('-published_on', 'modified_on').first()
    doem_infos = {}
    if doem:
        doem_infos = {
                    'missions': DoemMission.objects.all(),
                    'projects': DoemProject.objects.all(),
                    'objectifs': DoemObjectif.objects.all(),
                    'sousdirections': DoemSousDirection.objects.all(),
                    'contacts': {
                                'contactAddress': DoemContactAddress.objects.all(),
                                'contactTels': DoemContactTel.objects.all(),
                                'contactEmails': DoemContactEmail.objects.all(),
                                'contactHoraires': DoemContactHoraire.objects.all(),  
                    },                                                                    
                }
        
    return render(req, 'directions_generales/doem.html',
                  {                    
                    'doem': doem,
                    'doem_infos': doem_infos,                                                                         
                }
            )

def dsepe(req):
    dsepe = Dsepe.objects.filter(status='published').order_by('-published_on', 'modified_on').first()
    # dsepe = Dsepe.objects.order_by('-published_on').first()
    dsepe_infos = {}
    if dsepe:
        dsepe_infos = {
                    'missions': DsepeMission.objects.all(),
                    'projects': DsepeProject.objects.all(),
                    'objectifs': DsepeObjectif.objects.all(),
                    'sousdirections': DsepeSousDirection.objects.all(),
                    'contacts': {
                                'contactAddress': DsepeContactAddress.objects.all(),
                                'contactTels': DsepeContactTel.objects.all(),
                                'contactEmails': DsepeContactEmail.objects.all(),
                                'contactHoraires': DsepeContactHoraire.objects.all(), 
                    },                                                                       
                }
        
    return render(req, 'directions_generales/dsepe.html',
                  {                    
                    'dsepe': dsepe,
                    'dsepe_infos': dsepe_infos,                                                                         
                }
            )

def dspe(req):
    dspe = Dspe.objects.filter(status='published').order_by('-published_on', 'modified_on').first()
    dspe_infos = {}
    if dspe:
        dspe_infos = {
                    'missions': DspeMission.objects.all(),
                    'projects': DspeProject.objects.all(),
                    'objectifs': DspeObjectif.objects.all(),
                    'sousdirections': DspeSousDirection.objects.all(),
                    'contacts': {
                                'contactAddress': DspeContactAddress.objects.all(),
                                'contactTels': DspeContactTel.objects.all(),
                                'contactEmails': DspeContactEmail.objects.all(),
                                'contactHoraires': DspeContactHoraire.objects.all(),   
                    },                                                                  
                }
        
    return render(req, 'directions_generales/dspe.html',
                  {                    
                    'dspe': dspe,
                    'dspe_infos': dspe_infos,                                                                         
                }
            )

def dgt(req):

    directions= []

    dit = Dit.objects.filter(status='published').order_by('-published_on').first()
    drt = Drt.objects.filter(status='published').order_by('-published_on').first()
    dlte = Dlte.objects.filter(status='published').order_by('-published_on').first()
    dsst = Dsst.objects.filter(status='published').order_by('-published_on').first()

    if dit is not None:
        directions.append(dit)
    if drt is not None:
        directions.append(drt)
    if dlte is not None:
        directions.append(dlte)
    if dsst is not None:
        directions.append(dsst)

    return render(req, 'directions_generales/DGT.html',
                  {
                    'dgt': Travail.objects.filter(status='published').first(),
                    'directions': directions,
                                                                         
                }
            )

def dgps(req):

    directions= []

    das = Das.objects.filter(status='published').order_by('-published_on').first()
    dpph = Dpph.objects.filter(status='published').order_by('-published_on').first()
    dssm = Dssm.objects.filter(status='published').order_by('-published_on').first()

    if das is not None:
        directions.append(das)
    if dpph is not None:
        directions.append(dpph)
    if dssm is not None:
        directions.append(dssm)

    return render(req, 'directions_generales/DGPS.html',
                  {
                    'dgps': ProtectionSociale.objects.filter(status='published').order_by('-published_on').first(),
                    'directions': directions,
                                                                         
                }
            )