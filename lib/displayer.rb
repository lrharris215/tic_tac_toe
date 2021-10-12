class Displayer
  def initialize(output_function, input_function)
    @output_function = output_function
    @input_function = input_function
  end

  def output(message)
    @output_function.puts(message)
  end

#   def input
#     @input_function.gets.chomp
#   end
end
