describe "move_validator" do
  let(:board) { TestBoard.new }
  let(:converter) { TestConverter.new }
  subject(:validator) { MoveValidator.new(board, converter) }

  context "valid_move?" do
    it "Accepts valid player input" do
      expect(validator.valid?("3")).to be(true)
    end
    it "Rejects invalid player input" do
      expect(validator.valid?("100")).to be(false)
      expect(validator.valid?("ABC")).to be(false)
    end

    it "Accepts input if the space is has not been taken" do
      expect(validator.valid?("1")).to be(true)
    end
    it "Rejects input if space is already taken" do
      player1 = TestPlayer.new(TestValidator, "Z")

      board.place_mark(player1.mark, 1)
      puts board.cells
      expect(validator.valid?("1")).to be(false)
    end
  end
end
