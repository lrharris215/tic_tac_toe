class ComputerReceiver
  def initialize(validator, converter)
    @display = display
    @validator = validator

    @converter = converter
  end

  def input
    input = rand(1..9)
  end

  def get_player_move(board, mark)
    move = input

    until @validator.valid_move?(board, move, @converter)
      move = input
    end
    @converter.numberfy(move)
  end
end
