# First functions in Elixir
#Using recursion to find the factorial of a number

# Fer Cortés
# 2023-04-18

defmodule Factorial do
  def fact(0), do: 1
  def fact(n), do: n * fact(n - 1)
end


def fact(n):
    if n == 0:
        return 1
    else:
        return n * fact(n - 1)

print(fact(5))
