class AdvancedComputerReceiver

  def initialize(board, computer_player, human_player, game_checker)
    @board = board
    @game_checker = game_checker
    @human_player = human_player
    @computer_player = computer_player
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

    if check_computer_win 
        return check_computer_win
    elsif check_human_win
        return check_human_win
    end


  end


def check_computer_win
    @board.cells.each do |cell|
        board_copy = @board.dup
       if computer_win?(board_copy, cell)
        return cell
       end
    end
    nil
end

def check_human_win
    board.cells.each do |cell|
        board_copy = @board.dup
        if block_human_win(board_copy, cell)
            return cell
        end
    end
    nil
end

  def computer_win?(board, cell)
        board.place_mark(@computer_player.mark, cell)
        @game_checker.winner?(board, @computer_player)
  end

  def block_human_win(board, cell)
        board.place_mark(@human_player.mark, cell)
        @game_checker.winner?(board, @human_player)
  end

  def create_fork

  end

  def block_fork 

  end

  def center

  end

  def opposite_corner

  end

  def empty_corner

  end

  def empty_side

  end
end