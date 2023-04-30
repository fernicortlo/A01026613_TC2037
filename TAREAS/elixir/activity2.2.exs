#Activity 2.2 - Elixir
# Created by Maria Fernanda Cortés Lozano and Arantza Parra

defmodule Act2 do

  @doc """
    Function that takes a number and a list and returns all possible
    combinations of the list with the number

  """

  def insert-everywhere(number, list) do
    insert-everywhere(number, list, [])
  end

  defp insert-everywhere(number, [], result) do
    result
  end

  defp insert-everywhere(number, [head | tail], result) do
    insert-everywhere(number, tail, [result ++ [number | head]])
  end

  @doc """
    Function that takes a list and groups equal elements in sublists

  """

  def pack(list) do
    pack(list, [], [])
  end

  defp pack([], [], result) do
    result
  end

  defp pack([], current, result) do
    result ++ [current]
  end

  defp pack([head | tail], [], result) do
    pack(tail, [head], result)
  end

  defp pack([head | tail], current, result) do
    if head == hd(current) do
      pack(tail, [head | current], result)
    else
      pack(tail, [head], result ++ [current])
    end
  end


  @doc """
    A function that takes a list in ascendent order and a number and
    returns the list with the number inserted in the correct position

  """

  def insert(list, number) do
    insert(list, number, [])
  end

  defp insert([], number, result) do
    result ++ [number]
  end

  defp insert([head | tail], number, result) do
    if number < head do
      result ++ [number] ++ [head] ++ tail
    else
      insert(tail, number, result ++ [head])
    end
  end

  @doc """
    Function that rotates a list to the left or to the right by a given number of positions.
    If the number is positive, the rotation is to the left, if it is negative, the rotation is to the right.
  """

  def rotate-left(list, number) do
    rotate-left(list, number, [])
  end

  defp rotate-left(list, 0, result) do
    result ++ list
  end

  defp rotate-left(list, number, result) do
    if number > 0 do
      rotate-left(tl(list) ++ [hd(list)], number - 1, result)
    else
      rotate-left([last(list)] ++ init(list), number + 1, result)
    end
  end

  @doc """
    Function takes a number and returns a list of its prime factors
  """

  def prime-factors (number) do
    prime-factors(number, 2, [])
  end

end
