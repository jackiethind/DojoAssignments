# def multiply(arr,num):
#     for x in range(len(arr)):
#         arr[x] *= num
#     return arr
# a = [2,4,10,16]
# b = multiply(a,5)
# print b
# output:

# the random function will return a floating point number,
# that is 0.0 <= random_num < 1.0
print "Scores and Grades"
def scoresAndGrades(score):

    if score >= 90:
        print "Score:", str(score) + ".", "Your grade is A"
    elif score >=80 and score < 90:
        print "Score:", str(score) + ".", "Your grade is B"
    elif score >=70 and score < 80:
        print "Score:", str(score) + ".", "Your grade is C"
    elif score >=60 and score < 70:
        print "Score:", str(score) + ".", "Your grade is D"
    else:
        print "Score:", str(score) + ".", "Don't give up, study hard and try again!"


import random
num = 1
while num <=10:
    random_num = int(random.random()*100)
    scoresAndGrades(random_num)
    num += 1
print "End of Program, Bye"
