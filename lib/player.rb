class Player
  attr_reader :mark
  def initialize(mark)
    # X or O
    @mark = mark
  end

  def get_input(display)
    display.output("Where would you like to put your mark?")
    display.input
  end
end
