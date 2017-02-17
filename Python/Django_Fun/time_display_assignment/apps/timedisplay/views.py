from django.shortcuts import render
from datetime import datetime
def index(request):
    time= datetime.now().strftime('%b %d, %Y %I:%M %p')
    print "This is the time", time
    context = {
    "time":time
     }
    return render(request,'timedisplay/index.html', context)
# Create your views here.
