require "rspec"
require_relative "./spec_helper"
require_relative "../lib/game"
require_relative "../lib/constants"
require_relative "./test_classes"

describe "Game" do
  let(:config_object) {
    {
      display: TestDisplay.new,
      presenter: TestPresenter.new,
      board: TestBoard.new,
      game_checker: TestChecker.new,
      player_1: TestPlayer.new(TestValidator.new, "Z"),
      player_2: TestPlayer.new(TestValidator.new, "Y"),
      converter: TestConverter.new
    }
  }
  subject(:game) { Game.new(config_object) }

  it "displays the welcome message on game start" do
    game.start

    expect(game.display.state[0]).to eq(WELCOME)
  end

  it "plays the game" do
    game.play

    expect(game.display.state[0]).to eq(["Z", 2, 3])

    # allow(game.game_checker).to receive(:game_over?).and_return(true)
  end

  it "Switches players" do
    game.switch_player

    expect(game.active_player).to eq(game.player_2)
  end
end
