from django.shortcuts import render
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger

#from .forms import CommuniquesForm

# Create your views here.

def meps_admin(req):
    return render(req, 'meps_admin/index.html')


def admin_communiques(req):
    table_header = "ID Image Titre Slug Content Excerpt Author Post_Status Created_On Last_Modified Actions"

    #communiques_form = CommuniquesForm()

    return render(req, 'meps_admin/Publications/communiques.html', {
        #"communiques_form": CommuniquesForm, 
        "table_header": table_header,})


def admin_actualite(req):
    table_header = "ID Image Titre Slug Content Excerpt Author Post_Status Created_On Last_Modified Comment_Status Comment_Count Actions" 
    return render(req, 'meps_admin/Publications/actualite.html', {"table_header": table_header,})

def admin_documents(req):
    return render(req, 'meps_admin/Documents/index.html')

def admin_ministere(req):
    return render(req, 'meps_admin/Meps/le-ministere.html')

def admin_profile(req):
    return render(req, 'meps_admin/users/index.html')


def admin_register(req):
    return render(req, 'meps_admin/users/register.html')


def admin_login(req):
    return render(req, 'meps_admin/users/login.html')


def admin_reset_password(req):
    return render(req, 'meps_admin/users/reset-password.html')



def admin_lock_screen(req):
    return render(req, 'meps_admin/users/lock-screen.html')


def admin_media(req):
    return render(req, 'meps_admin/Media/index.html')


def admin_mail(req):
    return render(req, 'meps_admin/Mail/index.html')

def paginations(request, data_list, items_per_page=6):
    # Pagination with 3 posts per page
    paginator = Paginator(data_list, items_per_page)
    page_number = request.GET.get('page', 1)
    
    try:
        data = paginator.page(page_number)

    except PageNotAnInteger:
        # If page_number is not an integer deliver the first page
        data = paginator.page(1)   

    except EmptyPage:
        # If page_number is out of range deliver last page of results
        data = paginator.page(paginator.num_pages)

    return data