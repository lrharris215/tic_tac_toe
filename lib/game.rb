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

p = Presenter.new()
d = Displayer.new($stdout)
g = Game.new(d, p)
g.start
g.play
