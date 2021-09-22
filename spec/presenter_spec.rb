require "rspec"
require_relative "../lib/presenter"
require_relative '../lib/board.rb'

describe "Presenter" do
  it "Returns the correct game board" do
    board = Board.new
    presenter = Presenter.new
    expect(presenter.print_board(board)).to eq("
             |       |
         1   |   2   |   3
       _____ | _____ | _____
             |       |
         4   |   5   |   6
       _____ | _____ | _____
             |       |
         7   |   8   |   9
             |       |
        ")
  end
end
