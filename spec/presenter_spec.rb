require "rspec"
require_relative "../lib/presenter.rb"

describe "Presenter" do
  it "Returns the correct game board" do
    pres = Presenter.new()
    expect(pres.print_board).to eq("
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