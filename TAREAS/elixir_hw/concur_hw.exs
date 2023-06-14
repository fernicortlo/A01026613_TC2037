defmodule Hw.Primes do

  # Function that returns true if a number is prime
  # and false otherwise.
  def is_prime(2), do: true

  def is_prime(n) when n < 2 do
    false
  end
  def is_prime(n) do
    limit = :math.sqrt(n) |> Float.ceil(0) |> round
    Enum.all?(2..limit, fn i -> rem(n, i) != 0 end)
  end

  # Function that returns the sum of all primes up to n.
  def sum_primes(n) do
    Enum.filter(1..n, &is_prime/1) |> Enum.sum()
  end

  # This function should return the sum of all primes between from and to.
  def prime_sum(lower, upper) do
    Enum.filter(lower..upper, &is_prime/1)
    |> Enum.sum()
  end

  # This function makes the ranges used for parallelization.
  def make_ranges(start, finish) do
    cores = System.schedulers_online() # Number of cores obtained from the system.
    total_range = finish - start + 1 # Total range of numbers to be summed.
    range_size = div(total_range, cores) # Size of each range.
    remainder = rem(total_range, cores) # Remainder of the division.

    ranges = for i <- 0..(cores - 1) do # Create the ranges.
      lower = start + (i * range_size) + min(i, remainder)  # Add the remainder to the first ranges.
      upper = lower + range_size - 1 + if i < remainder, do: 1, else: 0 # Add 1 to the first ranges.
      {lower, upper} # Return the range.
    end

    List.update_at(ranges, -1, fn last -> {elem(last, 0), finish} end) # Update the last range.
  end

  # This function should return the sum of all primes between from and to in parallel.
  def sum_prime_parallel(from, to) do
    ranges = make_ranges(from, to)

    tasks =
      for {lower, upper} <- ranges do # Iterate over the ranges.
        Task.async(fn -> prime_sum(lower, upper) end) # Create a task for each range.
      end

    tasks
    |> Enum.map(&Task.await/1) # Await the tasks.
    |> Enum.sum() # Sum the results of each task.
  end


end

IO.inspect(Hw.Primes.sum_primes(5_000_000)) # runs the concurrent version
IO.inspect(Hw.Primes.sum_primes_parallel(1, 5_000_000)) # runs the parallel version
