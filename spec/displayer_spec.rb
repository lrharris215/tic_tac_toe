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

  it "Outputs the given message" do
    expect(display.output("message")).to eq("message")
  end

  it "Receives input" do
    expect(display.input).to eq("hello")
  end
end
