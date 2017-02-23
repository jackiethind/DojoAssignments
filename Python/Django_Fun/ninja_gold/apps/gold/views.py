from django.shortcuts import render, redirect
from random import randrange
from time import localtime, strftime
context = {
    'choice':'',
    'gold': 0
}
def index(request):
    try:
        	# request.session['gold']
        request.session['log']
    except KeyError:
        	# request.session['gold'] = 0
        request.session['log'] = ''
    return render(request, 'gold/index.html', context)
def process(request):
    if request.method == "POST":
            context['choice'] = request.POST['building']
            if context['choice'] == 'farm':
                # print "Gold is {}".format
                context['gold'] = int(context['gold']) + randrange(10,21)
                request.session['log'] += "Earned " + str(randrange(10,21)) + " golds from the farm " +str(strftime('%Y-%m-%d %H:%M:%S') +"\n")
                # print "Gold is {}".format(session['gold'])
                print "I WENT TO DAT FARM FAM"

            elif context['choice'] == 'cave':
                context['gold'] = int(context['gold']) + randrange(5,11)
                request.session['log'] += "Earned " + str(randrange(5,11)) + " golds from the cave "+str(strftime('%Y-%m-%d %H:%M:%S') + "\n")
                # print "Gold is {}".format(session['gold'])
                print "I WENT TO DAT CAVE FAM"
            elif context['choice'] == 'house':
                context['gold'] = int(context['gold']) + randrange(1,6)
                request.session['log'] += "Earned " + str(randrange(1,6)) + " golds from the house " +str(strftime('%Y-%m-%d %H:%M:%S')+ "\n")
                # print "Gold is {}".format(session['gold'])
                print "I WENT TO DAT HOUSE FAM"
            elif context['choice'] == 'casino':
                context['gold'] = int(context['gold']) + randrange(-50,51)
                request.session['log'] += "Earned " + str(randrange(-50,51)) + " golds from the casino " +str(strftime('%Y-%m-%d %H:%M:%S') +"\n")
                # print "Gold is {}".format(session['gold'])
                print "I WENT TO DAT casino FAM"

    return redirect('/')
# def process(request):

# Create your views here.
