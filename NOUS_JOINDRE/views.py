from django.shortcuts import render
from .models import *


# Create your views here.
def contacts(req):

    contactsDGE = ContactsDGE.objects.filter(status='published').first()
    contactsDGT = ContactsDGT.objects.filter(status='published').first()         
    contactsDGPS = ContactsDGPS.objects.filter(status='published').first()           
    contactsCABINET = ContactsCABINET.objects.filter(status='published').first()
            
    dge_directions = []
    dgt_directions = []
    dgps_directions = []
    cabinet_directions = []

    # contacts = []
    # directions = []

    if contactsDGE:
        dge_directions = DGE_directions_contacts.objects.filter(status='published').all()
        # data.append({'contactsDGE': contactsDGE, 'directions': dge_directions})
    if contactsDGT:
        dgt_directions = DGT_directions_contacts.objects.filter(status='published').all()
        # data.append({'contactsDGT': contactsDGT, 'directions': dgt_directions})
    if contactsDGPS:
        dgps_directions = DGPS_directions_contacts.objects.filter(status='published').all()
        # data.append({'contactsDGPS': contactsDGPS, 'directions': dgps_directions})
    if contactsCABINET:
        cabinet_directions = CABINET_directions_contacts.objects.filter(status='published').all()
        # data.append({'contactsCABINET': contactsCABINET, 'directions': cabinet_directions})
                     
    # print('data ==>' ,data)     
    return render(req, 'nous_joindre/nos-contacts.html',{ 
            'data': {
                    'contactsCABINET':{
                                        'contacts': contactsCABINET, 
                                        'directions': cabinet_directions,
                                    },
                   'contactsDGE': {
                                    'contacts': contactsDGE, 
                                    'directions': dge_directions,
                                    },
                    'contactsDGT':{
                                    'contacts': contactsDGT, 
                                    'directions': dgt_directions,
                                    },
                                    
                    'contactsDGPS': {
                                    'contacts': contactsDGPS, 
                                    'directions': dgps_directions,
                                    },                    
                    }
                },)

def faq(req):
    return render(req, 'nous_joindre/faq.html',
                  {
                    'faqs': Faq.objects.filter(status='published').all()
                  }
                )