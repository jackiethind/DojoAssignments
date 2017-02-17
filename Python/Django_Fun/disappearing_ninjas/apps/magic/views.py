from django.shortcuts import render, redirect

def index(request):

    return render(request, 'magic/index.html')
def ninjas(request):
    return render(request,'magic/ninja.html')
def color(request, color):
    check = 0

    if color == 'purple':
        print "ITS PURPLE!"
        check = 'purple'
        print check
    elif color == 'blue':
        print "ITS BLUE!"
        check = 'blue'
        print check
    elif color == 'orange':
        print "ITS ORANGE!"
        check = 'orange'
        print check
    elif color == 'red':
        print "ITS RED!"
        check = 'red'
        print check
    else:
        print "NOT A VALID COLOR!"
        check = 'bad'
        print check
    context = {
        'color': color,
        'check': check
    }
    return render(request,'magic/ninja.html', context)

# '["purple","blue","orange","red"]:
# Create your views here.
