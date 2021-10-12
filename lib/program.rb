require_relative "./game"
class Program
  attr_reader :game
  def initialize(config)
    @config = config
    @display = config[:display]
    @receiver = config[:receiver]
    @game = create_game
  end

  def create_game
    reset_board
    Game.new(@config)
  end

  def play_game
    @game.start
    @game.play
    play_again?
  end

  def restart_game
    configure_players
    @game = create_game
    play_game
  end

  def play_again?
    @display.output(PLAY_AGAIN)
    answer = @receiver.input
    if answer === "yes" || answer === "y"
      restart_game
    end
  end

  def configure_players
    @display.output(PLAYER_CHOICE)
    player_choice = @receiver.input
    if player_choice === "1"
      set_player_two(Player.new(@receiver, "O"))
    elsif player_choice === "2"
      set_player_two(Player.new(ComputerReceiver.new(Validator.new, Converter.new), "O"))
    end

  end

  private

  def reset_board
    @config[:board] = Board.new
  end

  def set_player_two(player2)
    @config[:player_2] = player2
  end
end
