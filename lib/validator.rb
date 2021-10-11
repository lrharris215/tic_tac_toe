class Validator
  def valid_move?(board, move, converter)
    valid_input?(move) && valid_position?(board, move, converter)
  end

  private

  def valid_position?(board, position, converter)
    # not taken by another piece
    if /^[1-9]$/.match?(converter.stringify(board.find_position(converter.numberfy(position))))
      return true
    end
    false
  end

  def valid_input?(input)
    # num from 1 - 9
    if /^[1-9]$/.match?(input)
      return true
    end
    false
  end
end
