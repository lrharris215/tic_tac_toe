require_relative "./lib/program"

config_object = {
  display: Displayer.new($stdout, $stdin),
  presenter: Presenter.new,
  board: Board.new,
  game_checker: GameChecker.new,
  player_1: Player.new(Receiver.new($stdin, Validator.new, Converter.new), "X"),
  player_2: Player.new(Receiver.new($stdin, Validator.new, Converter.new), "O"),
  converter: Converter.new,
  receiver: Receiver.new($stdin, Validator.new, Converter.new)
}

program = Program.new(config_object)
program.restart_game

# game = Game.new(config_object)
# game.start
# game.play
