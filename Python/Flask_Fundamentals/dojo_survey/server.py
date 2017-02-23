from flask import Flask, render_template, request, redirect
app = Flask(__name__)
# our index route will handle rendering our form
@app.route('/')
def index():
    try:
        request.session['num']
    except KeyError:
        request.session['num'] = 0
    return render_template(request,"survey/index.html")
# this route will handle our form submission
# notice how we defined which HTTP methods are allowed by this route
@app.route('/users', methods=['POST'])
def create_user():
   print "Got Post Info"
   # we'll talk about the following two lines after we learn a little more
   # about forms
   name = request.form['name']
   location = request.form['location']
   langs = request.form['langs']
   comment = request.form['comment']
   # redirects back to the '/' route

   # return redirect('/')
   return render_template("users.html", name = name, location = location, langs = langs, comment = comment)
app.run(debug=True) # run our server
