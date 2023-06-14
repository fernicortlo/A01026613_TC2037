# <span style = "color: lightblue;"> Actividad 5.2 Programación paralela y concurrente </span>
**Created by Fernanda Cortés and Arantza Parra**

## <span style = "color: lightblue;"> Time complexity and Speedup analysis </span>

### <span style = "color: lightgreen;"> Time complexity </span>

The is_prime() function has a time complexity of O(sqrt(n)), as to determine whether a number is prime, it tests all possible divisors up to the square root of the number.

The sum_primes and prime_sum functions have a time complexity of O(n sqrt(n)), as it calls is_prime for each number in the range from 1 to n. That is, for each number in the range, it performs an operation that takes time proportional to the square root of the number.

The sum_prime_parallel function also has a time complexity of O(n sqrt(n)), as it performs the same operations as sum_primes and prime_sum. However, because it divides the work into parallel tasks, it can complete these operations more quickly on systems with multiple processor cores.


### <span style = "color: lightgreen;"> Speedup </span>
- The number of cores being used by our tests are 8.

![cores](/TAREAS/elixir_hw/images/cores.png)

The output of the two functions is following:

![output](/TAREAS/elixir_hw/images/output.png)

The output is the same on both functions. Where we can identify the difference between concurrent and parallel programs is with the time efficiency. Time efficiency also translates into better, more efficient programs in terms of resources.

Using the :timer.tc functions returns the time in miliseconds. The line of code calculates the sum of all prime numbers up to 5,000,000, measures the execution time of this operation, and then converts that time from microseconds to seconds.
Running the function three different times we will calculate an average in order to get a more real result and comparison between functions. 

For the first function using concurrent programation, the time obtained is the following:

![1st function time](/TAREAS/elixir_hw/images/time1st.png)

The average of this first function is: 28.69 seconds.

For the second function that uses parallel programing, the time obtained is:

![2nd function time](/TAREAS/elixir_hw//images/time2nd.png)

If we calculate the average we get 7.67 seconds. 

Based on the results, we can see that parallel function is the most efficient in terms fo time consumption. There's a 21.02 second difference between them. 

