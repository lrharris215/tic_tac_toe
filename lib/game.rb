require_relative "./presenter"
require_relative "./displayer"
require_relative "./board"
require_relative "./player"
class Game
  attr_reader :display, :board
  def initialize(display, presenter, board)
    @display = display
    @presenter = presenter
    @board = board
    @player_1 = Player.new("X")
    # These are for later
    # @player_2 = Player.new("O")
    # @game_over = false
  end

  def start
    @display.output("Welcome to Tic Tac Toe!")
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

  # def get_player_input
  #   @display.output("Where would you like to put y our mark?")
  #   @display.input()
  # end
end
