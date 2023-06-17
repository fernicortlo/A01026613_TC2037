#Sample Python code to test syntax highlighter
# Arantza Parra Martínez and Maria Fernanda Cortes Lozano

# Define a function to calculate the sum of a list of numbers
def find_sum(num_list):
    return sum(num_list)

# Define a function to calculate the average of a list of numbers
def find_avg(num_list):
    return sum(num_list) / len(num_list)

# Define a function to convert Celsius to Fahrenheit
def celsius_to_fahren(temp_c):
    return temp_c * 9/5 + 32

# Define a function to convert Fahrenheit to Celsius
def fahren_to_celsius(temp_f):
    return (temp_f - 32) * 5/9

# Define a function to calculate the area of a triangle
def find_tri_area(base, height):
    return 0.5 * base * height

# Define a function to calculate the perimeter of a rectangle
def find_rect_perimeter(width, height):
    return 2 * (width + height)

# Define a function to print out a multiplication table
def mult_table(size):
    for i in range(1, size+1):
        for j in range(1, size+1):
            print(i*j, end="\t")
        print()

# Define a function to check if a number is prime
def is_prime(num):
    if num <= 1:
        return False
    elif num == 2:
        return True
    else:
        for i in range(2, int(num ** 0.5) + 1):
            if num % i == 0:
                return False
        return True

# Main program
print("Welcome to the Function Funhouse!")
print()

# Create a list of numbers and find the sum, average, and median
nums = [12, 7, 19, 8, 15, 21, 4]
total = find_sum(nums)
average = find_avg(nums)
median = find_median(nums)

print()

# Convert temperatures from Celsius to Fahrenheit and vice versa
temp_c = 27.5
temp_f = celsius_to_fahren(temp_c)
print()

temp_f = 80.6
temp_c = fahren_to_celsius(temp_f)
print()

# Calculate the area of a triangle and the perimeter of a rectangle
base = 8
height = 5.2
tri_area = find_tri_area(base, height)
print()

width = 4.7
height = 9.3
rect_perimeter = find_rect_perimeter(width, height)
print()

# Print out a multiplication table
print("Here is a multiplication table!")
mult_table(10)
print()

# Check if numbers are prime
for num in [3, 6, 11, 15, 23]:
    if is_prime(num):
        print("is prime.")
    else:
        print( "is NOT prime.")
print()

