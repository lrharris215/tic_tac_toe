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
  def print_board
    "______"
  end
end
describe "Game" do
  it "passes this example test" do
    pass = true
    expect(pass).to eq(true)
  end

  it "displays the welcome message on game start" do
    game = Game.new(TestDisplay.new, TestPresenter.new)

    game.start

    expect(game.display.state[0]).to eq("Welcome to Tic Tac Toe!")
  end

  it "it displays the board from the presenter" do
    game = Game.new(TestDisplay.new, TestPresenter.new)
    game.play
    expect(game.display.state[0]).to eq("______")
  end
end
