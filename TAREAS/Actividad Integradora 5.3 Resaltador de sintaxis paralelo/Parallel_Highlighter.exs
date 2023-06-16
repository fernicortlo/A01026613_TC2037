# Code created by Arantza Parra Martínez and Maria Fernanda Cortes Lozano
# Program that creates a basic Syntax Highlighter for Python codes using regex and HTML

# Defines a module called SyntaxHighlighter
defmodule SyntaxHighlighter do
  # Public function that takes an filename that will examine and an filename for the  generated HTML file
  def highlight_file(input_filename, html_filename) do
    # Read all lines from the input file and turns into a list
    lines = File.read!(input_filename)
    # Split the lines into a list of strings
             |> String.split("\n")
    # Remove trailing whitespace from each line
             |> Enum.map(&String.trim_trailing/1)
  # Public function that takes an filename that will examine and an filename for the  generated HTML file
    css_classes = %{
      "comment" => "grey",
      "parameter" =>  "rgb(28, 176, 225)",
      "bool" => "purple",
      "keyword" => "red",
      "fun_keyword" => "red",
      "parentheses" => "blue",
      "function" => "hotpink",
      "number" => "orange",
      "operator" => "pink",
      "string" => "green",
         }

    # Define a string that uses map to generate CSS classes and colors
    style_str = Enum.map(css_classes, fn {class, color} ->
      ".#{class} { color: #{color}; }"
    end)
    |> Enum.join("\n")

    # Define the structure that the html file needs to have as well as the content of the file
    html_str =
    """
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Syntax Highlighter</title>
        <style>
        #{style_str}
        </style>
    </head>
    <body>
    <pre>
    """
 # Define a list where the regex pattern is matched to a css class previously defined
          tokens = [
            {~r/#(.*)$/, "comment"},
            {~r/\b(def|for|if)\b/, "fun_keyword"},
            {~r/\b([a-zA-Z_]\w*)\s*(?=\s*\()/, "function"},
            {~r/("[^"]*")|('[^']*')/, "string"},
            {~r/\b(return|if|while|pass|else|elif|import|from|as|try|except|finally|raise|and|or|is|in|not)\b/, "keyword"},
            {~r/\(/, "parentheses"},
            {~r/(\b[a-zA-Z_,]\w*\b)(?=\s*(?:,|\)|:|\s))/, "parameter"},
            {~r/\b\d+(\.\d+)?\b/, "number"},
            {~r/\)/, "parentheses"},
            {~r/\b(True|False)\b/, "bool"},
          ]

    # Apply the functuon do_tokens to each line of code
    processed_lines = Enum.map(lines, fn line ->
    do_tokens(line, tokens)
    end)

    # Concatenate the processed lines into a single string and add the closing tags for the html file
    html_str = html_str <> Enum.join(processed_lines, "\n") <> "</pre>\n</body>\n</html>"

    # Uses the function write to create the html file
    File.write(html_filename, html_str)
    end

    defp do_tokens(line, token_list) do
      case Enum.find(token_list, fn {regex, _class} -> Regex.match?(regex, line) end) do
        nil ->
          line

        {regex, class} ->
          [head | tail] = Regex.split(regex, line, include_captures: true)
          head <> "<span class=\"#{class}\">#{List.first(tail)}</span>" <> do_tokens(List.to_string(tail -- [List.first(tail)]), token_list)
      end
    end
    # List of input and output files
  @file_pairs [
    {"Test1.py", "highlighter.html"},
    {"Test2.py", "highlighter_2.html"},
    {"Test3.py", "highlighter_3.html"},

  ]
  def ranges(files) do
    cores = max(System.schedulers_online(), 1)
    chunk_size = max(div(Enum.count(files), cores), 1)
    Enum.chunk_every(files, chunk_size)
  end

  def print_core_info do
    IO.puts("Number of cores available: #{System.schedulers_online()}")
  end

  def highlight_files(input_files \\@file_pairs) do
    groups = ranges(input_files)

    tasks = Enum.map(groups, fn group ->
      Task.async(fn ->
        Enum.each(group, fn {input, output} -> highlight_file(input, output) end)
      end)
    end)

    tasks
    |> Enum.map(&Task.await/1)
  end
end
SyntaxHighlighter.highlight_files()
