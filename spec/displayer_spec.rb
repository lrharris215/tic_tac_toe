class TestOutputFunction
  def puts(message)
    message
  end
end

describe "Displayer" do
  subject(:display) { Displayer.new(TestOutputFunction.new) }

  it "Outputs the given message" do
    expect(display.output("message")).to eq("message")
  end
end
