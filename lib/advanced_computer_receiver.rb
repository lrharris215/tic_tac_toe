class AdvancedComputerReceiver
  def initialize(board, game_checker)
    @board = board
    @game_checker = game_checker
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


    computer_win = check_function(validator, computer_player, :winner?)
    human_win = check_function(validator, human_player, :winner?)
    computer_fork = check_function(validator, computer_player, :is_fork?)
    human_fork = check_function(validator, human_player, :is_fork?)
    empty_corner = empty_space(validator, corners)
    empty_side = empty_space(validator, sides)

    # move_arr = [computer_win, human_win, computer_fork, human_fork, center(validator), opposite_corner(validator, human_player), empty_corner, empty_side]

    # move_arr.each do |move|
    #     return move if move
    # end

    best_move = check_function(validator, computer_player, :winner?)
        return best_move if best_move
    best_move = check_function(validator, human_player, :winner?)
        return best_move if best_move
    best_move = check_function(validator, computer_player, :is_fork?)
        return best_move if best_move
    best_move = check_function(validator, human_player, :is_fork?)
        return best_move if best_move
    best_move = center(validator)
        return best_move if best_move
    best_move = opposite_corner(validator, human_player)
        return best_move if best_move
    best_move = empty_space(validator, corners)
      return best_move if best_move
      return empty_space(validator, sides)
  end


  # might rename this later, can't think of anything more specific rn
  def check_function(validator, player, function)
    @board.cells.each_with_index do |cell, position|
      board_copy = @board.copy_board
      if validator.valid?(position + 1) && method(function).call(board_copy, position + 1, player, validator)
        return position + 1
      end
    end
    nil
  end

  def winner?(board, position, player, validator = nil)
    board.place_mark(player.mark, position)
    @game_checker.winner?(board, player)
  end

  def is_fork?(board, position, player, validator)
    win_count = 0
    board.place_mark(player.mark, position)

    board.cells.each_with_index do |cell, position|
      board_copy = board.copy_board
      if validator.valid?(position + 1) && winner?(board_copy, position + 1, player)
        win_count += 1
      end
    end

    win_count >= 2
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
end
