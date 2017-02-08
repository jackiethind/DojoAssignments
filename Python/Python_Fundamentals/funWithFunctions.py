# def add(a,b):
#   x = a + b
#   return x
# # the return value gets assigned to the "result" variable
# result = add(3,5)
# print result # this should print 8
#
# # we've named the function 'add' and we give it two parameters(inputs to the function)
# def add(a,b):
#   x = a + b
#   return x  # we return something (more on this later)
# print add(3,5) #prints 8
#
# def say_hi():
#   return "Hi"
# greeting = say_hi() #the returned value from say_hi function gets assigned to the 'greeting' variable
# print greeting # this will output 'Hi'
#
# def add(a, b):
#   x = a + b
#   return x
# sum1 = add(4,6)
# sum2 = add(1,4)
# sum3 = sum1 + sum2

# def odd_even(a,b):
#     for num in range(a,b):
#         if num % 2 == 0:
#             print "Number is", str(num) + ".", "This is an even number."
#         else :
#             print "Number is", str(num) + ".", "This is an odd number."
# range = odd_even(1,2001)
# this is a function called odd_even that counts from 1 to 2000. As the loop executes, the program prints the number of that iteration and specifies whether it's an odd or even number.

# def multiply(a,c):
#     index = 0
#     for count in a:
#         fives = count*c
#         a.pop(index)
#         a.insert(index,fives)
#         index += 1
#     return a
#
# a = [2,4,10,16]
# b = multiply(a, 5)
# print b
#this is a function called 'multiply' that iterates through each value in a list (e.g. a = [2, 4, 10, 16]) and returns a list where each value has been multiplied by 5. The function multiplies each value in the list by the second argument


def multiply(a,c):
    index = 0
    for count in a:
        print "number", count
        multiple = count*c
        a.pop(index)
        new_array = []
        while multiple > 0:
            new_array.append(1)
            multiple -= 1
        a.insert(index,new_array)
        index += 1
    return a

a = [2,4,6]
b = multiply(a, 3)
print b
# hacker challenge = this is a function that takes the multiply function and calls it as an argument. it returns the multiplied list as a two-dimensional list. Each internal list contains as many ones as the number in the original list.
