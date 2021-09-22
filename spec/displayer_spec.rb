require "rspec"
require_relative "../lib/displayer.rb"

describe "Displayer" do 
            class TestOutputFunction
            def puts(message)
                return message
            end
        end
    it "applies the output function to the message" do

        d = Displayer.new(TestOutputFunction.new())
        expect(d.output("message")).to eq("message")
    end
end