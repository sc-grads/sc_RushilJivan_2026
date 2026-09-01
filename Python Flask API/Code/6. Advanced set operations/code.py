friends = {"Bob", "Rolf", "Anne"}
abroad = {"Bob", "Anne"}



local = friends.difference(abroad)
print(local)

print(abroad.difference(friends))  # This returns an empty set


local = {"Rolf"}
abroad = {"Bob", "Anne"}



friends = local.union(abroad)
print(friends)


art = {"Bob", "Jen", "Rolf", "Charlie"}
science = {"Bob", "Jen", "Adam", "Anne"}


both = art.intersection(science)
print(both)
