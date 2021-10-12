class Displayer
  def initialize(output_function)
    @output_function = output_function
  end

  def output(message)
    @output_function.puts(message)
  end
end
