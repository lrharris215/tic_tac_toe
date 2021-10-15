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
    elsif create_fork
      create_fork
    elsif block_fork
      block_fork
    elsif center
      center
    elsif opposite_corner(validator)
      opposite_corner(validator)
    elsif empty_space(corners)
      empty_space(corners)
    else empty_space(sides)
    end
  end

  def check_win(validator, player)
    @board.cells.each_with_index do |cell, position|
        puts @board.cells
        puts "cell: #{cell}"
        puts "pos: #{position}"
      board_copy = @board.dup
      if validator.valid?(position + 1) && winner?(board_copy, position + 1, player)
        return cell
      end
    end
    nil
  end

  def winner?(board, position, player)
    b = board.dup
    # puts "mark: #{player.mark}"
    # puts "cell: #{cell}"
    b.place_mark(player.mark, position)
    @game_checker.winner?(b, player)
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

  def opposite_corner(validator)
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
