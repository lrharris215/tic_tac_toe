class Validator
  def valid_move?(board, move)
    valid_input?(move) && valid_position?(board, move)
  end

  private

  def valid_position?(board, position)
    # not taken by another piece
    if /^[1-9]$/.match?(board.find_position(position).to_s)
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
