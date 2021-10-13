class TestDisplay
  attr_reader :state
  def initialize
    @state = []
  end

  def output(message)
    @state.push(message)
  end

  def input
    1
  end
end

class TestPresenter
  def print_board(board)
    board.cells.dup
  end

  def print_results(result)
  end
end

class TestBoard
  attr_reader :cells
  def initialize
    @cells = [1, 2, 3]
  end

  def place_mark(mark, position)
    @cells[position - 1] = mark
  end

  def find_position(num)
    @cells[num - 1]
  end

  def row_full?(mark)
    false
  end

  def col_full?(mark)
    false
  end

  def diagonal_full?(mark)
    false
  end
end

class TestPlayer
  attr_reader :mark, :receiver
  def initialize(receiver, mark)
    @mark = mark
    # @validator = validator
    @receiver = receiver
  end

  def get_input(display, board, validator)
    1
  end
end

class TestChecker
  @first_loop_done = false
  def game_over?(board, player_1, player_2)
    return true if @first_loop_done

    @first_loop_done = true
    false
  end

  def winner?(board, player)
    true
  end

  def tie?(board, player1, player2)
    true
  end
end

class TestValidator
  def valid_move?(board, move, converter)
    true
  end
end

class TestConverter
  def numberfy(string)
    string.to_i
  end

  def stringify(number)
    number.to_s
  end
end

class TestReceiver
  def input
    "y"
  end

  def get_player_input(validator, display)
  end
end
