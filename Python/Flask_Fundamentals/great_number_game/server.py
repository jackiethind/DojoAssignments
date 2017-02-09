from flask import Flask, render_template, request, redirect, session
import random
app = Flask(__name__)
app.secret_key = "number_game"
@app.route("/") #display route, for index
def index():
    # all functions must return a redirect or a render_template at the end of them to exit the function
     #checks to see if there is a random number in session
    if "win_number" not in session:
        #if there isnt, then make a random number
        session["win_number"] = random.randint(1,101)
    elif session["win_number"] == session["guess"]:
        #if there is a win number, then pop all things stored in session
        session.pop("win_number")
        session.pop("guess")
        session.pop("test")
        return redirect("/") #redirect to index
    return render_template("index.html")
@app.route("/guess", methods=["POST"]) #calculations route
def guess():
    session["guess"] = int(request.form["guess"]) # this is setting the guess provided from the user form and storing it into session, also changes the input to an int
    if session["guess"] == session["win_number"]: #
        session["test"] = "Congrats! " + str(session["win_number"]) + " was the number!" # if the guess is right then print out a string and display the Play Again
                                                                          # button from the index.html
        return redirect("/repeat") # redirect to /repeat which renders template of index again
    if session["guess"] > session["win_number"]: # if the guess is higher than the win number, then test will print "too high"
        session["test"] = "Too High!"
    if session["guess"] < session["win_number"]: # if the guess is lower than the win number, then test will print "too low"
        session["test"] = "Too Low!"
    return redirect("/") # redirect to /repeat which renders template of index again
@app.route("/repeat") #display route
def repeat():
    return render_template("index.html")# renders template of index again
app.run(debug=True)
