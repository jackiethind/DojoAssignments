str = "If monkeys like bananas, then I must be a monkey!"
print str.find("monkey")
print str.rfind("monkey")
print str.replace("monkey", "alligator")

x = [2,54,-2,7,12,98]
print max(x)
print min(x)


x = x = ["hello",2,54,-2,7,12,98,"world"]
print x[0]
print x[-1]

new_list = []
new_list.insert(0,x[0])
new_list.insert(1,x[-1])

print new_list

x = [19,2,54,-2,7,12,98,32,10,-3,6]
x.sort()
print x
new_list = []
new_list.insert(0,x[0])
x.pop(0)
new_list.insert(0,x[0])
x.pop(0)
print x
print new_list
x.insert(0,new_list)
print x
