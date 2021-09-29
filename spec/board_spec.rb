require_relative "../lib/board"

describe "Board" do
  let(:game_checker) { GameChecker.new }
  subject(:board) { Board.new(game_checker) }

  let(:test_player1) { TestPlayer.new("Z") }
  let(:test_player2) { TestPlayer.new("Y") }

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
      board.fill_for_tie(test_player1.mark, test_player2.mark)

      expect(board.full?).to be(true)
    end
  end
end
