require "spec_helper"

#Remove the comments in tic_tac_toe.rb line 55 to run the tests

RSpec.describe TicTacToe do

  describe "#ArrayBoard" do
    pArray = TicTacToe::Board.new
    tablero = Array.new(3){Array.new(3)}
    
    it "Making the board" do
      expect(pArray.craftingBoard(3)).to eq([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
    end

    it "Displaying the board" do
      expect(pArray.displayBoard(tablero)).to eq(true)
    end

    it "Checking the coords" do
      expect(pArray.coords_position(1, 3, tablero, "o")).to eq([false, true])
    end

    it "Checking row winner" do
      expect(pArray.check_rows(tablero, 3)).to eq(true)
    end

    it "Checking colum winner" do
      expect(pArray.check_colums(tablero, 3)).to eq(true)
    end

    it "Checking diagonal winner" do
      expect(pArray.check_diagonal(tablero, 3)).to eq(true)
    end

    it "Checking second diagonal winner" do
      expect(pArray.check_diagonal_invertida(tablero, 3)).to eq(true)
    end

    it "Checking if the board is full" do 
      expect(pArray.full_board(tablero, 3)).to eq(true)
    end
    
  end

end
