require "rspec"
require_relative "./spec_helper"
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
  attr_reader :mark
  def initialize(mark)
    @mark = mark
  end

  def get_input(display)
    1
  end
end

class TestChecker
  def game_over?(board, player_1, player_2)
    return true
  end
end

describe "Game" do
  let(:config_object) {
    {
      display: TestDisplay.new,
      presenter: TestPresenter.new,
      board: TestBoard.new,
      game_checker: TestChecker.new,
      player_1: TestPlayer.new("Z"),
      player_2: TestPlayer.new("Y")
    }
  }
  subject(:game) { Game.new(config_object) }

  it "displays the welcome message on game start" do
    game.start

    expect(game.display.state[0]).to eq("Welcome to Tic Tac Toe!")
  end

  it "plays the game" do
    p game.player_1
    p game.active_player

    game.play
    p game.display.state
    expect(game.display.state[0]).to eq(["Z", 2, 3])
  end

  it "Switches players" do
    game.play
    expect(game.display.state[2]).to eq(["Y", 2, 3])
  end
end
