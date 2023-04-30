#Activity 2.2 - Elixir
# Created by Maria Fernanda Cortés Lozano and Arantza Parra

defmodule Act do
#  @doc """
#     Function that takes a number and a list and returns all possible
#     combinations of the list with the number

#   """

  # def insert_everywhere(num, list) do
  #   insert_everywhere(num, list, [])
  # end

  # defp insert_everywhere(_, [], result), do: result

  # defp insert_everywhere(num, [head | tail], result) do
  #   new_result = result ++ [[num | [head] | tail]] ++ insert_everywhere(num, tail, result)
  #   insert_everywhere(num, tail, new_result)
  # end


  # @doc """
  #   Function that takes a list and groups equal elements in sublists

  # """

  # def pack(list) do
  #   pack(list, [], [])
  # end

  # defp pack([], [], result) do
  #   result
  # end

  # defp pack([], current, result) do
  #   result ++ [current]
  # end

  # defp pack([head | tail], [], result) do
  #   pack(tail, [head], result)
  # end

  # defp pack([head | tail], current, result) do
  #   if head == hd(current) do
  #     pack(tail, [head | current], result)
  #   else
  #     pack(tail, [head], result ++ [current])
  #   end
  # end


  # @doc """
  #   A function that takes a list in ascendent order and a number and
  #   returns the list with the number inserted in the correct position

  # """

  # def insert(list, number) do
  #   insert(list, number, [])
  # end

  # defp insert([], number, result) do
  #   result ++ [number]
  # end

  # defp insert([head | tail], number, result) do
  #   if number < head do
  #     result ++ [number] ++ [head] ++ tail
  #   else
  #     insert(tail, number, result ++ [head])
  #   end
  # end

  @doc """
    Function that rotates a list to the left or to the right by a given number of positions.
    If the number is positive, the rotation is to the left, if it is negative, the rotation is to the right.
  """
  def rotate_left(list, n) when n >= 0 do
    rotate_left(list, n, [])
  end

  def rotate_left([], _, acc) do
    acc
  end

  def rotate_left(list, 0, acc) do
    acc ++ list
  end

  def rotate_left(list, n, acc) do
    [head | tail] = list
    rotate_left(tail, n - 1, acc ++ [head])
  end

  def rotate_right(list, n) when n >= 0 do
    rotate_right(list, n, [])
  end

  def rotate_right([], _, acc) do
    acc
  end

  def rotate_right(list, 0, acc) do
    acc ++ list
  end

  def rotate_right(list, n, acc) do
    [head | tail] = list |> Enum.reverse
    rotate_right(tail |> Enum.reverse, n - 1, [head | acc])
  end

  @doc """
    Function takes a number and returns a list of its prime factors
  """
  def prime_factors(number) do
    prime_factors(number, 2, [])
  end

  defp prime_factors(1, _, factors) do
    factors
  end

  defp prime_factors(number, divisor, factors) when rem(number, divisor) == 0 do
    prime_factors(number div divisor, divisor, [divisor | factors])
  end

  defp prime_factors(number, divisor, factors) do
    prime_factors(number, divisor + 1, factors)
  end


  @doc """
    Function that takes two numbers greater than zero and returns the
    greatest common divisor without using predefines functions

  """

  def gcd(number1, number2) do
    if number1 == number2 do
      number1
    else
      if number1 > number2 do
        gcd(number1 - number2, number2)
      else
        gcd(number1, number2 - number1)
      end
    end
  end

  @doc """
    Function that takes a list and returns a list of tuples with the
    number and the number of times it appears in the list
  """

  def encode(list) do
    encode(list, [], [])
  end

  defp encode([], [], result) do
    result
  end

  defp encode([], current, result) do
    result ++ [current]
  end

  defp encode([head | tail], [], result) do
    encode(tail, [head, 1], result)
  end

  defp encode([head | tail], current, result) do
    if head == hd(current) do
      encode(tail, [head, tl(current) + 1], result)
    else
      encode(tail, [head, 1], result ++ [current])
    end
  end

end
