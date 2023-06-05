# Created by and Arantza Parra Martínez and María Fernanda Cortés Lozano
# This program creates a basic syntax highlighter for the python language using regular expressions;
# it takes a python file as input and creates a new html file with the syntax highlighted.

defmodule SyntaxHighlighter do
  def highlight_file(input_filename, html_filename) do
    lines = File.read!(input_filename)
             |> String.split("\n")
             |> Enum.map(&String.trim_trailing/1)

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

    style_str = Enum.map(css_classes, fn {class, color} ->
      ".#{class} { color: #{color}; }"
    end)
    |> Enum.join("\n")

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



    processed_lines = Enum.map(lines, fn line ->
    do_tokens(line, tokens)
    end)

    html_str = html_str <> Enum.join(processed_lines, "\n") <> "</pre>\n</body>\n</html>"

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
end


SyntaxHighlighter.highlight_file("Test1.py", "highlighter.html")
SyntaxHighlighter.highlight_file("Test2.py", "highlighter_2.html")
SyntaxHighlighter.highlight_file("Test3.py", "highlighter_3.html")
