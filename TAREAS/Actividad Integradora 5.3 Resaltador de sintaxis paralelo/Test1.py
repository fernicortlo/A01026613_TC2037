# Sample Python code to test syntax highlighter
# Author: Arantza Parra Martínez and Maria Fernanda Cortes Lozano
import math
import random

# Define constants
MAX = 100
MIN = 0


def calculate_average(numbers):
    #Calculate the average of a list of numbers
    if not numbers:
        return None
    return sum(numbers) / len(numbers)

def roll_dice():
    #Simulate rolling a six-sided dice
    return random.randint(1, 6)

def simulate_dice_rolls(n):
    #Simulate n dice rolls and return their average
    rolls = [roll_dice() for _ in range(n)]
    return calculate_average(rolls)

# Test list_primes function
for i in range(1, 11):
    primes = ", ".join(str(x) for x in list_primes(i))
   


# Test calculate_average function
for i in range(1, 11):
    average = calculate_average(list(range(1, i + 1)))
   

# Test roll_dice and simulate_dice_rolls function
for i in range(1, 11):
    dice_roll = roll_dice()
    dice_average = simulate_dice_rolls(i)
   
def check_square(number):
    #Check if a number is a perfect square
    return True if int(math.sqrt(number))**2 == number else False

def shuffle_list(lst):
    #Shuffle a given list and return the shuffled list
    random.shuffle(lst)
    return lst

def calculate_variance(numbers):
    #Calculate the variance of a list of numbers
    if not numbers:
        return None
    mean = sum(numbers) / len(numbers)
    return sum((x - mean) ** 2 for x in numbers) / len(numbers)

def generate_random_password(n):
    #Generate a random password of length n
    characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    password = ""
    for i in range(n):
        password += random.choice(characters)
    return password

def count_vowels(word):
    #Count the number of vowels in a word
    vowels = "aeiouAEIOU"
    count = 0
    for letter in word:
        if letter in vowels:
            count += 1
    return count

def reverse_list(lst):
    #Reverse a given list and return the reversed list
    return lst[::-1]

def calculate_factorial(num):
    #Calculate the factorial of a non-negative integer
    if num < 0:
        return None
    elif num == 0:
        return 1
    else:
        return num * calculate_factorial(num - 1)

def capitalize_first_letter(word):
    #Capitalize the first letter of a given word
    return word.capitalize()
# This is a comment
def greet(name):
    print("Hello, " + name)

def calculate_sum(numbers):
    """
    This function calculates the sum of a given list of numbers.
    """
    total = 0
    for num in numbers:
        total += num
    return total

def is_even(num):
    if num % 2 == 0:
        return True
    else:
        return False

def fibonacci(n):
    #This function returns the n-th number in the Fibonacci sequence.
    if n <= 0:
        return None
    elif n == 1:
        return 0
    elif n == 2:
        return 1
    else:
        return fibonacci(n-1) + fibonacci(n-2)

def main():
    # This is another comment
    name = input("Enter your name: ")
    greet(name)
    
    numbers = [1, 2, 3, 4, 5]
    print("The sum of the numbers is:", calculate_sum(numbers))
    
    if is_even(6):
        print("6 is even!")
    else:
        print("6 is odd...")
        
    for i in range(1, 11):
        print(fibonacci(i), end=" ")
