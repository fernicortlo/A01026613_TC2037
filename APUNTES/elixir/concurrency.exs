# Using tasks to impllement concurrency
# 09 / 06 / 2023
# Task is a process that runs in the background

defmodule Concur do

  def test(message) do
    # Process.sleep(1000) # Sleep for 1 second
    IO.puts("This is message: #{message}")

  end

  def main() do
    IO.puts("Main Thread Start...")
    # se lanzan las tasks y ahí se quedan
    # Task.start(fn -> test("One") end) # Start a task y ahí la deja,
    #                                 # no espera a que termine no hay manera de saber el resultado
    # Task.start(fn -> test("Two") end)
    # Task.start(fn -> test("Three") end)
    # Process.sleep(1) # Sleep for 1 second to allow task to complete

    pid1 = Task.async(fn -> test("One") end) # task async, se queda esperando a que termine antes de continuar
    pid2 = Task.async(fn -> test("Two") end) # por default espera una variable que no recibe argumentos
    pid3 = Task.async(fn -> test("Three") end)

    Task.await(pid1) # wait for the task to complete
    Task.await(pid2)
    Task.await(pid3)
    pid4 = Task.async(Concur, :test, ["hello"]) # de otro modo le puedes mandar el modulo y la funcion
    Task.await(pid4) # timeout
    IO.puts("Main Thread Finish..")
  end

  # quiero mandar varios threads
  def main2() do
    IO.puts("Main Thread Start...")
    # # podemos hacer una lista con todos los mensajes
    # messages = ["One", "Two", "Three", "Four"]
    # # y hacer un map para lanzar todos los threads
    # # el primer map crea los procesos
    # pids = Enum.map(messages, &Task.async(fn -> test(&1) end)) # &1 es el primer argumento de la funcion
    # # el segundo map lanza los resultados
    # Enum.map(pids, &Task.await(&1)) # &1 es el primer argumento de la funcion

    # con pipes
    # ["One", "Two", "Three", "Four"]
    # |> Enum.map(&Task.async(fn -> test(&1) end))
    # |>IO.inspect()
    # |> Enum.map(&Task.await(&1))
    # |>IO.inspect()
    # IO.puts("Main Thread Finish..")
  end

end
defmodule Parallel do

  def sum_range({start, finish}) do
    Enum.sum(start..finish)
  end

  def make_ranges(start, finish) do
    cores = System.schedulers_online() # gets the number of cores
    range_size = div(finish - start, cores) # makes the ranges of the same size

    # creates the ranges
    Enum.map(0..(cores - 1), fn(i) ->
      {start + (i * range_size), start + ((i + 1) * range_size)}
    end)
  end

  def main(start, finish) do
    make_ranges(start, finish)
    |> Enum.map(&Task.async(fn -> sum_range(&1) end))
    |> Enum.map(&Task.await/1)
    |> Enum.sum()
  end

end

defmodule Parallel do

  def sum_range({start, finish}) do
    Enum.sum(start..finish)
  end

  def make_ranges(start, finish) do
    cores = System.schedulers_online() # gets the number of cores
    range_size = div(finish - start, cores) # makes the ranges of the same size

    # creates the ranges
    ranges = Enum.map(0..(cores - 2), fn(i) ->
      {start + (i * range_size), start + ((i + 1) * range_size) - 1}
    end)

    # handles the end of the last range separately
    last_range = {start + (range_size * (cores - 1)), finish}
    ranges ++ [last_range]
  end

  def main(start, finish) do
    make_ranges(start, finish)
    |> Enum.map(&Task.async(fn -> sum_range(&1) end))
    |> Enum.map(&Task.await/1)
    |> Enum.sum()
  end

end
