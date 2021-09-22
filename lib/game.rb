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

# board = "
#              |       |
#          1   |   2   |   3
#        _____ | _____ | _____
#              |       |
#          4   |   5   |   6
#        _____ | _____ | _____
#              |       |
#          7   |   8   |   9
#              |       |
#         "
p = Presenter.new()
d = Displayer.new($stdout)
g = Game.new(d, p)
g.start
g.play
