require "rspec"

require_relative "../lib/game_checker"
require_relative "../lib/board"

describe "GameChecker" do
  context "winner?" do
    it "Returns true if the game has been won horizontally" do
      board = Board.new
      test_player = TestPlayer.new("Z")
      checker = GameChecker.new
    
      board.fill_row(test_player.mark, 1)

      expect(checker.winner?(board, test_player)).to be(true)
    end

    it "Returns true if the game has been won vertically" do
      board = Board.new
      test_player = TestPlayer.new("Z")
      checker = GameChecker.new
      board.fill_col(test_player.mark, 1)

      expect(checker.winner?(board, test_player)).to be(true)
    end

    it "Returns true if the game has been won diagonally" do
      board = Board.new
      test_player = TestPlayer.new("Z")
      checker = GameChecker.new
      board.fill_diagonal(test_player.mark, "left")

      expect(checker.winner?(board, test_player)).to be(true)
    end
  end
  context "tie?" do
    it "Returns true if all the spaces are filled without a winner" do
      board = Board.new
      test_player1 = TestPlayer.new("Z")
      test_player2 = TestPlayer.new("Y")
      checker = GameChecker.new
      board.place_mark(test_player1.mark, 1)
      board.place_mark(test_player2.mark, 2)
      board.place_mark(test_player1.mark, 3)
      board.place_mark(test_player2.mark, 4)
      board.place_mark(test_player1.mark, 5)
      board.place_mark(test_player2.mark, 6)
      board.place_mark(test_player2.mark, 7)
      board.place_mark(test_player1.mark, 8)
      board.place_mark(test_player2.mark, 9)

      expect(checker.tie?(board, test_player1, test_player2)).to be(true)
    end
  end
end
