describe "AdvancedComputerReceiver" do 
    let(:board) { Board.new}
    #need a test advanced player??
    let(:game_checker) { GameChecker.new }
    
    subject(:advanced) { AdvancedComputerReceiver.new(board, game_checker)}
    let(:computer) { TestPlayer.new(advanced, "O")}
    let(:human) { TestPlayer.new(TestReceiver, "X")}
    let(:v) { TestValidator.new }
    let(:display) {TestDisplay.new}
    context "CalculateBestMove" do 
        it "will win the game if a winning move is available" do 
                board.place_mark("O", 1)
                board.place_mark("O", 2)
                
                expect(advanced.get_player_input(v, display, computer, human)).to eq(3)
        end

        it "will block a human player from winning" do 
                board.place_mark("X", 1)
                board.place_mark("X", 4)
                expect(advanced.get_player_input(v, display, computer, human)).to eq(7)
        end

        it "will create a fork" do 

        end

        it "will block the creation of a fork" do 

        end

        it "will pick the center square if it's available" do 
                expect(advanced.get_player_input(v, display, computer, human)).to eq(5)
        end

        it "will pick the opposite corner from the human player" do 

        end

        it "will pick a random corner" do 

        end

        it "will pick a random side" do 

        end
    end
end