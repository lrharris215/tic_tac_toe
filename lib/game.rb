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
    @player_2 = Player.new("O")
    @game_over = false
  end

  def start
    @display.output("Welcome to Tic Tac Toe!")
  end

  def play
    # use a while loop later to keep game going
    print_board
    place_mark(@player_1, get_player_input)
    print_board
  end

  def print_board
    @display.output(@presenter.print_board(@board))
  end

  def place_mark(player, position)
    pos = position.to_i
    @board[pos - 1] = player.mark
  end

  def get_player_input
    @display.output("Where would you like to put your mark?")
    gets.chomp
  end
end
