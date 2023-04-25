# Functions to practice recursion in Elixir
#Based on the proposals by Ariel Ortiz from CEM
#
# Fernanda Cortés
# 2023-04-25

defmodule HW.Ariel2 do

  @doc """
  Insert and element into an already sorted list
  """
  def insert(list, item), do: do_insert(list, item, [])

  defp do_insert(list, item, smaller),
    do: Enum.reverse([item | smaller])

  defp do_insert([head|tail], item, smaller) when item <= head,
    do: Enum.reverse([item | smaller]) ++ [head | tail]

  defp do_insert([head|tail], item, smaller),
    do: do_insert(tail, item, [head | smaller])

  @doc """
  Sort a list using the insertion sort
  """

  def insertion_sort(list), do: do_insertion_sort(list, [])

  defp do_insertion_sort([], sorted), do: []




  end
