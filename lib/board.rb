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

  def place_mark(player, position)
    @board[position - 1] = player.mark
  end
end
