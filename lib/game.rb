require_relative "./presenter"
require_relative "./displayer"
require_relative "./board"
require_relative "./player"
require_relative "./constants"

class Game
  attr_reader :display, :board, :player_1
  def initialize(display, presenter, board, players)
    @display = display
    @presenter = presenter
    @board = board
    @player_1 = players[0]
    @player_2 = players[1]

    @active_player = @player_1
    @game_over = false
  end

  def start
    @display.output(WELCOME)
  end

  def play
    # use a while loop later to keep game going
    while @game_over == false
      print_board
      @board.place_mark(@active_player.mark, @active_player.get_input(@display))
      print_board
      switch_player
      @board.place_mark(@active_player.mark, @active_player.get_input(@display))
      print_board
      @game_over = true
    end
  end

  private

  def switch_player
    @active_player === @player_1 ? @active_player = @player_2 : @active_player = @player_1
  end

  def print_board
    @display.output(@presenter.print_board(@board))
  end
end
