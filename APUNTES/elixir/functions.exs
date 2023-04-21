#   Functions to work with lists in Elixir
#   Fer Cortés
#   2023-04-21

defmodule TecList do

  @doc """
  Regular recursion to get the length of a list
  """
  def len(list) do
    if list == [] do
      0
    else
      1 + len(tl(list))
    end # end if
  end # end def len

  @doc """
  Add all the elements of a list
  """
  def add_list([]), do: 0
  def add_list(list), do: hd(list) + add_list(tl(list))

  @doc """
  Using pattern match to deconstruct a list
  """
  def add_list2([]), do: 0
  def add_list2([head | tail]), do: head + add_list2(tail)

  @doc """
  Using tail recursion
  """
  def add_list3(list), do: do_add_list(list, 0)
  defp do_add_list([head | tail], res), do: do_add_list(tail,head + res)

  @doc """
  Return a new list with the square root of all numbers in a list
  """

  def sqrt_list(list), do: do_sqrt_list(list, [])

  defp do_sqrt_list([], res), do: Enum.reverse(res) #enum is a module that has reverse function
  defp do_sqrt_list([head | tail], res), do: do_sqrt_list(tail, [:math.sqrt(head) | res])
  # :math.sqrt is a function that returns the square root of a number

  def merge_sort(list) when length(list) <= 2, do: list

  def merge_sort(list) do
    len = length(list)
    middle = div(len, 2)
   {list1, list2} = Enum.split(list, middle)
   merge_lists(merge_sort(list1), merge_sort(list2))
  end

  @doc """
  Join the elements of two orderd lists into a single ordered list
  """

  def merge_lists(list1, list2), do: do_merge_lists(list1, list2, [])

  def do_merge_lists([], list2, res), do: Enum.reverse(res) ++ list2
  def do_merge_lists(list1, [], res), do: Enum.reverse(res) ++ list1

  def do_merge_lists([head1 | tail1], [head2 | tail2], res) when head1 < head2,
    do: do_merge_lists(tail1, [head2 | tail2], [head1 | res])

  def do_merge_lists([head1 | tail1], [head2 | tail2], res) when head1 >= head2,
    do: do_merge_lists([head1 | tail1], tail2, [head2 | res])

  @doc """
  Invert the pairs of a list of tuples
  """
  def invert_pairs(list), do: do_invert_pairs(list, [])
  defp do_invert_pairs([], res), do: Enum.reverse(res)
  defp do_invert_pairs([{a,b} | tail], res), do: do_invert_pairs(tail, [{b,a} | res])

  @doc """
  A function that converts farenheit to celsius
  """
  def farenheit_to_celsus(f), do: (f-32)*5/9

  @doc """
  A function that returns -1 is the number is negative, 1 if it is positive < 0 and 0 if it is 0
  """
  def sign(n) when n < 0, do: -1
  def sign(n) when n > 0, do: 1
  def sign(n) when n == 0, do: 0


end # end defmodule
