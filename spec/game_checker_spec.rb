require "rspec"

require_relative "../lib/game_checker"
require_relative "../lib/board"

class TestBoard
    def row_full?(mark)
        return false
    end

    def col_full?(mark)
        return false
    end

    def diagonal_full?(mark)
        return false
    end
end
describe "GameChecker" do
  subject(:checker) { GameChecker.new }
  let(:board) { TestBoard.new }
  let(:player1) { TestPlayer.new("Z") }
  let(:player2) { TestPlayer.new("Y") }

  context "winner?" do
    it "Returns true if the game has been won horizontally" do
   
      allow(board).to receive(:row_full?).and_return(true)
      expect(checker.winner?(board, player1)).to be(true)
    end

    it "Returns true if the game has been won vertically" do
  
      allow(board).to receive(:col_full?).and_return(true)
      expect(checker.winner?(board, player1)).to be(true)
    end

    it "Returns true if the game has been won diagonally" do

      allow(board).to receive(:diagonal_full?).and_return(true)
      expect(checker.winner?(board, player1)).to be(true)
    end

    it "Returns false if the player has not won the game" do

      expect(checker.winner?(board, player1)).to be(false)
    end
  end

  context "tie?" do
    it "Returns true if all the spaces are filled without a winner" do
      
      allow(board).to receive(:full?).and_return(true)
      expect(checker.tie?(board, player1, player2)).to be(true)
    end
  end
end
