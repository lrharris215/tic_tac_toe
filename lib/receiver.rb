class Receiver
    def initialize(display, validator)
        @display = display
        
        @validator = validator
    end

    def get_player_move()
        move = @display.input
    end
end