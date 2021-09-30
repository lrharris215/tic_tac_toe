require_relative "../lib/board"

class TestChecker
    def winner?(board, player)
        return true
    end

    def tie?(board, player1, player2)
        return true
    end
end
describe "Board" do
  let(:game_checker) { TestChecker.new }
  subject(:board) { Board.new(game_checker) }

  let(:test_player1) { TestPlayer.new("Z") }
  let(:test_player2) { TestPlayer.new("Y") }

   def set_row_winner(mark)
    [1,2,3].each do |position|
        board.place_mark(mark, position)
    end
  end

  def set_tie(mark1, mark2)
    [1,3,5,8].each do |position|
        board.place_mark(mark1, position)
    end
    [2,4,6,7,9].each do |position|
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
