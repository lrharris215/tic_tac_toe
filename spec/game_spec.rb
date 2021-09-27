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
    board.cells
  end
end

class TestBoard
  attr_reader :cells
  def initialize
    @cells = [1, 2, 3]
  end

  def []=(num, val)
    @cells[num] = val
  end

  def place_mark(player, position)
    @cells[position - 1] = player.mark
  end
end

class TestPlayer
  def mark
    "Z"
  end
end

describe "Game" do
  before(:each) do
    @game = Game.new(TestDisplay.new, TestPresenter.new, TestBoard.new)
  end

  it "displays the welcome message on game start" do
    @game.start

    expect(@game.display.state[0]).to eq("Welcome to Tic Tac Toe!")
  end

  it "it displays the board from the presenter" do
    @game.print_board
    expect(@game.display.state[0]).to eq([1, 2, 3])
  end

  it "Allows a player to place their mark on the board" do
    player = TestPlayer.new

    @game.board.place_mark(player, 1)
    @game.print_board
    expect(@game.display.state[0][0]).to eq("Z")
  end
end
