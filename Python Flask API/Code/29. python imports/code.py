from mymodule import divide

print(divide(10, 2))


print(__name__)


import mymodule

print("code.py: ", __name__)



import sys

print(sys.path)



import mymodule

print("code.py: ", __name__)

import sys

print(sys.modules)
