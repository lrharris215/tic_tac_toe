require_relative "./board"
class Presenter
  def print_board(board)
    "
             |       |
         #{board.find_position(0)}   |   #{board.find_position(1)}   |   #{board.find_position(2)}
       _____ | _____ | _____
             |       |
         #{board.find_position(3)}   |   #{board.find_position(4)}   |   #{board.find_position(5)}
       _____ | _____ | _____
             |       |
         #{board.find_position(6)}   |   #{board.find_position(7)}   |   #{board.find_position(8)}
             |       |
        "
  end
end
