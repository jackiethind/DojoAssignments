from django.shortcuts import render, redirect
from django.contrib import messages
from .models import User, Interest

def index(request):
    return render(request, 'many/index.html')

def process(request):
    login = User.objects.login(request.POST)
    if login['valid']:
        print "** Login info is valid **"
    else:
        print "** Login info is NOT valid **"
    return redirect("/people")

def people(request):

    users = User.objects.all()
    print users
    context = {
        'users':users
    }
    return render(request,'many/people.html', context)

def interests(request):

    return render(request,'many/interests.html')

# Create your views here.
