require_relative "./presenter"
require_relative "./displayer"
require_relative "./board"
require_relative "./player"
require_relative "./constants"

class Game
  attr_reader :display, :board, :player_1
  def initialize(display, presenter, board, player1)
    @display = display
    @presenter = presenter
    @board = board
    @player_1 = player1
    # These are for later
    # @player_2 = Player.new("O")
    # @game_over = false
  end

  def start
    @display.output(WELCOME)
  end

  def play
    # use a while loop later to keep game going
    print_board
    @board.place_mark(@player_1.mark, @player_1.get_input(@display))
    print_board
  end

  def print_board
    @display.output(@presenter.print_board(@board))
  end
end
