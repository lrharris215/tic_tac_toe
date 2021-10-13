describe "PlayerValidator" do
  subject(:validator) { PlayerValidator.new }
  context "valid_player_2?" do
    it "accepts a human player as player 2" do
      expect(validator.valid?("Human")).to be(true)
    end

    it "accepts a computer player as player 2" do
      expect(validator.valid?("computer")).to be(true)
    end

    it "does not accept random words as player 2" do
      expect(validator.valid?("puppy")).to be(false)
    end
  end
end
