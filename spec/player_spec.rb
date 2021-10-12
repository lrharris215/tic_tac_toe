describe "Player" do
  subject(:player) { Player.new(TestValidator.new, "Z")}
  it "Receives input from the player" do
    
    allow(player).to receive(:get_input).and_return("100")
    input = player.get_input

    expect(input).to eq("100")
  end
end
