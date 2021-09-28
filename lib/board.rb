class Board
  attr_reader :cells

  def initialize
    @cells = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def find_position(num)
    @cells[num - 1]
  end

  def place_mark(mark, position)
    pos = position.to_i - 1
    @cells[pos] = mark
  end

  def return_row(number)
    #returns the entire "row" (1, 2, 3) top to bottom
  end

  def return_col(number)
    #returns the values of the col (1, 2, 3) left to right
  end

  def return_diagonal(side)
    #takes in either "left" or "right". returns the diaganol values
  end
end
