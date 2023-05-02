#FUNCTION TO WORK WITH TEXT FILES
#also using regular expressions

defmodule FileIO do
  def shift_chars(char, offset) do
    cond do
      #lowercase
      97 <= char and char <= 122 -> Integer.mod(char - 97 + offset, 26) + 97
      #uppercase
      65 <= char and char <= 90 -> Integer.mod(char - 65 + offset, 26) + 65
      #any other character
      true -> char
    end
  end

  def shift_line(line, offset) do
    #using lambda function to be called by Enum.map
    to_string(Enum.map(to_char_list(line), fn char -> shift_chars(char, offset) end))

    #using capture function to be called by Enum.map
    to_string(Enum.map(to_char_list(line), &string_chars(&1, offset)))

    # temporal variables
    temp1 = to_char_list(line)
    temp2 = Enum.map(temp1, &string_chars(&1, offset))
    to_string(temp2)

    #pipe
    line
    |> IO.inspect() #debug
    |> to_char_list()
    |> IO.inspect() #debug
    |> Enum.map(&string_chars(&1, offset))
    |> IO.inspect() #debug
    |> to_string()

  end

  def ceasar(on_filename, out_filename, offset) do
    in_filename
    |> File.stream!()
    |> Enum.map(&shift_line(&1, offset))
    |> IO.inspect() #debug
    |> Enum.join("")

    File.write(out_filename, data)
  end

  # find email addresses in a text file
  def find_emails(filename) do
    File.stream!(filename)
    |> Enum.map(&Regex.scan(~r/[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}/, &1))
    |> Enum.flatten()
    |> Enum.uniq()

  end
end
