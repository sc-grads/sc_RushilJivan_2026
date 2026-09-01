number = 7
play = input("Would you like to play? (Y/n) ")

while play != "n":
    user_number = int(input("Guess our number: "))
    if user_number == number:
        print("You guessed correctly!")
    elif abs(number - user_number) == 1:
        print("You were off by 1.")
    else:
        print("Sorry, it's wrong!")

    play = input("Would you like to play? (Y/n) ")



while True:
    play = input("Would you like to play? (Y/n) ")

    if play == "n":
        break  
    user_number = int(input("Guess our number: "))
    if user_number == number:
        print("You guessed correctly!")
    elif abs(number - user_number) == 1:
        print("You were off by 1.")
    else:
        print("Sorry, it's wrong!")




# For loop 

friends = ["Rolf", "Jen", "Bob", "Anne"]
for friend in friends:
    print(f"{friend} is my friend.")




grades = [35, 67, 98, 100, 100]
total = 0
amount = len(grades)

for grade in grades:
    total += grade

print(total / amount)





grades = [35, 67, 98, 100, 100]
total = sum(grades)
amount = len(grades)

print(total / amount)

