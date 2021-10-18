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

    if check_function(validator, computer_player, :winner?)
      puts "computer win"
      check_function(validator, computer_player, :winner?)
    elsif check_function(validator, human_player, :winner?)
      puts "block human"
      check_function(validator, human_player, :winner?)
    elsif check_function(validator, computer_player, :is_fork?)
      puts "create fork"
      check_function(validator, computer_player, :is_fork?)

    elsif check_function(validator, human_player, :is_fork?)
      puts "block fork"
      check_function(validator, human_player, :is_fork?)
    elsif center(validator)
      center(validator)
    elsif opposite_corner(validator, human_player)
      puts "opp corner"
      opposite_corner(validator, human_player)
    elsif empty_space(validator, corners)
      puts "corners"
      empty_space(validator, corners)
    else empty_space(validator, sides)
    end
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
