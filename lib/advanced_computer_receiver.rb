class AdvancedComputerReceiver
  def initialize(board, game_checker)
    #need to use marks instead, bc player is initalized w/ a receiver. 
    #maybe inside validator???
    @board = board
    @game_checker = game_checker
    # @human_player = human_player
    # @computer_player = computer_player
  end

  def input
  end

  def get_player_input(validator, display, computer_player, human_player)
    calculate_best_move(validator, computer_player, human_player)
  end

  private

  def calculate_best_move(validator, computer_player, human_player)
    # need to determine best move.
    # computer win
    # stop human win
    # fork
    # block fork
    # center
    # opposite corner
    # empty corner
    # empty side
    corners = [1, 3, 7, 9]
    sides = [2, 4, 6, 8]
  
    if check_win(validator, computer_player)
      check_win(validator, computer_player)
    elsif check_win(validator, human_player)
      check_win(validator, human_player)
    elsif check_fork(validator, computer_player)
        check_fork(validator, computer_player)
    elsif check_fork(validator, human_player)
      check_fork(validator, human_player)
    elsif center(validator)
      center(validator)
    elsif opposite_corner(validator, human_player)
      opposite_corner(validator, human_player)
    elsif empty_space(validator, corners)
      empty_space(validator, corners)
    else empty_space(validator, sides)
    end
  end

  def check_win(validator, player)
    @board.cells.each_with_index do |cell, position|
      board_copy = copy_board(@board)
      if validator.valid?(position + 1) && winner?(board_copy, position + 1, player)
        return position + 1
      end
    end
    nil
  end

  def winner?(board, position, player)
    board.place_mark(player.mark, position)
    @game_checker.winner?(board, player)
  end

 def check_fork(validator, player)
    @board.cells.each_with_index do |cell, position|
        board_copy = copy_board(@board)
        if validator.valid?(position + 1) && is_fork?(board_copy, position + 1, player)
            return position + 1
        end
    end
    nil 
 end

  def is_fork?(board, position, player)
    #forks are when there are 2 ways to win
    #basically taking over a corner
    #or 2 corners i guess when u have the center and the opposite ones are free but i dont think that will ever actially happen

    #too many forks to list out. Don't forget about the center. 
    #is a fork if more than 2 cases of 2 in a row? 
    #is that even possible w/o a fork? probably not??

    win_count = 0
    board.place_mark(player.mark, position)

    board.cells.each_with_index do |cell, position|
        board_copy = copy_board(board)
       if winner?(board_copy, position + 1, player)
        win_count += 1
       end
    end

    if win_count >= 2
        return position
    else 
        nil
    end
  end

  def center(validator)
    if validator.valid?(5)
      return 5
    end
    nil
  end

  def opposite_corner(validator, human_player)
    if @board.find_position(1) === human_player.mark && validator.valid?(9)
      return 9
    elsif @board.find_position(3) === human_player.mark && validator.valid?(7)
      return 7
    elsif @board.find_position(7) === human_player.mark && validator.valid?(3)
      return 3
    elsif @board.find_position(9) === human_player.mark && validator.valid?(1)
      return 1
    end
    nil
  end

  def empty_space(validator, spaces)
    possible_spaces = []

    spaces.each do |cell|
      if validator.valid?(cell)
        possible_spaces.push(cell)
      end
    end
    possible_spaces.sample
  end

def copy_board(board)
    new_board = Board.new
    board.cells.each_with_index do |cell, index|
        new_board.place_mark(cell, index + 1)
    end
    new_board
end
end
