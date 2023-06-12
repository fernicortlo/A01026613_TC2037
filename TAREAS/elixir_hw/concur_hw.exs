defmodule Hw.Primes do
  def is_prime(2), do: true

  def is_prime(n) when n < 2 do
    false
  end

  def is_prime(n) do
    limit = :math.sqrt(n) |> Float.ceil(0) |> round
    Enum.all?(2..limit, fn i -> rem(n, i) != 0 end)
  end

  def sum_primes(n) do
    Enum.filter(1..n, &is_prime/1) |> Enum.sum()
  end

  def prime_sum(lower, upper) do
    Enum.filter(lower..upper, &is_prime/1)
    |> Enum.sum()
  end

  def make_ranges(start, finish) do
    cores = System.schedulers_online()
    total_range = finish - start + 1
    range_size = div(total_range, cores)
    remainder = rem(total_range, cores)

    ranges = for i <- 0..(cores - 1) do
      lower = start + (i * range_size) + min(i, remainder)
      upper = lower + range_size - 1 + if i < remainder, do: 1, else: 0
      {lower, upper}
    end

    List.update_at(ranges, -1, fn last -> {elem(last, 0), finish} end)
  end

  def sum_primes_parallel(from, to) do
    ranges = make_ranges(from, to)

    tasks =
      for {lower, upper} <- ranges do
        Task.async(fn -> prime_sum(lower, upper) end)
      end

    tasks
    |> Enum.map(&Task.await/1)
    |> Enum.sum()
  end


end

IO.inspect(Hw.Primes.sum_primes(5_000_000))
IO.inspect(Hw.Primes.sum_primes_parallel(1, 5_000_000))
