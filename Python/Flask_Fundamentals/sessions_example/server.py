from flask import Flask, render_template, request, redirect, session
app = Flask(__name__)
app.secret_key = 'CounterSecret'
@app.route('/')
def index():

    if 'count' not in session
        session['count'] = 1
    else
        session['count'] += 1
    # session['counter'] = session['counter'] + 1
    return render_template("index.html")
app.run(debug=True)
