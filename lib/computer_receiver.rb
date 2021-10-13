class ComputerReceiver
  def input
    rand(1..9)
  end

  def get_player_input(validator, display)
    move = input
    until validator.valid?(move)
      move = input
    end
    move
  end
end
