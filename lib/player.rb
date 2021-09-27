require_relative "./constants"

class Player
  attr_reader :mark
  def initialize(mark)
    # X or O
    @mark = mark
  end

  def get_input(display)
    display.output(GET_PLAYER_INPUT)
    display.input
  end
end
