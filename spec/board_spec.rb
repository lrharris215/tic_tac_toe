require_relative "../lib/board"

describe "Board" do
  context "place_mark" do
    it "Places the correct mark in the correct position" do
      board = Board.new
      test_player = TestPlayer.new("Z")
      board.place_mark(test_player.mark, 1)

      expect(board.cells[0]).to eq("Z")
    end
  end
  context "find_position" do
    it "Returns the correct position in the board array" do
      board = Board.new

      expect(board.find_position(1)).to eq(1)
    end
  end
  context "full?" do 
    it "returns false if the board is not full" do
        board = Board.new
        test_player = TestPlayer.new("Z")
        board.place_mark(test_player.mark, 1)

        expect(board.full?).to be(false)
    end
    it "returns true if the board is full" do 
        board = Board.new
        test_player1 = TestPlayer.new("Z")
        test_player2 = TestPlayer.new("Y")

        board.place_mark(test_player1.mark, 1)
        board.place_mark(test_player2.mark, 2)
        board.place_mark(test_player1.mark, 3)
        board.place_mark(test_player2.mark, 4)
        board.place_mark(test_player1.mark, 5)
        board.place_mark(test_player2.mark, 6)
        board.place_mark(test_player2.mark, 7)
        board.place_mark(test_player1.mark, 8)
        board.place_mark(test_player2.mark, 9)

        expect(board.full?).to be(true)
    end
  end
end
