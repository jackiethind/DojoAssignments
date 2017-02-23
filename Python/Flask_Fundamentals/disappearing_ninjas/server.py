from flask import Flask, render_template, request, redirect, session
app = Flask(__name__)
app.secret_key = 'ThisIsSecret'
# our index route will handle rendering our form
@app.route('/')
def index():
    return render_template("index.html")

@app.route('/<ninja>')
def ninja_check(ninja):
    if ninja == "ninja":
        no_color = ninja
    return render_template("ninja.html", no_color = no_color)
@app.route('/ninja/<ninja_color>')
def ninja(ninja_color):
    if ninja_color in ["purple","blue","orange","red"]:
        color = ninja_color
    else:
        color = "bad_color"
    return render_template("ninja.html", color = color)
app.run(debug=True)
