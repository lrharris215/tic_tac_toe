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
end
