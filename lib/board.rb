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
    rows = find_rows
    rows.each do |row|
      if row.all?(mark)
        return true
      end
    end
    false
  end

  def col_full?(mark)
    cols = find_cols
    cols.each do |col|
      if col.all?(mark)
        return true
      end
    end
    false
  end

  def diagonal_full?(mark)
    diags = find_diagonals
    diags.each do |diag|
      if diag.all?(mark)
        return true
      end
    end
    false
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

  def fill_for_tie(mark1, mark2)
    place_mark(mark1, 1)
    place_mark(mark2, 2)
    place_mark(mark1, 3)
    place_mark(mark2, 4)
    place_mark(mark1, 5)
    place_mark(mark2, 6)
    place_mark(mark2, 7)
    place_mark(mark1, 8)
    place_mark(mark2, 9)
  end

  private

  def find_rows
    [[find_position(1), find_position(2), find_position(3)],
      [find_position(4), find_position(5), find_position(6)],
      [find_position(7), find_position(8), find_position(9)]]
  end

  def find_cols
    [[find_position(1), find_position(4), find_position(7)],
      [find_position(2), find_position(5), find_position(8)],
      [find_position(3), find_position(6), find_position(9)]]
  end

  def find_diagonals
    [[find_position(1), find_position(5), find_position(9)],
      [find_position(3), find_position(5), find_position(7)]]
  end
end
