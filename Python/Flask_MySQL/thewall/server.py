from flask import Flask, redirect, request, render_template, flash, session
from mysqlconnection import MySQLConnector
import re
from flask.ext.bcrypt import Bcrypt
EMAIL_REGEX = re.compile(r'^[a-zA-Z0-9.+_-]+@[a-zA-Z0-9._-]+\.[a-zA-Z]+$')
# PASSWORD_REGEX = re.compile(r'((?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,})', re.MULTILINE)
app = Flask(__name__)
bcrypt = Bcrypt(app)
app.secret_key = 'the_wall'
mysql = MySQLConnector(app, "wall2")# imports the md5 module to generate a hash
password = 'password'

# THIS FUNCTIONS CHECKS TO SEE IF INPUT IS VALID, CALL IT INSIDE OTHER FUNCTIONS WHEN NEEDED WITH THE APPROPIATE PARAMETERS
def invalid(first_name, last_name, email, password, password_confirm):
    errors = False
    if len(first_name) < 2 or len(last_name) < 2:
        flash("Name is too short.")
        errors = True
    if len(email) < 1:
        flash("Email is too short.")
        errors = True
    if len(password) < 8:
        flash("Password is too short. Please make a password with at least 8 characters.")
        errors = True
    #type validate
    if not EMAIL_REGEX.match(email):
        flash("Invalid email address.")
        errors = True
    # if not PASSWORD_REGEX.match(password):
    #     flash("Invalid Password")
    #     errors = True
    if not (re.search(r"^[^0-9]*$", first_name) and re.search(r"^[^0-9]*$", last_name)):
        flash("Name cannot contain numbers.")
        errors = True
    #checks if password is the same as password confirm
    if password != password_confirm:
        print "PASSWORDS DO NOT MATCH @!#!@@#!@#!@#@!$!@#!@#!@#@!#!@3"
        flash("Passwords do not match!")
        errors = True
    return errors


@app.route('/')
def index():
    if 'user' in session:
        user_query = "SELECT first_name, last_name FROM users WHERE id = :id"
        user_data = {
            'id': session['user']
        }
        query = mysql.query_db(user_query, user_data)
    flash("You are logged in as " + query[0]["first_name"] + " " + query[0]['last_name'])

    return render_template('index.html')

 #CREATES USER USING REGISTRATION INFORMATION
@app.route('/success', methods={'POST'})
def create_user():
     print "******************************************"
     first_name = request.form['first_name']
     last_name = request.form['last_name']
     email = request.form['email']
     password = request.form['password']
     password_confirm = request.form['password_confirm']
     pw_hash = bcrypt.generate_password_hash(password)
    #  pwc_hash = bcrypt.generate_password_hash(password_confirm)
     query_data = {
                 'first_name':first_name,
                 'last_name':last_name,
                 'email': email,
                 'pw_hash': pw_hash
     }
     errors = False
     errors = invalid(first_name, last_name, email, password, password_confirm)
     if not errors:
         insert_query = "INSERT INTO users (first_name, last_name, email, pw_hash) VALUES (:first_name, :last_name, :email, :pw_hash)"
         mysql.query_db(insert_query, query_data)
     return redirect('/wall')

@app.route('/login', methods={'POST'})
def login_user():
    #  if 'user' in session:
    #      return render_template('victory.html')
     email = request.form['email_login']
     password = request.form['password_login']
     query = "SELECT * FROM users WHERE email = :email LIMIT 1"
     query_data = { 'email': email }
     user = mysql.query_db(query, query_data) # user will be returned in a list
     if bcrypt.check_password_hash(user[0]['pw_hash'], password):
         session['user'] = user[0]['id']
         return redirect('/wall')
     else:
         flash('Login Failed')
         return redirect('/')
        # set flash error message and redirect to login page


@app.route('/wall')
def the_wall():
    if 'user' in session:
        user_query = "SELECT first_name, last_name FROM users WHERE id = :id"
        user_data = {
            'id': session['user']
        }
        query = mysql.query_db(user_query, user_data)
        print "*************#@!#!@#!@#!@#!@#@!#@!#@!#!@"
        flash("You are logged in as " + query[0]["first_name"] + " " + query[0]['last_name'])
    return render_template('wall.html')

@app.route('/message', methods={'POST'})
def writemessage():
     user_id = session['user']
     message = request.form['message']
     if len(message) < 1:
        flash("Message is too short.")
     else:
        query_data = {
            'message':message,
            'user_id':user_id
        }

        insert_query = "INSERT INTO messages (message, user_id) VALUES (:message,:user_id)"
        mysql.query_db(insert_query, query_data)

     return render_template('wall.html')

@app.route("/success")
def success():
    select_query = "SELECT users.id, users.first_name, users.last_name, messages.message, messages.created_at\
    FROM messages \
    JOIN users\
    ON messages.user_id = users.id ORDER BY created_at DESC"
    querytwo =
    commentsQuery = "SELECT comments.comment, comments.created_at, users.first_name, users.last_name, comments.message_id \
    FROM comments\
    JOIN users ON comments.user_id = users.id;"
    comments = mysql.query_db(commentsQuery)


@app.route('/comment', methods="POST")
def comment():
    print "made it to the comment page"

    insert_query= "INSERT INTO comments (comment, user_id, message_id, created_at, updated_at) VALUES (:comment, :user_id, :message_id, NOW(), NOW());"
    data = {
        'comment' : request.form['usercomment'],
        'user_id' : session['id'],
        'messageid' : request.form['msgid']
    }
    mysql.query_db(insert_query, data)
    return redirect('/success')
app.run(debug=True)
