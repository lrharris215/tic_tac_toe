require_relative "./constants"

class Player
  attr_reader :mark
  def initialize(validator, mark)
    # X or O
    @mark = mark
    @validator = validator
  end

  def get_input(display)
    display.output("It is Player #{@mark}'s turn!")
    display.output(GET_PLAYER_INPUT)
    display.input
  end

  def get_valid_input(display, board, converter)
    input = get_input(display)
    # input is a string
    until @validator.valid_move?(board, input, converter)
      display.output(INPUT_ERROR)
      input = get_input(display)
    end
    # change it to an int
    converter.numberfy(input)
  end
end
