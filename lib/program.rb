require_relative './game'
class Program
    def initialize(config)
        @config = config
    end
  def create_game
    replace_board
    @game = Game.new(@config)
  end

  def play_game
    @game.start
    @game.play
    play_again?
  end

  def restart_game
    create_game
    play_game
  end

  def play_again?
    if @game.play_again? 
        puts 'i said yes'
        restart_game
    end
  end

  private

  def replace_board
    @config[:board] = Board.new
  end
end