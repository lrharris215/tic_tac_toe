require_relative "./lib/game"

game_checker = GameChecker.new
board = Board.new(game_checker)
presenter = Presenter.new
displayer = Displayer.new($stdout, $stdin)
players = [Player.new("X"), Player.new("O")]
game = Game.new(displayer, presenter, board, players)
game.start
game.play
