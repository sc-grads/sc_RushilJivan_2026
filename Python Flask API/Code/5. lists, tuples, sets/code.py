l = ["Bob", "Rolf", "Anne"]
t = ("Bob", "Rolf", "Anne")
s = {"Bob", "Rolf", "Anne"}


print(l[0])
print(t[0])


l[0] = "Smith"

print(l)
print(t)


l.append("Jen")
print(l)


s.add("Jen")
print(s)


s.add("Bob")
print(s)
