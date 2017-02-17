from django.shortcuts import render, redirect

context = {
    'name' : '',
    'location' : '',
    'language' : ''
}
def index(request):
    try:
        request.session['num']
    except KeyError:
        request.session['num'] = 0
    return render (request,"survey/index.html")

def users(request):
    if request.method == "POST":
        if request.POST['button'] == 'back':
		    return redirect ('/')
        else:
            request.session['num'] += 1
            print "Got Post Info"
            context['name'] =  request.POST['name']
            context['location'] = request.POST['location']
            context['langs'] = request.POST['langs']
            context['comment']= request.POST['comment']
            return redirect ("/success")

def success(request):
    return render (request,"survey/success.html", context)
