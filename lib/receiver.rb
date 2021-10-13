class Receiver
  def initialize(input_function, converter)
    @input_function = input_function
    # @validator = validator

    @converter = converter
  end

  def input
    @input_function.gets.chomp
  end

  # def get_player_move(display, board, mark)
  #   move = input

  #   until @validator.valid_move?(board, move, @converter)
  #     display.output(INPUT_ERROR)
  #     move = input
  #   end
  #   @converter.numberfy(move)
  # end

  # def get_player_two_choice(display)
  #   choice = input
  #   until @validator.valid_player2?(choice)
  #     display.output(INPUT_ERROR)
  #     choice = input
  #   end
  #   choice
  # end

  def get_player_input(validator, display)
    #move val or player val
    #move val would have the board inside it? 
    #would thsi mean i'd need to create a new val every time? 
    p_input = input
    until validator.valid?(p_input)
      display.output(INPUT_ERROR)
      p_input = input
    end
    return p_input
  end
end
