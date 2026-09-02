def add(x, y):
    return x + y


print(add(5, 7))



add = lambda x, y: x + y
print(add(5, 7))



def double(x):
    return x * 2


sequence = [1, 3, 5, 9]

doubled = [
    double(x) for x in sequence
]
doubled = map(double, sequence)
print(list(doubled))


sequence = [1, 3, 5, 9]

doubled = map(lambda x: x * 2, sequence)
print(list(doubled))

