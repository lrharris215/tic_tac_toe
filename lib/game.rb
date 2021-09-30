require_relative "./presenter"
require_relative "./displayer"
require_relative "./board"
require_relative "./player"
require_relative "./constants"
require_relative "./game_checker"

class Game
  attr_reader :display, :board, :player_1
  def initialize(config_object)
    @display = config_object[:display]
    @presenter = config_object[:presenter]
    @board = config_object[:board]
    @player_1 = config_object[:player1]
    @player_2 = config_object[:player2]

    @active_player = @player_1
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
