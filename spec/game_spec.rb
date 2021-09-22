require "rspec"
require_relative "../lib/game"

describe "Game" do
  it "passes this example test" do
    pass = true
    expect(pass).to eq(true)
  end

  it "displays what it is presented with" do
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
    g = Game.new(TestDisplay.new, TestPresenter.new)
    g.play
    expect(g.display.state[0]).to eq("______")
  end
end
