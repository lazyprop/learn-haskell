import random
import string

tests = 1
n = 25

print(tests)
for _ in range(tests*2):
    print("".join([random.choice(string.ascii_lowercase) for _ in range(n)]))
