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
    corners = [1, 3, 7, 9]
    sides = [2, 4, 6, 8]

    computer_win = check_function(validator, computer_player, @board, :winner?)
    human_win = check_function(validator, human_player, @board, :winner?)
    computer_fork = check_function(validator, computer_player, @board, :is_fork?)
    win_setup = set_up_win(computer_player, human_player, validator, sides, corners)
    human_fork = check_function(validator, human_player, @board, :is_fork?)
    empty_corner = empty_space(validator, corners)
    empty_side = empty_space(validator, sides)

    move_arr = [computer_win, human_win, computer_fork, win_setup, human_fork, center(validator), opposite_corner(validator, human_player), empty_corner, empty_side]

    move_arr.each_with_index do |move, idx|
      return move if move
    end
  end

  # might rename this later, can't think of anything more specific rn
  def check_function(validator, player, board, function)
    board.cells.each_with_index do |cell, position|
      board_copy = board.copy_board
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

  def set_up_win(computer_player, human_player, validator, sides, corners)
    if @board.find_position(5) === computer_player.mark
      set_win(computer_player, validator, sides)
    elsif @board.find_position(5) === human_player.mark
      set_win(computer_player, validator, corners)
    end
  end

  def set_win(player, validator, cells)
    cells.each do |cell|
      if validator.valid?(cell)
        board_copy = @board.copy_board
        board_copy.place_mark(player.mark, cell)
        if check_function(validator, player, board_copy, :winner?)
          return cell
        end
      end
    end
    nil
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
