class Receiver
  def initialize(input_function, validator, converter)
    @input_function = input_function
    @validator = validator

    @converter = converter
  end

  def input
    @input_function.gets.chomp
  end

  def get_player_move(display, board, mark)
    move = input

    until @validator.valid_move?(board, move, @converter)
      display.output(INPUT_ERROR)
      move = input
    end
    @converter.numberfy(move)
  end

  def get_player_two_choice(display)
    choice = input
    until @validator.valid_player2?(choice)
       display.output(INPUT_ERROR)
      choice = input
    end
    choice
  end
end
