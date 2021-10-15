class AdvancedValidator < MoveValidator
    def initialize(board, converter, computer, human)
        #AdvancedValidator.new(board, converter, coomputer player, human player)
        #will prob initialize in program? 
        @computer = computer
        @human = human
        super
    end

    def valid?(input)
        valid_input?(input, @converter) && valid_position?(@board, input, @converter) && best_move?(@board, @input, @computer, @human)
    end

    def best_move?(baord, input, computer, human)
        
    end
end