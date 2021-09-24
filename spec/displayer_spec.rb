require "rspec"
require_relative "../lib/displayer"

class TestOutputFunction
  def puts(message)
    message
  end
end

class TestInputFunction
    def gets
        return "hello\n"
    end
end

describe "Displayer" do
    before(:each) do
        @display = Displayer.new(TestOutputFunction.new, TestInputFunction.new)
    end
  it "applies the output function to the message" do
    # display = Displayer.new(TestOutputFunction.new)
    expect(@display.output("message")).to eq("message")
  end

  it "applies the input function to receive player input" do
    
    expect(@display.input()).to eq("hello")
  end
end
