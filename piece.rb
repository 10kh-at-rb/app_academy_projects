require './board.rb'
require 'byebug'
class Piece

  attr_reader :color, :pos, :board

  def initialize(board, pos, color)
    @board = board
    @pos = pos
    @color = color
  end

  def moves #override for pawn
    @moves
  end

  def inspect
    [self.class, self.color].inspect
  end






  #something to keep track of
end
