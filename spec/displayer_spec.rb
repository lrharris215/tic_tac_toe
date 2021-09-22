require "rspec"
require_relative "../lib/displayer"

class TestOutputFunction
  def puts(message)
    message
  end
end

describe "Displayer" do
  it "applies the output function to the message" do
    display = Displayer.new(TestOutputFunction.new)
    expect(display.output("message")).to eq("message")
  end
end
