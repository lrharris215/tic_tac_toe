class Board
  attr_reader :cells, :game_checker

  def initialize(game_checker)
    @cells = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @game_checker = game_checker
  end

  def find_position(num)
    @cells[num - 1]
  end

  def place_mark(mark, position)
    cell_location = position.to_i - 1
    @cells[cell_location] = mark
  end

  def won?(player1, player2)
    @game_checker.winner?(self, player1) || @game_checker.winner?(self, player2)
  end

  def tie?(player1, player2)
    @game_checker.tie?(self, player1, player2)
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
