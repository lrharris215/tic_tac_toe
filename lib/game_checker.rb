class GameChecker
    def winner?(board, player)
        #takes in a board and a player, determines if that player has won
        if horizontal_winner?(board, player)
            return true
        elsif vertical_winner?(board, player)
            return true
        elsif diagonal_winner?(board, player)
            return true
        else
            return false
        end
    end

    def tie?(board, player1, player2)
        #takes in a board, determines if there is a tie
        if board.full? && !winner?(board, player1) && !winner?(board, player2)
            return true
        else
            return false
        end
    end

    private
    def horizontal_winner?(board, player)

      if board.return_row(1).all?(player.mark)
        return true
      elsif board.return_row(2).all?(player.mark)
        return true
      elsif board.return_row(3).all?(player.mark)
        return true
      else return false
      end
    end

    def vertical_winner?(board, player)
        if board.return_col(1).all?(player.mark)
        return true
      elsif board.return_col(2).all?(player.mark)
        return true
      elsif board.return_col(3).all?(player.mark)
        return true
      else return false
      end
    end

    def diagonal_winner?(board, player)
        if board.return_diagonal("left").all?(player.mark)
            return true
        elsif board.return_diagonal("right").all?(player.mark)
            returnt true
        else
            return false
        end
    end

end