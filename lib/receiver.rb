class Receiver
  def initialize(input_function, validator, converter)
    @display = display
    @input_function = input_function
    @validator = validator

    @converter = converter
  end

  def input
    @input_function.gets.chomp
  end

  def get_player_move(board, mark)
    move = input

    until @validator.valid_move?(board, move, @converter)
      move = input
    end
    @converter.numberfy(move)
  end
end
