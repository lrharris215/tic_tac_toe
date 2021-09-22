class Board
    def initialize
        @board = [1,2,3,4,5,6,7,8,9]
    end

    def [](num)
        return @board[num]
    end
end