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

  context "winner?" do
    it "Returns true if the game has been won horizontally" do
        board = Board.new
        test_player = TestPlayer.new("Z")
        board.place_mark(test_player.mark, 1)
        board.place_mark(test_player.mark, 2)
        board.place_mark(test_player.mark, 3)

        expect(board.winner?).to be(true)
    end

    it "Returns true if the game has been won vertically" do
        board = Board.new
        test_player = TestPlayer.new("Z")
        board.place_mark(test_player.mark, 1)
        board.place_mark(test_player.mark, 4)
        board.place_mark(test_player.mark, 7)

        expect(board.winner?).to be(true)
    end

    it "Returns true if the game has been won diagonally" do
        board = Board.new
        test_player = TestPlayer.new("Z")
        board.place_mark(test_player.mark, 1)
        board.place_mark(test_player.mark, 5)
        board.place_mark(test_player.mark, 9)

        expect(board.winner?).to be(true)
    end
  end
  context "tie?" do
    it "Returns true if all the spaces are filled without a winner" do
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

        expect(board.tie?).to be(true)
    end
  end
end
