require_relative './board.rb'
class Presenter
    def initialize(board)
        @board = board
    end


  def print_board
    "
             |       |
         #{@board[0]}   |   #{@board[1]}   |   #{@board[2]}
       _____ | _____ | _____
             |       |
         #{@board[3]}   |   #{@board[4]}   |   #{@board[5]}
       _____ | _____ | _____
             |       |
         #{@board[6]}   |   #{@board[7]}   |   #{@board[8]}
             |       |
        "
  end
end
