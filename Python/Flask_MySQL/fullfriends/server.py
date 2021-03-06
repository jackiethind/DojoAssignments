from flask import Flask, render_template, request, redirect, flash, session
import re
EMAIL_REGEX = re.compile(r'^[a-zA-Z0-9.+_-]+@[a-zA-Z0-9._-]+\.[a-zA-Z]+$')
NAME_REGEX = re.compile(r'^[^0-9]+$')
rom mysqlconnection import MySQLConnector
app = Flask(__name__)
mysql = MySQLConnector(app,'fullfriends')
app.secret_key = "fullfriends"
# our index route will handle rendering our form
@app.route('/', methods=['GET'])
def index():
  return render_template("index.html")
# this route will handle our form submission
# notice how we defined which HTTP methods are allowed by this route
@app.route('/friends', methods=['POST'])
def create():
    print "Got Post Info"
    confirm_password = request.form['confirm_password']
    # ****** CHECKS FIRST NAME *********
    if len(request.form['first_name']) < 1:
      flash("First name cannot be empty!")
    elif not NAME_REGEX.match(request.form['first_name']):
      flash("First name cannot contain numbers!")
    else:
      flash("Successfully entered first name")
      first_name = request.form['first_name']
    # ****** CHECKS LAST NAME *********
    if len(request.form['last_name']) < 1:
      flash("Last name cannot be empty!")
    elif not NAME_REGEX.match(request.form['first_name']):
      flash("Last name cannot contain numbers!")
    else:
      flash("Successfully entered last name")
      first_name = request.form['last_name']
    # ****** CHECKS EMAIL *********
    if len(request.form['email']) < 1:
        flash("Email cannot be blank!")
    elif not EMAIL_REGEX.match(request.form['email']):
        flash("Invalid Email Address!")
    else:
        flash("Success!")
        email = request.form['email']
       # redirects back to the '/' route
    return redirect('/')
@app.route('/friends/<id>/edit', methods=['GET'])
def edit(id):


@app.route('/friends/<id>', methods=['POST'])
def update(id):

@app.route('/friends/<id>/delete', methods=['POST'])
def destroy(id):



app.run(debug=True) # run our server
