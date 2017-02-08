
import random
num = 1

heads = 0
tails = 0
while num <=5000:
    random_num = random.random()
    if random_num >=0.5:
        heads += 1
        print "Attempt #", str(num) + ":",  "Throwing a coin... It's a head! ... Got", str(heads), "head(s) so far and", str(tails), "tail(s) so far"
    else:
        tails += 1
        print "Attempt #", str(num) + ":",  "Throwing a coin... It's a tail! ... Got", str(tails), "tail(s) so far and", str(heads), "heads(s) so far"
    num += 1
print "Ending the program, thank you!"
