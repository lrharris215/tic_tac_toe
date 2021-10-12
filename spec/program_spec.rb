require_relative "../lib/program"
describe "Program" do
  let(:config_object) {
    {
      display: TestDisplay.new,
      presenter: TestPresenter.new,
      board: TestBoard.new,
      game_checker: TestChecker.new,
      player_1: TestPlayer.new(TestReceiver.new, "Z"),
      player_2: TestPlayer.new(TestReceiver.new, "Y"),
      converter: TestConverter.new,
      receiver: TestReceiver.new
    }
  }
  subject(:program) { Program.new(config_object) }
  it "creates a game" do
    game = program.game
    expect(program.create_game).not_to be(game)
  end

  it "restarts the game" do
    allow(program).to receive(:restart_game).and_return(true)
    expect(program.play_again?).to eq(true)
  end
end
