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
        
    end

    def vertical_winner?(board, player)

    end

    def diagonal_winner?(board, player)

    end

end