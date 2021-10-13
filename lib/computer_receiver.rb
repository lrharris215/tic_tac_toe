class ComputerReceiver
  def initialize(converter)
    @converter = converter
  end

  def input
    rand(1..9)
  end

  def get_player_input(validator, display)
    move = input
    until validator.valid?(move)
      move = input
    end
    @converter.numberfy(move)
  end
end
