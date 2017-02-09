import random
from flask import Flask, render_template, request, redirect, session
app = Flask(__name__)
app.secret_key = 'KeyOne'

@app.route('/')
def index():
    # all functions must return a redirect or a render_template at the end of them to exit the function
     #checks to see if there is a random number in session
	try:
		session['setValue']
	except KeyError:
		session['setValue'] = random.randrange(1,101,1)
        #if there isnt, then make a random number and store into session in the variable setValue
	return render_template("index.html") # renders template of index again

@app.route('/', methods=['POST'])
def clicked():
	number = int(request.form['number']) #set the variable num to the user input from the form, set user input to an int
	if request.form['button'] == 'Guess': #if the user clicks on the button valued Guess
		if number > int(100) or number < int(1): #if the number provided by user does not fit into range of 1-100, render index again and prompt them to enter a new number
			return render_template('index.html', message="Pick a number in the range you dingdong")
		elif number < int(session['setValue']): # if the guess is lower than the win number, message will print "too low"
			return render_template('index.html', message="Too low!")
		elif number > int(session['setValue']): # if the guess is higher than the win number, message will print "too high"
			return render_template('index.html', message="Too high!")
		elif number == int(session['setValue']): # if the guess is correct, message will print "JUST RIGHT"
			session.pop('setValue') #this will pop off the random number variable from session after the guess is correct
			return render_template('index.html', message="JUST RIGHT")

app.run(debug=True)
