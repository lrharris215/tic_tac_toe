class Player
  attr_reader :mark
  def initialize(mark)
    # X or O
    @mark = mark
  end
end

# Player.new("X")
