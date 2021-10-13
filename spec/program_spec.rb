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
      receiver: TestReceiver.new,
      human_player: TestPlayer.new(TestReceiver.new, "O"),
      computer_player: TestPlayer.new(ComputerReceiver.new, "O")
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
  context "configure_players" do
    it "allows user to play against a human" do
      allow(program.receiver).to receive(:get_player_two_choice).and_return("human")
      program.configure_players
      expect(program.config[:player_2].receiver).to be_instance_of(TestReceiver)
    end

    it "allows user to play against a computer" do
      allow(program.receiver).to receive(:get_player_input).and_return("computer")
      program.configure_players
      expect(program.config[:player_2].receiver).to be_instance_of(ComputerReceiver)
    end
  end
end
