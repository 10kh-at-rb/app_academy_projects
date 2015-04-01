require './board.rb'
require 'byebug'
class Piece

  attr_reader :color, :pos, :moves, :board

  def initialize(board, pos, color)
    @board = board
    @pos = pos
    @moves = []
    @color = color
  end

  def moves #override for pawn
    @moves
  end

  def inspect
    print [self.class, self.color]
  end






  #something to keep track of
end
