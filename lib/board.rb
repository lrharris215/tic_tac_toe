class Board
  attr_reader :cells

  def initialize
    @cells = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def find_position(num)
    @cells[num - 1]
  end

  def place_mark(mark, position)
    cell_location = position.to_i - 1
    @cells[cell_location] = mark
  end

    def full?
    @cells.each_with_index do |cell, idx|
      if cell.to_i === idx + 1
        return false
      end
    end
    true
  end

  def row_full?(mark)
    find_row(1).all?(mark) || find_row(2).all?(mark) || find_row(3).all?(mark)
  end

  def col_full?(mark)
    find_col(1).all?(mark) || find_col(2).all?(mark) || find_col(3).all?(mark)
  end

  def diagonal_full?(mark)
    find_diagonal("left").all?(mark) || find_diagonal("right").all?(mark)
  end
  
  def fill_row(mark, row_num)
    case row_num
    when 1
        place_mark(mark, 1)
        place_mark(mark, 2)
        place_mark(mark, 3)
    when 2
        place_mark(mark, 4)
        place_mark(mark, 5)
        place_mark(mark, 6)
    when 3
        place_mark(mark, 7)
        place_mark(mark, 8)
        place_mark(mark, 9)
    end
  end

  def fill_col(mark, col_num)
    case col_num
    when 1
        place_mark(mark, 1)
        place_mark(mark, 4)
        place_mark(mark, 7)
    when 2
        place_mark(mark, 2)
        place_mark(mark, 5)
        place_mark(mark, 8)
    when 3
        place_mark(mark, 3)
        place_mark(mark, 6)
        place_mark(mark, 9)
    end
    
  end

  def fill_diagonal(mark, side)
    case side
    when "left"
        place_mark(mark, 1)
        place_mark(mark, 5)
        place_mark(mark, 9)
    when "right"
        place_mark(mark, 3)
        place_mark(mark, 5)
        place_mark(mark, 7)
    end
  end
  private

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
    # takes in either "left" or "right". returns the diagonal values
    case side
    when "left"
      diag = [find_position(1), find_position(5), find_position(9)]
    when "right"
      diag = [find_position(3), find_position(5), find_position(7)]
    end
    diag
  end
end
