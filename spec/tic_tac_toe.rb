# require "./spec_helper"
RSpec.describe TicTacToe::Board do

  describe "#ArrayBoard" do
    pArray = TicTacToe::Board.new
    it "Salida del tablero" do
      expect(pArray.craftingBoard(3)).to eq( [[nil,nil,nil],[nil,nil,nil],[nil,nil,nil]])
    end
  end

  describe "#Coordenadas erroneas" do
    coords = TicTacToe::Board.new
    it "booleano fake_cords = true" do 
      expect(coords.wrong_coords(0, 4, 3, false)).to eq(true)
    end
  end
end
