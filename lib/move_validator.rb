class MoveValidator
  def initialize(board, converter)
    @converter = converter
    @board = board
  end

  def valid?(input)
    valid_input?(input, @converter) && valid_position?(@board, input, @converter)
  end

  private

  def valid_position?(board, position, converter)
    # not taken by another piece
    if /^[1-9]$/.match?(converter.stringify(board.find_position(converter.numberfy(position))))
      return true
    end
    false
  end

  def valid_input?(input, converter)
    # num from 1 - 9
    if /^[1-9]$/.match?(converter.stringify(input))
      return true
    end
    false
  end
end
