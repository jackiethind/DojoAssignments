for count in range(1,1000):
    if count % 2 != 0:
        print count
# this function prints all the odd numbers from 1 to 1000




for count in range(5,1000000):
    if count %5 == 0:
        print count
# this function prints all the multiples of 5 from 5 to 1,000,000.

a = [1, 2, 5, 10, 255, 3]
sum = 0
for count in a:
    print "number", count
    sum += count
print sum
# this function prints the sum of all the values in the list: a = [1, 2, 5, 10, 255, 3]

a = [1, 2, 5, 10, 255, 3]
sum = 0
avg = 0
count = 0
for number in a:
    print "number", number
    sum += number
    count += 1
avg = sum/count
print avg
# this fucntion prints the average of the values in the list: a = [1, 2, 5, 10, 255, 3]
