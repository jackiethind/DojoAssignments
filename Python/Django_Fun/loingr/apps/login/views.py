from django.shortcuts import render, redirect

from django.contrib import messages
import re
def index(request):
    return render(request,'login/index.html')
# Create your views here.
