require_relative "../lib/validator"

class TestBoard
  attr_reader :cells
  def initialize
    @cells = [1, 2, 3]
  end

  def place_mark(mark, position)
    @cells[position - 1] = mark
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
    validator = Validator.new()
    context "valid_input?" do 
        it "Accepts valid player input" do
            expect(validator.valid_input?("4")).to be(true)
        end
        it "Rejects invalid player input" do 
            expect(validator.valid_input?("100")).to be(false)
            expect(validator.valid_input?("ABC")).to be(false)
        end
    end

    context "valid_position" do 
        it "Rejects input if space is already taken" do
            board = TestBoard.new()
            player1 = TestPlayer.new("Z")

            board.place_mark(player1.mark, 1)
            expect(validator.valid_position?(board, 1)).to be(false)
        end
    end
end