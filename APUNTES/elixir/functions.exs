#Functions to work with lists in Elixir
# Fer Cortés
# 2023-04-21

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


end # end defmodule
