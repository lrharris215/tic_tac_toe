require "rspec"
require_relative '../lib/game.rb'

describe "Game" do 
   it "passes this example test" do 
        pass = true
        expect(pass).to eq(true)
   end

   it "prints a 3x3 board to the console" do 
      g = Game.new()
      g.print_board()
   end
end