require_relative "../lib/validator"

describe "Validator" do
    validator = Validator.new()

    it "Accepts valid player input" do
        expect(validator.valid_input?(4)).to be(true)
    end
    it "Rejects invalid player input" do 
        expect(validater.valid_input?(100)).to be(false)
        expect(validater.valid_input?("ABC")).to be(false)
    end
end