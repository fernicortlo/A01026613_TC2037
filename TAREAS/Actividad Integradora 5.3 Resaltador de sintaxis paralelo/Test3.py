#Sample Python code to test syntax highlighter
# Arantza Parra Martínez and Maria Fernanda Cortes Lozano

# Define a function to calculate the sum of a list of numbers
def find_sum(num_list):
    return sum(num_list)

# Define a function to calculate the average of a list of numbers
def find_avg(num_list):
    return sum(num_list) / len(num_list)

# Define a function to find the median of a list of numbers
def find_median(num_list):
    sorted_list = sorted(num_list)
    mid = len(sorted_list) // 2
    if len(sorted_list) % 2 == 0:
        return (sorted_list[mid-1] + sorted_list[mid]) / 2
    else:
        return sorted_list[mid]

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

# Define a function to print out the lyrics to "The Ants Go Marching"
def ants_go_marching():
    for verse in range(1, 11):
        print("The ants go marching", verse, "by", verse)
        print("Hurrah! Hurrah!")
        print("The ants go marching", verse, "by", verse)
        print("Hurrah! Hurrah!")
        print("The ants go marching", verse, "by", verse)
        print("The little one stops to suck his thumb")
        print("And they all go marching down...")
    print("The ants go marching down...to the ground...to get out of the rain.")
    
# Main program
print("Welcome to the Function Funhouse!")
print()

# Create a list of numbers and find the sum, average, and median
nums = [12, 7, 19, 8, 15, 21, 4]
total = find_sum(nums)
average = find_avg(nums)
median = find_median(nums)

print(f"The sum of the numbers is {total}.")
print(f"The average of the numbers is {average:.2f}.")
print(f"The median of the numbers is {median:.2f}.")
print()

# Convert temperatures from Celsius to Fahrenheit and vice versa
temp_c = 27.5
temp_f = celsius_to_fahren(temp_c)
print(f"{temp_c:.1f} degrees Celsius is equal to {temp_f:.1f} degrees Fahrenheit.")

temp_f = 80.6
temp_c = fahren_to_celsius(temp_f)
print(f"{temp_f:.1f} degrees Fahrenheit is equal to {temp_c:.1f} degrees Celsius.")
print()

# Calculate the area of a triangle and the perimeter of a rectangle
base = 8
height = 5.2
tri_area = find_tri_area(base, height)
print(f"The area of the triangle is {tri_area:.2f} square units.")

width = 4.7
height = 9.3
rect_perimeter = find_rect_perimeter(width, height)
print(f"The perimeter of the rectangle is {rect_perimeter:.2f} units.")
print()

# Print out a multiplication table
print("Here is a multiplication table!")
mult_table(10)
print()

# Check if numbers are prime
for num in [3, 6, 11, 15, 23]:
    if is_prime(num):
        print(num, "is prime.")
    else:
        print(num, "is NOT prime.")
print()

# Sing "The Ants Go Marching"
print("Let's sing 'The Ants Go Marching'!")
ants_go_marching()

