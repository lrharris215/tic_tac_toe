require "rspec"

require_relative "../lib/game_checker"
require_relative "../lib/board"

describe "GameChecker" do
  subject(:checker) { GameChecker.new }
  let(:board) { Board.new(checker) }
  let(:player1) { TestPlayer.new("Z") }
  let(:player2) { TestPlayer.new("Y") }

  def set_row_winner(mark)
    [1,2,3].each do |position|
        board.place_mark(mark, position)
    end
  end

  def set_col_winner(mark)
    [2,5,8].each do |position|
        board.place_mark(mark, position)
    end
  end

  def set_diag_winner(mark)
    [1,5,9].each do |position|
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
