require_relative "./presenter"
require_relative "./displayer"
require_relative './board.rb'
class Game
  attr_reader :display
  def initialize(display, presenter)
    @display = display
    @presenter = presenter
  end

  def start
    @display.output("Welcome to Tic Tac Toe!")
  end

  def play
    @display.output(@presenter.print_board)
  end

  def place_mark(player, position)

  end
end

board = Board.new()
presenter = Presenter.new(board)
displayer = Displayer.new($stdout)
game = Game.new(displayer, presenter)
game.start
game.play
