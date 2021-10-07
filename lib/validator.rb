class Validator

    def valid_move?(board, move)
        valid_position?(board, move) && valid_input?(move)
    end

    def valid_position?(board, position)
        # not taken by another piece
        
    end

    def valid_input?(input)
        #num from 1 - 9
        if input.match(/^[1-9]$/)
            return true
        end
        false
    end


end