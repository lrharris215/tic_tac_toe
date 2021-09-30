require_relative "../lib/board"

class TestChecker
  def winner?(board, player)
    true
  end

  def tie?(board, player1, player2)
    true
  end
end

describe "Board" do
  let(:game_checker) { TestChecker.new }
  subject(:board) { Board.new(game_checker) }

  let(:test_player1) { TestPlayer.new("Z") }
  let(:test_player2) { TestPlayer.new("Y") }

  def set_row_winner(mark)
    [1, 2, 3].each do |position|
      board.place_mark(mark, position)
    end
  end

  def set_col_winner(mark)
    [2, 5, 8].each do |position|
      board.place_mark(mark, position)
    end
  end

  def set_diag_winner(mark)
    [1, 5, 9].each do |position|
      board.place_mark(mark, position)
    end
  end

  def set_tie(mark1, mark2)
    [1, 3, 5, 8].each do |position|
      board.place_mark(mark1, position)
    end
    [2, 4, 6, 7, 9].each do |position|
      board.place_mark(mark2, position)
    end
  end

  context "place_mark" do
    it "Places the correct mark in the correct position" do
      board.place_mark(test_player1.mark, 1)

      expect(board.cells[0]).to eq("Z")
    end
  end
  context "find_position" do
    it "Returns the correct position in the board array" do
      expect(board.find_position(1)).to eq(1)
    end
  end
  context "full?" do
    it "returns false if the board is not full" do
      board.place_mark(test_player1.mark, 1)

      expect(board.full?).to be(false)
    end
    it "returns true if the board is full" do
      set_tie(test_player1.mark, test_player2.mark)

      expect(board.full?).to be(true)
    end
  end

  context "row_full?" do
    it "returns true if a row is full of the same mark" do
      set_row_winner(test_player1.mark)

      expect(board.row_full?(test_player1.mark)).to be(true)
    end

    it "returns false if no rows are full of the same mark" do
      set_tie(test_player1.mark, test_player2.mark)

      expect(board.row_full?(test_player1.mark)).to be(false)
    end
  end

  context "col_full?" do
    it "returns true if a column is full of the same mark" do
      set_col_winner(test_player1.mark)

      expect(board.col_full?(test_player1.mark)).to be(true)
    end

    it "returns false if no columns are full of the same mark" do
      set_tie(test_player1.mark, test_player2.mark)

      expect(board.col_full?(test_player1.mark)).to be(false)
    end
  end

  context "diagonal_full?" do
    it "returns true if a diagnoal is full of the same mark" do
      set_diag_winner(test_player1.mark)

      expect(board.diagonal_full?(test_player1.mark)).to be(true)
    end

    it "returns false if no diagonals are full of the same mark" do
      set_tie(test_player1.mark, test_player2.mark)

      expect(board.diagonal_full?(test_player1.mark)).to be(false)
    end
  end
end
