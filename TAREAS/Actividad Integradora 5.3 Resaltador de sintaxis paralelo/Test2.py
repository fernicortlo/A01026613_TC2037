#Sample Python code to test syntax highlighter
# Arantza Parra Martínez and Maria Fernanda Cortes Lozano

# Define a function to calculate the area of a rectangle
def calc_rect_area(width, height):
    return width * height

# Define a function to calculate the area of a circle
def calc_circle_area(radius):
    pi = 3.14159
    return pi * radius ** 2

# Define a function to calculate the volume of a rectangular prism
def calc_prism_volume(width, height, depth):
    return width * height * depth

# Define a function to calculate the surface area of a cube
def calc_cube_surface_area(side_length):
    return 6 * side_length ** 2

# Define a function to calculate the perimeter of a triangle
def calc_tri_perimeter(side1, side2, side3):
    return side1 + side2 + side3

# Define a function to find the minimum number in a list
def find_min(lst):
    return min(lst)

# Define a function to calculate the nth Fibonacci number
def fib(n):
    if n <= 1:
        return n
    else:
        return (fib(n-1) + fib(n-2))

# Main program
print("Welcome to the Function Fun app!")
print()

# Get user input for rectangle dimensions
print("Please enter the width and height of your rectangle:")
width = float(input("Width: "))
height = float(input("Height: "))

# Calculate and display the rectangle area
rect_area = calc_rect_area(width, height)
print(f"The area of your rectangle is {rect_area:.2f}.")
print()

# Get user input for circle radius
radius = float(input("Please enter the radius of your circle: "))
 
# Calculate the circle area
circle_area = calc_circle_area(radius)
print()

# Get user input for rectangular prism dimensions
print("Please enter the width, height, and depth of your rectangular prism:")
width = float(input("Width: "))
height = float(input("Height: "))
depth = float(input("Depth: "))


# Get user input for cube side length
side_length = float(input("Please enter the length of a side of your cube: "))


# Get user input for triangle side lengths
print("Please enter the lengths of your triangle's three sides:")
side1 = float(input("Side 1: "))
side2 = float(input("Side 2: "))
side3 = float(input("Side 3: "))

# Create a list of numbers and find the maximum index, minimum value, and descending sort
nums = [5, 12, 8, 21, 4]
max_index = find_max_index(nums)
min_val = find_min(nums)
sorted_nums = sort_desc(nums)

print()

# Check if a string is a palindrome
word = "racecar"
if is_palindrome(word):
    print(" is a palindrome!")
else:
    print(" is NOT a palindrome.")
print()

# Check if a year is a leap year
year = 2020
if is_leap_year(year):
    print("is a leap year!")
else:
    print(" is NOT a leap year.")
print()

# Calculate the first 10 Fibonacci numbers
print("The first 10 Fibonacci numbers are:")
for i in range(10):
    print(fib(i), end=' ')
print()
