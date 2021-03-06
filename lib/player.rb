require_relative "./constants"

class Player
  attr_reader :mark, :receiver
  def initialize(receiver, mark)
    # X or O
    @mark = mark
    @receiver = receiver
  end

  def get_input(display, board, validator)
    display.output("It is Player #{@mark}'s turn!")
    display.output(GET_PLAYER_INPUT)
    @receiver.get_player_input(validator, display)
  end
end
