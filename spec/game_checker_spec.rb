require "rspec"

require_relative "../lib/game_checker"
require_relative "../lib/board"

describe "GameChecker" do
  subject(:checker) { GameChecker.new }
  let(:board) { Board.new(checker) }
  let(:player1) { TestPlayer.new("Z") }
  let(:player2) { TestPlayer.new("Y") }

  def set_row_winner(mark)
    board.place_mark(mark, 1)
    board.place_mark(mark, 2)
    board.place_mark(mark, 3)
  end

  def set_col_winner(mark)
    board.place_mark(mark, 2)
    board.place_mark(mark, 5)
    board.place_mark(mark, 8)
  end

  def set_diag_winner(mark)
    board.place_mark(mark, 1)
    board.place_mark(mark, 5)
    board.place_mark(mark, 9)
  end

  def set_tie(mark1, mark2)
    board.place_mark(mark1, 1)
    board.place_mark(mark2, 2)
    board.place_mark(mark1, 3)
    board.place_mark(mark2, 4)
    board.place_mark(mark1, 5)
    board.place_mark(mark2, 6)
    board.place_mark(mark2, 7)
    board.place_mark(mark1, 8)
    board.place_mark(mark2, 9)
  end

  context "winner?" do
    it "Returns true if the game has been won horizontally" do
      set_row_winner(player1.mark)

      expect(board.game_checker.winner?(board, player1)).to be(true)
    end

    it "Returns true if the game has been won vertically" do
      set_col_winner(player1.mark)

      expect(board.game_checker.winner?(board, player1)).to be(true)
    end

    it "Returns true if the game has been won diagonally" do
      set_diag_winner(player1.mark)

      expect(board.game_checker.winner?(board, player1)).to be(true)
    end
  end

  context "tie?" do
    it "Returns true if all the spaces are filled without a winner" do
      set_tie(player1.mark, player2.mark)

      expect(board.game_checker.tie?(board, player1, player2)).to be(true)
    end
  end
end
