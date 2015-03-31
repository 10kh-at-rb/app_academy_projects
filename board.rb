require './chess.rb'

class Board

  BOARD_SIZE = 8
  SETUP = {
    :rook => [0, 7],
    :knight => [1, 6],
    :bishop => [2, 5],
    :king => [4],
    :queen => [3]
  }

  def self.default_grid
    Array.new(BOARD_SIZE) {Array.new(BOARD_SIZE)}
  end

  attr_accessor :grid


  def initialize(grid = self.class.default_grid)
    @grid = grid #some method
  end

  def build_grid

  end

  def build_piece_setup(color)
    pawns_row = Array.new(BOARD_SIZE) {Pawn.new(x,y)}
  end



end
