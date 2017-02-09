from flask import Flask, render_template, request, redirect, session
import random
from datetime import datetime
app = Flask(__name__)
app.secret_key = "hahaha"
@app.route("/") #display route, for index
def index():
    # try:
    #     session['gold']
    # except KeyError:
    #     session['gold'] = 0


    return render_template("index.html")
@app.route("/process_money", methods=['POST'])
def clicked():
    if 'gold' not in session:
       session['gold'] = 0
    if 'log' not in session:
        session['log'] = ""

    session['choice'] = request.form['building']
    if session['choice'] == 'farm':
        # print "Gold is {}".format
        session['gold']= int(session['gold']) + random.randint(10,21)
        session['log'] += "Earned " + str(random.randint(10,21)) + " golds from the farm " +str(datetime.now().strftime('%Y-%m-%d %H:%M:%S') +"\n")
        # print "Gold is {}".format(session['gold'])
        print "I WENT TO DAT FARM FAM"
        return render_template('index.html', log="Earned " + " golds from the farm" )
    elif session['choice'] == 'cave':
        session['gold']= int(session['gold']) + random.randint(5,11)
        session['log'] += "Earned " + str(random.randint(5,11)) + " golds from the cave "+str(datetime.now().strftime('%Y-%m-%d %H:%M:%S') + "\n")
        # print "Gold is {}".format(session['gold'])
        print "I WENT TO DAT CAVE FAM"
    elif session['choice'] == 'house':
        session['gold']= int(session['gold']) + random.randint(1,6)
        session['log'] += "Earned " + str(random.randint(1,6)) + " golds from the house " +str(datetime.now().strftime('%Y-%m-%d %H:%M:%S')+ "\n")
        # print "Gold is {}".format(session['gold'])
        print "I WENT TO DAT HOUSE FAM"
    elif session['choice'] == 'casino':
        session['gold']= int(session['gold']) + random.randint(-50,51)
        session['log'] += "Earned " + str(random.randint(-50,51)) + " golds from the casino " +str(datetime.now().strftime('%Y-%m-%d %H:%M:%S') +"\n")
        # print "Gold is {}".format(session['gold'])
        print "I WENT TO DAT casino FAM"


    return render_template('index.html')
app.run(debug=True)
