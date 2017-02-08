# students = [
#      {'first_name':  'Michael', 'last_name' : 'Jordan'},
#      {'first_name' : 'John', 'last_name' : 'Rosales'},
#      {'first_name' : 'Mark', 'last_name' : 'Guillen'},
#      {'first_name' : 'KB', 'last_name' : 'Tonel'}
# ]
#
# for i in range(len(students)):
#      print students[i]["first_name"], students[i]["last_name"]

# for val in capitals.itervalues():
#      print val
#
users = {
 'Students': [
     {'first_name':  'Michael', 'last_name' : 'Jordan'},
     {'first_name' : 'John', 'last_name' : 'Rosales'},
     {'first_name' : 'Mark', 'last_name' : 'Guillen'},
     {'first_name' : 'KB', 'last_name' : 'Tonel'}
  ],
 'Instructors': [
     {'first_name' : 'Michael', 'last_name' : 'Choi'},
     {'first_name' : 'Martin', 'last_name' : 'Puryear'}
  ]
 }

# for i in range(len(users)):
    # print users[i]
# for key in users.iterkeys():
#     print key
#     for i in range(len(Students)):
#         print Students[i]["first_name"], Students[i]["last_name"]

for i in range(len(users)/2):
    print "Students"
    for j in range(len(users["Students"])):
        print str(j+1) + " - " + users["Students"][j]["first_name"]+" " +users["Students"][j]["last_name"] + " - " +str(len(users["Students"][j]["first_name"]) + len(users["Students"][j]["last_name"]))
    print "Instructors"
    for k in range(len(users["Instructors"])):
        print str(k+1) + " - " + users["Instructors"][k]["first_name"]+" " +users["Instructors"][k]["last_name"] + " - " + str(len(users["Students"][j]["first_name"]) + len(users["Students"][j]["last_name"]))
    # print users["Instructors"]
#
#
# data ={"house":"Haus",
# "cat":"Katze",
# "red":"rot"}
# print data.items()
# #[('house', 'Haus'), ('red', 'rot'), ('cat', 'Katze')]
# print data.keys()
# #['house', 'red', 'cat']
# print data.values()
# #['Haus', 'rot', 'Katze']
#
# weekend = {"Sun": "Sunday", "Mon": "Monday"} #literal notation
# capitals = {} #create an empty dictionary then add values
# capitals["svk"] = "Bratislava"
# capitals["deu"] = "Berlin"
# capitals["dnk"] = "Copenhagen"
#
# # print weekend["Sun"]
# # print capitals["svk"]
# #
# # #to print all keys
# # for data in capitals:
# #      print data
# # #another way to print all keys
# # for key in capitals.iterkeys():
# #      print key
# #to print the values
# for val in capitals.itervalues():
#      print val
# #to print all keys and values
# for key,data in capitals.iteritems():
#      print key, " = ", data
