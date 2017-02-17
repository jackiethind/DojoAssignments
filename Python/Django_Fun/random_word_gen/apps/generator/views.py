from django.shortcuts import render, redirect
from django.utils.crypto import get_random_string


def index(request):
    # if 'num' not in request.session:
    #     request.session['num'] = 0
    try:
    	request.session['num']
    except KeyError:
    	request.session['num'] = 0
        request.session['word'] = ""
    return render(request, 'generator/index.html')
# Create your views here.
def word(request):
    if request.method == "POST":
       request.session['num'] += 1
       request.session['word'] = get_random_string(length=14)
       print request.session['num']
       return redirect("/")
    else:
       return redirect("/")
def reset(request):
    if request.method == "POST":
        print "*"*50
        print request.POST
        print request.method
        print "*"*50
        del request.session['num'] #sends KeyError
        del request.session['word']
        return redirect("/")
    return redirect("/")
