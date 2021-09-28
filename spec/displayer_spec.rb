require "rspec"
require_relative "../lib/displayer"

class TestOutputFunction
  def puts(message)
    message
  end
end

class TestInputFunction
  def gets
    "hello\n"
  end
end

describe "Displayer" do

    subject(:display) { Displayer.new(TestOutputFunction.new, TestInputFunction.new) }

  it "applies the output function to the message" do
    expect(display.output("message")).to eq("message")
  end

  it "applies the input function to receive player input" do
    expect(display.input).to eq("hello")
  end
end
