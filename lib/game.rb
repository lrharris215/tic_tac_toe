require_relative "./presenter"
require_relative "./displayer"
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
end

presenter = Presenter.new
displayer = Displayer.new($stdout)
game = Game.new(displayer, presenter)
game.start
game.play
