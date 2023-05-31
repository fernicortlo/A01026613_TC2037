defmodule SyntaxHighlighter do
  # Module attributes to store the regular expressions and CSS classes for different token types
  @keywords ~r/\b(and|as|assert|async|await|break|class|continue|def|del|elif|else|except|False|finally|for|from|global|if|import|in|is|lambda|None|nonlocal|not|or|pass|raise|return|True|try|while|with|yield)\b/
  @operators ~r/[+\-*/%=<>!&|^~]/
  @literals ~r/\b(\d+(\.\d*)?|\.\d+)([eE][+-]?\d+)?\b/
  @strings ~r/(\'\'\'|\"\"\"|\"|\'|\b)\K(\\.|[^\\])*?(?=\1)/

  # Function to highlight tokens in a Python code file and write HTML and CSS files
  def highlight_file(input_filename, html_filename, css_filename) do
    # Read input Python code file line by line
    input_file = File.open!(input_filename, [:read])
    lines = Enum.map(File.stream!(input_file), &String.trim(&1))

    # Initialize output HTML and CSS strings
    html_str = "<html>\n<head>\n<style>\n"
    css_str = ""

    # Loop over each line of input code
    Enum.each(lines, fn line ->
      # Initialize variables for matched token and remaining string on line
      matched_token = nil
      remaining_str = line

      # Loop over each type of token and try to match against remaining string
      for {token_type, regex, css_class} <- [
        {:keyword, @keywords, "keyword"},
        {:operator, @operators, "operator"},
        {:literal, @literals, "literal"},
        {:string, @strings, "string"}
      ] do
        case Regex.run(regex, remaining_str) do
          # If a token of this type is found, highlight it and update remaining string
          [{token, _}] ->
            replacement = "<span class=\"#{css_class}\">#{token}</span>"
            remaining_str = String.replace_first(remaining_str, regex, replacement)
            matched_token = token
            break

          # If no token of this type is found, do nothing and move on to next type
          [] -> nil
        end
      end

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

SyntaxHighlighter.highlight_file("code.py", "output.html", "output.css")

# Crate a module called Syntax_highlighter for the program
defmodule Syntax_highlighter do

  # Define pyhton tokens as module atributes
  @keywords ["if" ,"else", "elif", "and", "as", "break", "class", "continue", "del", ]
  # Create a function that takes a python file as input and creates a new html file and css file with the syntax highlighted.
  def convert_to_html_and_css(py_file_path) do
    {:ok, py_file} = File.read(py_file_path)
    html_content = generate_html(py_file)
    css_content = generate_css(html_content)

    File.write("output.html", html_content)
    File.write("output.css", css_content)
  end
  # Create a private function with the structure to generate html content from python file
  defp generate_html(py_file) do
    # logic to generate html content from python file
    # e.g. use regex to parse python code and convert it to html tags
    "<html><head></head><body><pre>#{py_file}</pre></body></html>"
  end
  # Create a private function with the structure to generate css content from html tags
  defp generate_css(html_content) do
    # logic to generate css content from html tags
    # e.g. use css selectors to style the pre tag
    "pre { background-color: yellow }"
    end
  end

  # Call the function with the path of the python file as input
  Syntax_highlighter.convert_to_html_and_css("code.py")
