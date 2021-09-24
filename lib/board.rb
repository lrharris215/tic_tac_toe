class Board
  attr_reader :board

  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def []=(num, val)
    @board[num] = val
  end

  def [](num)
    @board[num]
  end

  def place_mark(mark, position)
    pos = position.to_i - 1
    @board[pos] = mark
  end
end
