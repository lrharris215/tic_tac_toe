require_relative "../lib/board"

describe "Board" do
  let(:game_checker) { GameChecker.new }
  subject(:board) { Board.new(game_checker) }

  let(:test_player1) { TestPlayer.new("Z") }
  let(:test_player2) { TestPlayer.new("Y") }
  

  def set_row_winner(mark)
    board.place_mark(mark, 1)
    board.place_mark(mark, 2)
    board.place_mark(mark, 3)
  end

  def set_col_winner(mark)
    board.place_mark(mark, 2)
    board.place_mark(mark, 5)
    board.place_mark(mark, 8)
  end

  def set_diag_winner(mark)
    board.place_mark(mark, 1)
    board.place_mark(mark, 5)
    board.place_mark(mark, 9)
  end

  def set_tie(mark1, mark2)
    board.place_mark(mark1, 1)
    board.place_mark(mark2, 2)
    board.place_mark(mark1, 3)
    board.place_mark(mark2, 4)
    board.place_mark(mark1, 5)
    board.place_mark(mark2, 6)
    board.place_mark(mark2, 7)
    board.place_mark(mark1, 8)
    board.place_mark(mark2, 9)
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
  context "won?" do
    it "Returns true if a player has won the game" do
      set_row_winner(test_player1.mark)
      expect(board.won?(test_player1, test_player2)).to be(true)
    end

    it "Returns false if a player has not won the game" do
      set_tie(test_player1.mark, test_player2.mark)

      expect(board.won?(test_player1, test_player2)).to be(false)
    end
  end

  context "tie?" do
    it "Returns true if the game is tied" do
      set_tie(test_player1.mark, test_player2.mark)

      expect(board.tie?(test_player1, test_player2)).to be(true)
    end
  end
end
