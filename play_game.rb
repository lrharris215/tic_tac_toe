require_relative "./lib/game"

board = Board.new
presenter = Presenter.new
displayer = Displayer.new($stdout, $stdin)
player_1 = Player.new("X")
game = Game.new(displayer, presenter, board, player_1)
game.start
game.play
