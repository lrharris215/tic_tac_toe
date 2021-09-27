require "rspec"
require_relative "./spec_helper.rb"
require_relative "../lib/game"
require_relative "../lib/constants"


class TestDisplay
  attr_reader :state
  def initialize
    @state = []
  end

  def output(message)
    @state.push(message)
  end

  def input
    1
  end
end

class TestPresenter
  def print_board(board)
    board.cells.dup
  end
end

class TestBoard
  attr_reader :cells
  def initialize
    @cells = [1, 2, 3]
  end

  def place_mark(mark, position)
    @cells[position - 1] = mark
  end
end

class TestPlayer
  def mark
    "Z"
  end

  def get_input(display)
    return 1
  end
end

describe "Game" do
     
  subject(:game) { Game.new(TestDisplay.new, TestPresenter.new, TestBoard.new, TestPlayer.new) }

  # before(:each) do
  #   @game = Game.new(TestDisplay.new, TestPresenter.new, TestBoard.new, TestPlayer.new)
  # end

  it "displays the welcome message on game start" do
    game.start

    expect(game.display.state[0]).to eq("Welcome to Tic Tac Toe!")
  end

  it "plays the game" do
   
    game.play
    
    expect(game.display.state).to eq([[1,2,3], ["Z",2,3]])
  end
end
