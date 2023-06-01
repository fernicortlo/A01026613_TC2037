defmodule SyntaxHighlighter do
  def highlight_file(input_filename, html_filename) do
    lines = File.read!(input_filename)
             |> String.split("\n")
             |> Enum.map(&String.trim_trailing/1)

    css_classes = %{
      "comment" => "grey",
      "parameter" => "lightblue",
      "bool" => "purple",
      "keyword" => "red",
      "parentheses" => "blue",
      "function" => "hotpink",
      "number" => "orange",
      "operator" => "pink",
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
      {~r/(\b[a-zA-Z_,]\w*\b)(?=\s*(?:,|\)|:))/, "parameter"},
      {~r/\bdef\s+([a-zA-Z_]\w*)\s*\(/, "function"},
      {~r/#(.*)$/, "comment"},
      {~r/\b(def|return|if|while|pass|else|elif|import|from|as|try|except|finally|raise|and|or|is|in|not|for)\b/, "keyword"},
      {~r/\b(True|False)\b/, "bool"},
      {~r/\(/, "parentheses"},
      {~r/\)/, "parentheses"},
      {~r/\b\d+(\.\d+)?\b/, "number"},
      {~r/(\+|-|==|!=|\%|\*|\*)/, "operator"},
      {~r/\b(def|if|while|pass|else|elif|import|from|as|try|except|finally|raise|and|or|is|in|not|for)\s+([a-zA-Z_]\w*)\s*\(/, "function"}

      # {~r/\b[a-zA-Z_]\w*\b/, "variable"} # Processed last to avoid conflicting with function names.
    ]



      # {~r/("[^"]*")/,"string"},
      # {~r/('[^']*')/, "string"}



    processed_lines = Enum.map(lines, fn line ->
      Enum.reduce(tokens, line, fn {regex, class}, acc ->
       Regex. replace(regex, acc, "<span class=\"#{class}\">\\0</span>")
      end)
    end)

    html_str = html_str <> "<code>" <> Enum.join(processed_lines, "\n") <> "</code></pre>\n"
    html_str = html_str <> "</body>\n</html>"
    File.write!(html_filename, html_str)
  end

  def highlight(line) do
    apply_token(line, ~r/#(.*)$/, "comment")
  end

  defp apply_token(line, regex, class) do
    Regex.replace(regex, line, "<span class=\"#{class}\">\\0</span>")
  end

end

SyntaxHighlighter.highlight_file("code.py", "syntax_highlighter.html")


# defmodule SyntaxHighlighter do
#   def highlight_file(input_filename, html_filename) do
#     lines = File.read!(input_filename)
#              |> String.split("\n")
#              |> Enum.map(&String.trim_trailing/1)

#     css_classes = %{
#       "comment" => "grey",
#       "parameter" => "lightblue",
#       "bool" => "purple",
#       "keyword" => "red",
#       "parentheses" => "blue",
#       "function" => "hotpink",
#       "number" => "orange",
#       "operator" => "pink",
#       "variable" => "green"
#     }

#     style_str = Enum.map(css_classes, fn {class, color} ->
#       ".#{class} { color: #{color}; }"
#     end)
#     |> Enum.join("\n")

#     html_str =
#     """
#     <!DOCTYPE html>
#     <html lang="en">
#     <head>
#         <meta charset="UTF-8">
#         <meta http-equiv="X-UA-Compatible" content="IE=edge">
#         <meta name="viewport" content="width=device-width, initial-scale=1.0">
#         <title>Syntax Highlighter</title>
#         <style>
#         #{style_str}
#         </style>
#     </head>
#     <body>
#     <pre>
#     """

# tokens = [
#   {~r/(\b[a-zA-Z_,]\w*\b)(?=\s*(?:,|\)|:))/, "parameter"},
#   {~r/\bdef\s+([a-zA-Z_]\w*)\s*\(/, "function"},
#   {~r/\b(def|return|if|while|pass|else|elif|import|from|as|try|except|finally|raise|and|or|is|in|not|for)\b/, "keyword"},
#   {~r/\b(True|False)\b/, "bool"},
#   {~r/\(/, "parentheses"},
#   {~r/\)/, "parentheses"},
#   {~r/\b\d+(\.\d+)?\b/, "number"},
#   {~r/(\+|-|==|!=|\%|:|=|<|>)/, "operator"},
#   {~r/#(.*)$/, "comment"},
#   {~r/\b[a-zA-Z_]\w*\b/, "variable"}
# ]


#     processed_lines = Enum.map(lines, fn line ->
#       do_tokens(line, tokens)
#     end)

#     html_str = html_str <> Enum.join(processed_lines, "\n") <> "</pre>\n</body>\n</html>"

#     File.write(html_filename, html_str)
#   end

#   defp do_tokens("", _token_list), do: ""

#   defp do_tokens(line, token_list) do
#     case Enum.find(token_list, fn {regex, _class} -> Regex.match?(regex, line) end) do
#       nil ->
#         line
#       {regex, class} ->
#         [matched | _tail] = Regex.run(regex, line)
#         rest_of_line = String.replace(line, matched, "")
#         "<span class=\"#{class}\">#{matched}</span>" <> do_tokens(rest_of_line, token_list)
#     end
#   end
# end

# SyntaxHighlighter.highlight_file("code.py", "syntax_highlighter.html")
