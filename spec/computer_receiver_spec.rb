require_relative "../lib/computer_receiver"

describe "ComputerReceiver" do
  subject(:receiver) { ComputerReceiver.new(TestConverter.new) }

  it "Receives random input" do
    expect(receiver.input).to be_between(1, 9)
  end
end
