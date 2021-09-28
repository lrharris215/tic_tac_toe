require_relative "./lib/game"

board = Board.new
presenter = Presenter.new
displayer = Displayer.new($stdout, $stdin)
players = [Player.new("X"), Player.new("O")]
game = Game.new(displayer, presenter, board, players)
game.start
game.play
