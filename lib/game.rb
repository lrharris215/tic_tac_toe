class Game
    def initialize
        puts "Welcome to Tic-Tac-Toe!"
    end

    def print_board
       puts "
             |       | 
         1   |   2   |   3
       _____ | _____ | _____
             |       |  
         4   |   5   |   6
       _____ | _____ | _____
             |       | 
         7   |   8   |   9
             |       | 
        "
    end
end

g = Game.new()
g.print_board