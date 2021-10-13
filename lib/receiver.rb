class Receiver
  def initialize(input_function, converter)
    @input_function = input_function
    @converter = converter
  end

  def input
    @input_function.gets.chomp
  end

  def get_player_input(validator, display)
    p_input = input
    until validator.valid?(p_input)
      display.output(INPUT_ERROR)
      p_input = input
    end
    p_input
  end
end
