require_relative "./lib/program"

config_object = {
  display: Displayer.new($stdout),
  presenter: Presenter.new,
  board: Board.new,
  game_checker: GameChecker.new,
  player_1: Player.new(Receiver.new($stdin, Validator.new, Converter.new), "X"),
  player_2: Player.new(ComputerReceiver.new(Validator.new, Converter.new), "O"),
  converter: Converter.new,
  receiver: Receiver.new($stdin, Validator.new, Converter.new),
  human_player: Player.new(Receiver.new($stdin, Validator.new, Converter.new), "O"),
  computer_player: Player.new(ComputerReceiver.new(Validator.new, Converter.new), "O"),
}

program = Program.new(config_object)
program.restart_game
