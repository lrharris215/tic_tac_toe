class AdvancedValidator < MoveValidator
    def initialize(board, converter, computer, human)
        @computer = computer
        @human = human
        super
    end

    def valid?

    end
end