require_relative "./presenter"
require_relative "./displayer"
require_relative "./board"
class Game
  attr_reader :display, :board
  def initialize(display, presenter, board)
    @display = display
    @presenter = presenter
    @board = board
  end

  def start
    @display.output("Welcome to Tic Tac Toe!")
  end

  def play
    @display.output(@presenter.print_board(@board))
  end

  def place_mark(player, position)
    @board[position - 1] = player.mark
  end
end

board = Board.new
presenter = Presenter.new
displayer = Displayer.new($stdout)
game = Game.new(displayer, presenter, board)
game.start
game.play
