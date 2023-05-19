# First functions in Elixir
#Using recursion to find the factorial of a number

# Fer Cortés
# 2023-04-18
#EBNF (Extended Backus-Naur Form)
# <function> ::= def <name> (<parameters>) do <body> end
# <name> ::= <lowercase> | <lowercase> <name>
# <parameters> ::= <parameter> | <parameter> , <parameters>
# <parameter> ::= <lowercase>
# <body> ::= <expression> | <expression> <body>
# <expression> ::= <if> | <if> <expression>
# <if> ::= if <condition> do <body> else <body> end
# <condition> ::= <expression> <comparator> <expression>
# <comparator> ::= == | > | < | >= | <=
# <lowercase> ::= a | b | c | d | e | f | g | h | i | j | k | l | m | n | o | p
# | q | r | s | t | u | v | w | x | y | z


defmodule Recur do
  def fact(n) do
    if n == 0 do
      1
    else
      n * fact(n - 1)
    end # end if
  end # end def

  # using pattern maching
  def fact_pattern(0), do: 1
  def fact_pattern(n), do: n * fact_pattern(n - 1)

  #using 'guards'
  def fact_guard(n) when n == 0, do: 1
  def fact_guard(n), do: n * fact_guard(n - 1)

  def fact_tail(n), do: do_fact_tail(n, 1)

  # Define a private function that can only be called from within this module
  defp do_fact_tail(n, r) do
    if n == 0, do: r, else: do_fact_tail(n - 1, r * n)
  end

  def diploma(_grade) when grade >=90, do: :distinction
  def diploma(_grade) when grade >=70, do: :pass
  def diploma(_grade), do: :fail

  def fibo(n) when n<0, do: :error
  def fibo(0), do: 0
  def fibo(1), do: 1
  def fibo(n), do: fibo(n-1) + fibo(n-2)

  #using tail recursion
  def fibo_tail(n) when n<0, do: {:error, :negative}
  defp fibo_tail(0) , do: {:ok, 0}
  defp fibo_tail(1) , do: {:ok, 1}
  def fibo_tail(n), do: do_fibo_tail(0, 1, n-1)

  defp do_fibo_tail(a, b, 0), do: {:ok, b}
  defp do_fibo_tail(a, b, n), do: do_fibo_tail(b, a+b, n-1)

end # end defmodule
