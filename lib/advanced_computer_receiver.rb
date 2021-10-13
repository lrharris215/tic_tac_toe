class AdvancedComputerReceiver

  def initialize(board, player, game_checker)
    @board = board
    @game_checker = game_checker
    @player = player
  end
  def input
    move = calculate_best_move
  end

  def get_player_input(validator, display)
    move = input
    until validator.valid?(move) 
      move = input
    end
    move
  end

  private

  def calculate_best_move(validator)
    #need to determine best move. 
    #computer win
    #stop human win
    #fork
    #block fork
    #center
    #opposite corner
    #empty corner
    #empty side

    
    possible_moves = []
    @board.cells.each do |cell|
        board_copy = @board
        if validator.valid?(cell)
            if computer_win?(board_copy, cell)
                return cell
            elsif block_human_win(board_copy, cell)
                return cell
            end
        end
    end


  end

  def computer_win?(board, cell)
        board.place_mark(@player.mark, cell)
        @game_checker.winner?(board, @player)
  end
end