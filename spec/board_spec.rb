require_relative "../lib/board"
class TestPlayer 
    def mark
        return "Z"
    end
end
describe "Board" do
    it "Changes places the correct mark in the correct position" do
        board = Board.new()
        test_player = TestPlayer.new()
        board.place_mark(test_player, 1)

        expect(board[0]).to eq("Z")
    end 
end