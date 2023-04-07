from django.shortcuts import render, redirect
from django.contrib import messages
from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.http import HttpResponseRedirect
from .models import UserProfile

# Create your views here.

@login_required
def admin_ministere(req):
    return render(req, 'meps_admin/Meps/le-ministere.html')

@login_required
def admin_profile(req):
    # logged_user = User.objects.filter(instance=req.user.userprofile)
    return render(req, 'Users/Account/profile.html', 
                        {
                            'logged_user': req.user,
                            'profile': req.user.userprofile,
                        }
    )

def admin_register(req):

    if req.method == 'POST':
        input_username = req.POST.get('username')
        input_lastname = req.POST.get('lastname')
        input_firstname = req.POST.get('firstname')
        input_email = req.POST.get('email')
        input_password = req.POST.get('password')
        input_password_confirmation = req.POST.get('password_confirmation')
        # input_service = req.POST.get('service')
        
        
        
        if input_password != input_password_confirmation:
            messages.error(req, 'Passwords are not matched!', extra_tags='danger')
            print(input_password)
            print(input_password_confirmation)
        else:
            new_user = User.objects.create_user(username=input_username, email=input_email, password=input_password)
            new_user.first_name = input_firstname
            new_user.last_name = input_lastname
            # new_user.service = input_service

            new_user.save()

            messages.success(req, 'Your account has been created successfully')

            return redirect('admin-login')
    return render(req, 'Users/Account/register.html')
        
    


def admin_login(req):

    if req.user.is_authenticated:            
        return redirect('meps-admin')

    if req.method == 'POST':
        usr_name = req.POST.get('username')
        usr_password = req.POST.get('password')

        usr = User.objects.get(username=usr_name)
        print(usr)
        print(usr_password)
        print(usr.password)
        print(usr.check_password(usr_password))
        
        
        if not usr.username:
            messages.info(req, 'The user %s does not exists' % usr_name)
            return HttpResponseRedirect(req.META.get('HTTP_REFERER'))
        else:
            if not usr.check_password(usr_password):
                messages.warning(req, 'Paswword provided for the user %s is incorrect!' % usr_name)
                return HttpResponseRedirect(req.META.get('HTTP_REFERER'))
                # redirect('admin-login')
            else:
                logged_user = authenticate(username=usr_name, password=usr_password)
        
        if logged_user:
            login(req, logged_user)
            messages.success(req,'You have been logged in successfully!')
            return redirect('meps-admin')
            # return redirect('meps-admin', {'logged_user': logged_user})
        else:
            messages.error(req,'Invalid username or password', extra_tags='danger')
            redirect('admin-login')

    return render(req, 'Users/Account/login.html')
    
@login_required
def admin_logout(req):
    logout(req)
    messages.success(req,'You have been logged out successfully!')
    # return redirect('admin-login')
    return render(req, 'Users/Account/logout.html')



def admin_reset_password(req):
    return render(req, 'Users/Account/reset-password.html')


@login_required
def admin_lock_screen(req):
    return render(req, 'Users/Account/lock-screen.html')

@login_required
def admin_mail(req):
    return render(req, 'meps_admin/Mail/index.html')
