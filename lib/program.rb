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

  private

  def reset_board
    @config[:board] = Board.new
  end
end
