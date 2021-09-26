import random
import string

tests = 10
n = 1000

print(tests)
for _ in range(tests*2):
    print("".join([random.choice(string.ascii_lowercase) for _ in range(n)]))
