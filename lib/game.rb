require_relative "./presenter"
require_relative "./displayer"
require_relative "./board"
require_relative "./player"
require_relative "./constants"
require_relative "./game_checker"
require_relative "./validator"
require_relative "./converter"

class Game
  attr_reader :display, :board, :player_1, :player_2, :active_player, :game_checker
  def initialize(config_object)
    @display = config_object[:display]
    @presenter = config_object[:presenter]
    @board = config_object[:board]
    @player_1 = config_object[:player_1]
    @player_2 = config_object[:player_2]
    @game_checker = config_object[:game_checker]
    @validator = config_object[:validator]
    @converter = config_object[:converter]

    @active_player = @player_1
  end

  def start
    @display.output(WELCOME)
    print_board
  end

  def play
    until @game_checker.game_over?(@board, @player_1, @player_2)
      @board.place_mark(@active_player.mark, get_valid_input)
      print_board
      switch_player
    end
  end

  def switch_player
    @active_player = @active_player == @player_1 ? @player_2 : @player_1
  end

  def end_game
    if @game_checker.tie?(@board, @player_1, @player_2)
      TIE
    elsif @game_checker.winner?(@board, @player_1)
      PLAYER1_WINS
    elsif @game_checker.winner?(@board, @player_2)
      PLAYER2_WINS
    end
  end

  private

  def print_board
    @display.output(@presenter.print_board(@board))
    @display.output(@presenter.print_results(end_game))
  end

  def get_valid_input
    input = @active_player.get_input(@display)
    # input is a string
    until @validator.valid_move?(@board, input, @converter)
      @display.output(INPUT_ERROR)
      input = @active_player.get_input(@display)
    end
    # change it to an int
    @converter.numberfy(input)
  end
end
