require_relative "./lib/game"

board = Board.new
presenter = Presenter.new
displayer = Displayer.new($stdout)
game = Game.new(displayer, presenter, board)
game.start
game.play
