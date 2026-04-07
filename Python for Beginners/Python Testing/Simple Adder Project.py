import sys

print("Welcome to your simple adder!")
print("-----------------------------")

a: str = input('Enter a value for "a": ')
b: str = input('Enter a value for "b": ')
print("-----------------------------")

print("The result is: ", int(a) + int(b))



#Section 5

total: float = 0
while True:
    user_input: str = input('Enter a number: ')

    if user_input =='0':
        print(f'Total: {total}')
        sys.exit()

    try:
        total += float(user_input)
    except ValueError:
        print('Please enter a valid number')