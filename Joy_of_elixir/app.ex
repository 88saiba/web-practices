defmodule HelloWorld do
  # This function receives a message and prints it to the terminal
  def print_message(message) do
    IO.puts(message)  # Output the message
  end
end

# "Hello, World!" is the data to be processed
# The data is passed to the print_message function using the pipeline operator
"Hello, World!"
|> HelloWorld.print_message()
