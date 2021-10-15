describe "AdvancedComputerReceiver" do 
    let(:board) { Board.new}
    #need a test advanced player??
    let(:game_checker) { GameChecker.new }
    
    subject(:advanced) { AdvancedComputerReceiver.new(board, game_checker)}
    let(:computer) { TestPlayer.new(advanced, "O")}
    let(:human) { TestPlayer.new(TestReceiver, "X")}
    let(:v) { TestValidator.new }
    let(:display) {TestDisplay.new}

    def fill_corners(board, mark)
        board.place_mark(mark, 1)
        board.place_mark(mark, 3)
        board.place_mark(mark, 7)
        board.place_mark(mark, 9)
    end
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
            board.place_mark("X", 1)
            allow(advanced).to receive(:center).and_return(false)
            expect(advanced.get_player_input(v, display, computer, human)).to eq(9)

        end

        it "will pick a random corner" do 
            allow(advanced).to receive(:center).and_return(false)
            expect([1,3,7,9]).to include(advanced.get_player_input(v, display, computer, human))
        end

        it "will pick a random side" do 
            fill_corners(board, human.mark)
            allow(advanced).to receive(:center).and_return(false)
            expect([2,4,6,8]).to include(advanced.get_player_input(v, display, computer, human))
        end
    end
end