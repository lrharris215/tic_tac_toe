require "rspec"
require_relative "../lib/game"

class TestDisplay
  attr_reader :state
  def initialize
    @state = []
  end

  def output(message)
    @state.push(message)
  end
end

class TestPresenter
  def print_board(board)
    board.board
  end
end

class TestBoard
  attr_reader :board
  def initialize
    @board = [1, 2, 3]
  end
  
    def []=(num, val)
    @board[num] = val
  end

  def place_mark(player, position)
    @board[position - 1] = player.mark
  end
end

class TestPlayer
  def mark
    return "Z"
  end
end

describe "Game" do
  it "passes this example test" do
    pass = true
    expect(pass).to eq(true)
  end

  it "displays the welcome message on game start" do
    game = Game.new(TestDisplay.new, TestPresenter.new, TestBoard.new)

    game.start

    expect(game.display.state[0]).to eq("Welcome to Tic Tac Toe!")
  end

  it "it displays the board from the presenter" do
    game = Game.new(TestDisplay.new, TestPresenter.new, TestBoard.new)
    game.print_board
    expect(game.display.state[0]).to eq([1, 2, 3])
  end

  it "Allows a player to place their mark on the board" do
      game = Game.new(TestDisplay.new, TestPresenter.new, TestBoard.new)
      player = TestPlayer.new
      
      game.place_mark(player, 1);
      game.print_board
      expect(game.display.state[0][0]).to eq("Z")
  end
end
