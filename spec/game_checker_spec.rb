describe "GameChecker" do
  subject(:checker) { GameChecker.new }
  let(:board) { TestBoard.new }
  let(:player1) { TestPlayer.new(TestValidator.new, "Z") }
  let(:player2) { TestPlayer.new(TestValidator.new, "Y") }

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

    it "Returns false if there are still spaces left" do
      allow(board).to receive(:full?).and_return(false)
      expect(checker.tie?(board, player1, player2)).to be(false)
    end
  end

  context "game_over?" do
    it "Returns true if the game has been won" do
      allow(checker).to receive(:winner?).and_return(true)

      expect(checker.game_over?(board, player1, player2)).to be(true)
    end

    it "Returns true if the game is a tie" do
      allow(checker).to receive(:tie?).and_return(true)

      expect(checker.game_over?(board, player1, player2)).to be(true)
    end

    it "Returns false if there is no winner or tie" do
      allow(checker).to receive(:tie?).and_return(false)
      allow(checker).to receive(:winner?).and_return(false)

      expect(checker.game_over?(board, player1, player2)).to be(false)
    end
  end
end
