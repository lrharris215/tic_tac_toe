require_relative "./game"
class Program
  attr_reader :game, :receiver, :config
  def initialize(config)
    @config = config
    @display = config[:display]
    @receiver = config[:receiver]
    @player_validator = config[:player_validator]
  end

  def create_game
    reset_board
    set_move_validator
    configure_players
    Game.new(@config)
  end

  def play_game
    @game.start
    @game.play
    play_again?
  end

  def restart_game
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

    player_choice = @receiver.get_player_input(@player_validator, @display)
    if /\bhuman\b/i.match?(player_choice)
      set_player_two(@config[:human_player])
    elsif /\bcomputer\b/i.match?(player_choice)
      set_player_two(@config[:computer_player])
    elsif /\badvanced\b/i.match?(player_choice)
      set_advanced_computer
      set_player_two(@config[:advanced_player])
    end
  end

  private

  def reset_board
    @config[:board] = Board.new
  end

  def set_player_two(player2)
    @config[:player_2] = player2
  end

  def set_advanced_computer
    @config[:advanced_receiver] = AdvancedComputerReceiver.new(@config[:board], @config[:game_checker])
    @config[:advanced_player] = AdvancedComputerPlayer.new(@config[:advanced_receiver], "O", @config[:player_1])
  end

  def set_move_validator
    @config[:move_validator] = MoveValidator.new(@config[:board], @config[:converter])
  end
end
