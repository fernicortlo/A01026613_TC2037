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

# Define a function to find the index of the maximum number in a list
def find_max_index(lst):
    return lst.index(max(lst))

# Define a function to find the minimum number in a list
def find_min(lst):
    return min(lst)

# Define a function to sort a list in descending order
def sort_desc(lst):
    return sorted(lst, reverse=True)

# Define a function to determine if a string is a palindrome
def is_palindrome(word):
    return word == word[::-1]

# Define a function to check if a given year is a leap year
def is_leap_year(year):
    if (year % 4 == 0 and year % 100 != 0) or year % 400 == 0:
        return True
    else:
        return False

# Define a function to print out the lyrics to "99 Bottles of Beer"
def ninety_nine_bottles():
    for i in range(99, 0, -1):
        if i == 1:
            print("1 bottle of beer on the wall,\n1 bottle of beer!")
            print("Take one down, pass it around,\nNo more bottles of beer on the wall!")
        else:
            print(f"{i} bottles of beer on the wall,\n{i} bottles of beer!")
            print(f"Take one down, pass it around,\n{i-1} bottles of beer on the wall!")

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
 
# Calculate and display the circle area
circle_area = calc_circle_area(radius)
print(f"The area of your circle is {circle_area:.2f}.")
print()

# Get user input for rectangular prism dimensions
print("Please enter the width, height, and depth of your rectangular prism:")
width = float(input("Width: "))
height = float(input("Height: "))
depth = float(input("Depth: "))

# Calculate and display the rectangular prism volume
prism_volume = calc_prism_volume(width, height, depth)
print(f"The volume of your rectangular prism is {prism_volume:.2f}.")
print()

# Get user input for cube side length
side_length = float(input("Please enter the length of a side of your cube: "))

# Calculate and display the cube surface area
cube_surface_area = calc_cube_surface_area(side_length)
print(f"The surface area of your cube is {cube_surface_area:.2f}.")
print()

# Get user input for triangle side lengths
print("Please enter the lengths of your triangle's three sides:")
side1 = float(input("Side 1: "))
side2 = float(input("Side 2: "))
side3 = float(input("Side 3: "))

# Calculate and display the triangle perimeter
tri_perimeter = calc_tri_perimeter(side1, side2, side3)
print(f"The perimeter of your triangle is {tri_perimeter:.2f}.")
print()

# Create a list of numbers and find the maximum index, minimum value, and descending sort
nums = [5, 12, 8, 21, 4]
max_index = find_max_index(nums)
min_val = find_min(nums)
sorted_nums = sort_desc(nums)

print(f"The maximum number in this list is at index {max_index}.")
print(f"The minimum number in this list is {min_val}.")
print(f"The list sorted in descending order is {sorted_nums}.")
print()

# Check if a string is a palindrome
word = "racecar"
if is_palindrome(word):
    print(f"{word} is a palindrome!")
else:
    print(f"{word} is NOT a palindrome.")
print()

# Check if a year is a leap year
year = 2020
if is_leap_year(year):
    print(f"{year} is a leap year!")
else:
    print(f"{year} is NOT a leap year.")
print()

# Print out the lyrics to "99 Bottles of Beer"
print("Let's sing '99 Bottles of Beer'!")
ninety_nine_bottles()
print()

# Calculate the first 10 Fibonacci numbers
print("The first 10 Fibonacci numbers are:")
for i in range(10):
    print(fib(i), end=' ')
print()
