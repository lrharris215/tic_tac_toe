require_relative "./board"
class Presenter
  def print_board(board)
    "
             |       |
         #{board.find_position(1)}   |   #{board.find_position(2)}   |   #{board.find_position(3)}
       _____ | _____ | _____
             |       |
         #{board.find_position(4)}   |   #{board.find_position(5)}   |   #{board.find_position(6)}
       _____ | _____ | _____
             |       |
         #{board.find_position(7)}   |   #{board.find_position(8)}   |   #{board.find_position(9)}
             |       |
        "
  end

  def print_results(result)
    #prints results of gamechecker.winner,tie,gameover
    "#{result}"
  end
end
