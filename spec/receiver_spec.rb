class TestInputFunction
  def gets
    "hello\n"
  end
end

describe "Receiver" do
    subject(:receiver) { Receiver.new(TestInputFunction.new, TestValidator.new, TestConverter.new)}

    it "Receives input" do 
        expect(receiver.input).to eq("hello")
    end
end