describe "Validator" do
  subject(:validator) { Validator.new }
  let(:board) { TestBoard.new }
  let(:converter) { TestConverter.new }
  context "valid_move?" do
    it "Accepts valid player input" do
      expect(validator.valid_move?(board, "3", converter)).to be(true)
    end
    it "Rejects invalid player input" do
      expect(validator.valid_move?(board, "100", converter)).to be(false)
      expect(validator.valid_move?(board, "ABC", converter)).to be(false)
    end

    it "Accepts input if the space is has not been taken" do
      board = TestBoard.new
      expect(validator.valid_move?(board, "1", converter)).to be(true)
    end
    it "Rejects input if space is already taken" do
      board = TestBoard.new
      player1 = TestPlayer.new("Z")

      board.place_mark(player1.mark, 1)
      expect(validator.valid_move?(board, "1", converter)).to be(false)
    end
  end
end
