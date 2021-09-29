require "rspec"

require_relative "../lib/game_checker"
require_relative "../lib/board"

describe "GameChecker" do
  subject(:checker) { GameChecker.new }
  let(:board) { Board.new(checker) }
  let(:player1) { TestPlayer.new("Z") }
  let(:player2) { TestPlayer.new("Y") }

  context "winner?" do
    it "Returns true if the game has been won horizontally" do
      board.fill_row(player1.mark, 1)

      expect(board.game_checker.winner?(board, player1)).to be(true)
    end

    it "Returns true if the game has been won vertically" do
      board.fill_col(player1.mark, 1)

      expect(board.game_checker.winner?(board, player1)).to be(true)
    end

    it "Returns true if the game has been won diagonally" do
      board.fill_diagonal(player1.mark, "left")

      expect(board.game_checker.winner?(board, player1)).to be(true)
    end
  end

  context "tie?" do
    it "Returns true if all the spaces are filled without a winner" do
      board.fill_for_tie(player1.mark, player2.mark)

      expect(board.game_checker.tie?(board, player1, player2)).to be(true)
    end
  end
end
