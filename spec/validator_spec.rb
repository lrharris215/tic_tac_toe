require_relative "../lib/validator"

class TestBoard
  attr_reader :cells
  def initialize
    @cells = [1, 2, 3]
  end

  def place_mark(mark, position)
    @cells[position - 1] = mark
  end

  def find_position(num)
    @cells[num.to_i - 1]
  end
end

class TestPlayer
  attr_reader :mark
  def initialize(mark)
    @mark = mark
  end

  def get_input(display)
    1
  end
end

describe "Validator" do
  subject(:validator) { Validator.new }
  let(:board) { TestBoard.new }
  context "valid_move?" do
    it "Accepts valid player input" do
      expect(validator.valid_move?(board, "3")).to be(true)
    end
    it "Rejects invalid player input" do
      expect(validator.valid_move?(board, "100")).to be(false)
      expect(validator.valid_move?(board, "ABC")).to be(false)
    end

    it "Accepts input if the space is has not been taken" do
      board = TestBoard.new
      expect(validator.valid_move?(board, "1")).to be(true)
    end
    it "Rejects input if space is already taken" do
      board = TestBoard.new
      player1 = TestPlayer.new("Z")

      board.place_mark(player1.mark, 1)
      expect(validator.valid_move?(board, "1")).to be(false)
    end
  end
end
