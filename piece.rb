require './board.rb'
require 'byebug'
class Piece

  attr_reader :color

  def initialize(board, pos, color)
    @board = board
    @pos = pos
    @moves = []
    @color = color
  end

  def moves #override for pawn
    @moves
  end





  #something to keep track of
end
