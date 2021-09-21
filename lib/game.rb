require_relative "./presenter"
require_relative "./displayer"
class Game
  attr_reader :display
  def initialize(display, presenter)
    @display = display
    @presenter = presenter
  end

  def play
    @display.output(@presenter.print_board)
  end
  # def print_board
  #   puts "
  #            |       |
  #        1   |   2   |   3
  #      _____ | _____ | _____
  #            |       |
  #        4   |   5   |   6
  #      _____ | _____ | _____
  #            |       |
  #        7   |   8   |   9
  #            |       |
  #       "
  # end
end

board = "
             |       |
         1   |   2   |   3
       _____ | _____ | _____
             |       |
         4   |   5   |   6
       _____ | _____ | _____
             |       |
         7   |   8   |   9
             |       |
        "
p = Presenter.new(board)
d = Displayer.new(STDOUT)
g = Game.new(d, p)
g.play
