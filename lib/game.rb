require_relative "./presenter"
require_relative "./displayer"
require_relative "./board"
require_relative "./player"
require_relative "./constants"

class Game
  attr_reader :display, :board, :player_1
  def initialize(display, presenter, board, players)
    @display = display
    @presenter = presenter
    @board = board
    @player_1 = players[0]
    @player_2 = players[1]

    @active_player = @player_1
    # @game_over = false
  end

  def start
    @display.output(WELCOME)
  end

  def play
    print_board
    @board.place_mark(@player_1.mark, @player_1.get_input(@display))
    print_board
    @board.place_mark(@player_2.mark, @player_2.get_input(@display))
    print_board
  end

  private

  def print_board
    @display.output(@presenter.print_board(@board))
  end
end
