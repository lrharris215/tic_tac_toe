require "rspec"
require_relative "../lib/game"

describe "Game" do
  it "passes this example test" do
    pass = true
    expect(pass).to eq(true)
  end

  it "prints a 3x3 board to the console" do
    g = Game.new
    expect do
      g.print_board
    end.to output("
             |       |
         1   |   2   |   3
       _____ | _____ | _____
             |       |
         4   |   5   |   6
       _____ | _____ | _____
             |       |
         7   |   8   |   9
             |       |
        \n").to_stdout
  end
end
