require_relative "./lib/game"

config_object = {
  display: Displayer.new($stdout, $stdin),
  presenter: Presenter.new,
  board: Board.new,
  game_checker: GameChecker.new,
  player_1: Player.new(Validator.new, "X"),
  player_2: Player.new(Validator.new, "O"),
  converter: Converter.new
}
game = Game.new(config_object)
game.start
game.play
