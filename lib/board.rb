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

  def find_row(number)
    # returns the entire "row" (1, 2, 3) top to bottom
    case number
    when 1
      row = [find_position(1), find_position(2), find_position(3)]
    when 2
      row = [find_position(4), find_position(5), find_position(6)]
    when 3
      row = [find_position(7), find_position(8), find_position(9)]
    end
    row
  end

  def find_col(number)
    # returns the values of the col (1, 2, 3) left to right
    case number
    when 1
      col = [find_position(1), find_position(4), find_position(7)]
    when 2
      col = [find_position(2), find_position(5), find_position(8)]
    when 3
      col = [find_position(3), find_position(6), find_position(9)]
    end
    col
  end

  def find_diagonal(side)
    # takes in either "left" or "right". returns the diaganol values
    case side
    when "left"
      diag = [find_position(1), find_position(5), find_position(9)]
    when "right"
      diag = [find_position(3), find_position(5), find_position(7)]
    end
    diag
  end

  def full?
    # returns true if all spaces have been filled with marks
    @cells.each_with_index do |cell, idx|
      if cell.to_i === idx + 1
        return false
      end
    end
    true
  end
end
