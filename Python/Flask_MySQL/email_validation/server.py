from flask import Flask, request, redirect, render_template, session, flash
import re
EMAIL_REGEX = re.compile(r'^[a-zA-Z0-9.+_-]+@[a-zA-Z0-9._-]+\.[a-zA-Z]+$')
from mysqlconnection import MySQLConnector
app = Flask(__name__)
mysql = MySQLConnector(app,'email_validation')
app.secret_key = "validatethatemail"

@app.route('/')
def index():
    return render_template('index.html')
@app.route('/emails/<email_id>')
def show(email_id):
    query = "SELECT * FROM emails WHERE id = :specific_id"
    data = {"specific_id":email_id}
    emails = mysql.query_db(query,data)
    return render_template("index.html", one_email=emails[0])
@app.route('/process', methods=['POST'])
def process():
    if len(request.form['email']) <1:
        flash("Invalid Email Address!")
    elif not EMAIL_REGEX.match(request.form['email']):
        flash("Invalid Email Address!")
    else:
        # add an email to the database!
        print request.form['email']
        query = "INSERT INTO emails (email, created_at, updated_at) VALUES (:email, NOW(), NOW())"
        data = {
            'email': request.form['email']
        }
        mysql.query_db(query,data)
        query = "SELECT * FROM emails"
        emails = mysql.query_db(query)
        return redirect('/success')

    return redirect('/')
@ap.route('/success')
def success():
    query = "SELECT * FROM emails"
    emails = mysql.query_db(query)
    for em in emails:
        em['created_at']
    return render_template('success.html', all_emails=emails)

app.run(debug=True)
