class GameChecker
  def winner?(board, player)
    horizontal_winner?(board, player) || vertical_winner?(board, player) || diagonal_winner?(board, player)
  end

  def tie?(board, player1, player2)
    board.full? && !winner?(board, player1) && !winner?(board, player2)
  end

  def game_over?(board, player1, player2)
    winner?(board, player1) || winner?(board, player2) || tie?(board, player1, player2)
  end

  private

  def horizontal_winner?(board, player)
    board.row_full?(player.mark)
  end

  def vertical_winner?(board, player)
    board.col_full?(player.mark)
  end

  def diagonal_winner?(board, player)
    board.diagonal_full?(player.mark)
  end
end
