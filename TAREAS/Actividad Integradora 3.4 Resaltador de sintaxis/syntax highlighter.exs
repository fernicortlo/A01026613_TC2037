# Created by and Arantza Parra Martínez and María Fernanda Cortés Lozano
# This program creates a basic syntax highlighter for the python language using regular expressions;
# it takes a python file as input and creates a new html file and css file with the syntax highlighted.

defmodule SyntaxHighlighter do
  # Module attributes to store the regular expressions and CSS classes for different token types
  @keywords ~r/\b(and|as|assert|async|await|break|class|continue|def|del|elif|else|except|False|finally|for|from|global|if|import|in|is|lambda|None|nonlocal|not|or|pass|raise|return|True|try|while|with|yield)\b/
  @operators ~r/[+\-*/%=<>!&|^]/
  @literals ~r/\b(\d+(\.\d*)?|\.\d+)([eE][+-]?\d+)?\b/
  @strings ~r/(\'\'\'|\"\"\")(.|\n)*?\1|(\"|\\")(\?.)*?\2/

  # Function to highlight tokens in a Python code file and write HTML and CSS files
  def highlight_file(input_filename, html_filename, css_filename) do
    # Read input Python code file line by line
    input_file = File.open!(input_filename, [:read])
    lines = Enum.map(File.stream!(input_file), &String.trim(&1))

    # Initialize output HTML and CSS strings
    html_str = "<html>\n<head>\n<style>\n"
    css_str = ""

    # Loop over each line of input code
# This code takes in a list of `lines` and applies syntax highlighting to them

Enum.each(lines, fn line ->
  remaining_str = line  # Set the line as the initial string to work with

  for {token_type, regex, css_class} <- [   # Loop over each token type along with its regular expression and CSS class
    {:keyword, @keywords, "keyword"},
    {:operator, @operators, "operator"},
    {:literal, @literals, "literal"},
    {:string, @strings, "string"}
  ] do
    # Inner loop to replace all matches of the current token type in the `remaining_str`
    while true do
      case Regex.run(regex, remaining_str) do   # Search for the next match of regular expression in the remaining string
        [{token, _} | _] ->   # If there's a match,
          replacement = "<span class=\"#{css_class}\">#{token}</span>"   # Construct a new HTML string for the matched substring
          remaining_str = String.replace_first(remaining_str, regex, replacement)   # Replace the matched substring with the new HTML string
        [] ->
          break   # Exit inner loop when no more matches are found
      end
    end
  end
end)

      # If a token was matched on this line, add its CSS class to output CSS string
      if matched_token do
        css_str = "#{css_str}.#{matched_token} {\n color: red;\n}\n"
      end

      # Add the highlighted line to the output HTML string
      html_str = "#{html_str}\n<span>#{remaining_str}</span><br>"
    end)

    # Close HTML and CSS tags in output strings
    html_str = "#{html_str}\n</body>\n</html>"
    css_str = "#{css_str}\n</style>\n</head>"

    # Write output HTML and CSS strings to files
    File.write!(html_filename, html_str)
    File.write!(css_filename, css_str)
  end
end
SyntaxHighlighter.highlight_file("code.py", "syntax_highlighter.html", "syntax_highlighter.css")
