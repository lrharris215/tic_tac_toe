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
    case number
    when 1
        row = [find_position(1), find_position(2), find_position(3)]
    when 2
        row = [find_position(4), find_position(5), find_position(6)]
    when 3
        row = [find_position(7), find_position(8), find_position(9)]
    end
    return row
  end

  def return_col(number)
    #returns the values of the col (1, 2, 3) left to right
  end

  def return_diagonal(side)
    #takes in either "left" or "right". returns the diaganol values
  end

  def full? 
    #returns true if all spaces have been filled with marks
    @cells.each_with_index do |cell, idx|
        if cell.to_i === idx + 1
            return false
        end
    end
    return true
  end
end
