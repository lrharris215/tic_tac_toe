require_relative "./game"
class Program
  def initialize(config)
    @config = config
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
    if @game.play_again?
      puts "restart time"
      restart_game
    end
  end

  private

  def reset_board
    @config[:board] = Board.new
    puts "board replaced:"
    puts @config[:board].cells
  end
end
