require_relative "../lib/board"
class TestPlayer
  def mark
    "Z"
  end
end
describe "Board" do
  context "place_mark" do
    it "Places the correct mark in the correct position" do
      board = Board.new
      test_player = TestPlayer.new
      board.place_mark(test_player, 1)

      expect(board[0]).to eq("Z")
    end
  end
end
