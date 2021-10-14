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
    # need to determine best move.
    # computer win
    # stop human win
    # fork
    # block fork
    # center
    # opposite corner
    # empty corner
    # empty side
    corners = [1,3,7,9]
    sides = [2,4,6,8]

    if check_computer_win
      check_computer_win
    elsif check_human_win
      check_human_win
    elsif create_fork
      create_fork
    elsif block_fork
      block_fork
    elsif center
      center
    elsif opposite_corner
      opposite_corner
    elsif empty_space(corners)
      empty_spaces(corners)
    else empty_space(sides)
    end
  end

  def check_computer_win
    @board.cells.each do |cell|
      board_copy = @board.dup
      if validator.valid?(cell) && computer_win?(board_copy, cell)
        return cell
      end
    end
    nil
  end

  def check_human_win
    board.cells.each do |cell|
      board_copy = @board.dup
      if validator.valid?(cell) && block_human_win(board_copy, cell)
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
    if validator.valid?(5)
      return 5
    end
    nil
  end

  def opposite_corner
    if board.find_position(1) === @human_player.mark && validator.valid?(9)
      return 9
    elsif board.find_position(3) === @human_player.mark && validator.valid?(7)
      return 7
    elsif board.find_position(7) === @human_player.mark && validator.valid?(3)
      return 3
    elsif board.find_position(9) === @human_player.mark && validator.valid?(1)
      return 1
    end
    nil
  end

#   def empty_corner
#     possible_corners = []
#     [1, 3, 7, 9].each do |cell|
#       if validator.valid?(cell)
#         possible_corners.push(cell)
#       end
#     end
#     possible_corners.sample
#   end

#   def empty_side
#     possible_sides = []
#     [2, 4, 6, 8].each do |cell|
#       if validator.valid?(cell)
#         possible_sides.push(cell)
#       end
#     end
#     possible_sides.sample
#   end

  def empty_space(spaces)
    possible_spaces = []

    spaces.each do |cell|
      if validator.valid?(cell)
        possible_sides.push(cell)
      end
    end
    possible_spaces.sample
  end
end
