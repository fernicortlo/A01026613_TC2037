#This is a Python program to calculate the factorial of a number

#This is a comment
def greet(name):
    print("Hello, " + name + "!")

def calculate_sum(a, b):
    return a + b

def is_prime(num):
    if num < 2:
        return False
    for i in range(2, int(num ** 0.5) + 1):
        if num % i == 0:
            return False
    return True

x = 10
y = 5
z = calculate_sum(x, y)
if is_prime(z):
    greet("The sum is a prime number.")
else:
    print("The sum is not a prime number.")