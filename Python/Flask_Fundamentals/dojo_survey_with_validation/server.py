from flask import Flask, render_template, request, redirect, flash
app = Flask(__name__)
app.secret_key = 'ThisIsSecret'
# our index route will handle rendering our form
@app.route('/')
def index():
  return render_template("index.html")
# this route will handle our form submission
# notice how we defined which HTTP methods are allowed by this route
@app.route('/users', methods=['POST'])
def create_user():
   print "Got Post Info"
   # we'll talk about the following two lines after we learn a little more
   # about forms

   if len(request.form['name']) < 1:
      flash("Name cannot be empty!")
      return redirect('/')
   else:
      name = request.form['name']
   location = request.form['location']
   langs = request.form['langs']
   if len(request.form['comment']) < 1:
      flash("Comment cannot be empty!")
      return redirect('/')
   elif len(request.form['comment']) > 121:
      flash("Comment cannot be more than 120 characters!")
      return redirect('/')
   else:
      comment= request.form['comment']
   # redirects back to the '/' route

   # return redirect('/')
   return render_template("users.html", name = name, location = location, langs = langs, comment = comment)
app.run(debug=True) # run our server
   # just pass a string to the flash function
   # just pass a string to the flash function
