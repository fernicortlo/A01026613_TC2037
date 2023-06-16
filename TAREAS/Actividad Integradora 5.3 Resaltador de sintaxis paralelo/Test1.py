# Sample Python code to test syntax highlighter
# Author: Arantza Parra Martínez and Maria Fernanda Cortes Lozano
import math
import random

# Define constants
MAX = 100
MIN = 0

def check_prime(number):
    """Check if a number is a prime number"""
    if number < 2:
        return False
    for element in range(2, math.isqrt(number) + 1):
        if number % element == 0:
            return False
    return True

def list_primes(n):
    """List the first n prime numbers"""
    primes = []
    i = 2
    while len(primes) < n:
        if check_prime(i):
            primes.append(i)
        i += 1
    return primes

def calculate_average(numbers):
    """Calculate the average of a list of numbers"""
    if not numbers:
        return None
    return sum(numbers) / len(numbers)

def roll_dice():
    """Simulate rolling a six-sided dice"""
    return random.randint(1, 6)

def simulate_dice_rolls(n):
    """Simulate n dice rolls and return their average"""
    rolls = [roll_dice() for _ in range(n)]
    return calculate_average(rolls)

# Test check_prime function
for num in range(1, 101):
    print(f"{num} is a prime number: {check_prime(num)}")

# Test list_primes function
for i in range(1, 101):
    print(f"The first {i} prime numbers are: {list_primes(i)}")

# Test calculate_average function
for i in range(1, 101):
    print(f"The average of the first {i} numbers is {calculate_average(list(range(1, i + 1)))}")

# Test roll_dice and simulate_dice_rolls function
for i in range(1, 101):
    print(f"Rolling a dice: {roll_dice()}")
    print(f"Simulating {i} dice rolls: {simulate_dice_rolls(i)}")

# Adding new lines to the code
for i in range(1, 101):
    print(f"Square of {i}: {i**2}")
    print(f"Cube of {i}: {i**3}")
    print(f"Random number between 1 and {i}: {random.randint(1, i)}")
    print(f"Is {i} a prime number? {check_prime(i)}")
    print(f"First {i} prime numbers: {list_primes(i)}")
    print(f"Average of first {i} numbers: {calculate_average(list(range(1, i + 1)))}")

def check_square(number):
    """Check if a number is a perfect square"""
    return True if int(math.sqrt(number))**2 == number else False

def shuffle_list(lst):
    """Shuffle a given list and return the shuffled list"""
    random.shuffle(lst)
    return lst

def calculate_variance(numbers):
    """Calculate the variance of a list of numbers"""
    if not numbers:
        return None
    mean = sum(numbers) / len(numbers)
    return sum((x - mean) ** 2 for x in numbers) / len(numbers)

def generate_random_password(n):
    """Generate a random password of length n"""
    characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890!@#$%^&*()_+-="
    password = ""
    for i in range(n):
        password += random.choice(characters)
    return password

def count_vowels(word):
    """Count the number of vowels in a word"""
    vowels = "aeiouAEIOU"
    count = 0
    for letter in word:
        if letter in vowels:
            count += 1
    return count

def reverse_list(lst):
    """Reverse a given list and return the reversed list"""
    return lst[::-1]

def calculate_factorial(num):
    """Calculate the factorial of a non-negative integer"""
    if num < 0:
        return None
    elif num == 0:
        return 1
    else:
        return num * calculate_factorial(num - 1)

def capitalize_first_letter(word):
    """Capitalize the first letter of a given word"""
    return word.capitalize()
