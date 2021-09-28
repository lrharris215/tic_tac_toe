class GameChecker
  def winner?(board, player)
    horizontal_winner?(board, player) || vertical_winner?(board, player) || diagonal_winner?(board, player)
  end

  def tie?(board, player1, player2)
    board.full? && !winner?(board, player1) && !winner?(board, player2)
  end

  private

  def horizontal_winner?(board, player)
    board.find_row(1).all?(player.mark) || board.find_row(2).all?(player.mark) || board.find_row(3).all?(player.mark)
  end

  def vertical_winner?(board, player)
    board.find_col(1).all?(player.mark) || board.find_col(2).all?(player.mark) || board.find_col(3).all?(player.mark)
  end

  def diagonal_winner?(board, player)
    board.find_diagonal("left").all?(player.mark) || board.find_diagonal("right").all?(player.mark)
  end
end
