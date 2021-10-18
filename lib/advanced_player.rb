class AdvancedComputerPlayer
  attr_reader :mark, :receiver
  def initialize(receiver, mark, human_player)
    # X or O
    @mark = mark
    @receiver = receiver
    @human_player = human_player
  end

  def get_input(display, board, validator)
    display.output("It is Player #{@mark}'s turn!")
    display.output(GET_PLAYER_INPUT)
    @receiver.get_player_input(validator, display, self, @human_player)
  end
end