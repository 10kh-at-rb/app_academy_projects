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

  def move(start, finish)
    raise "Can't move!" if self.moves_into_check?(start, finish) || !self.moves.include?(finish)

    @board[*start] = @board[*finish]
    @board[*start] = nil


  end

  def dup(board = @board)
    self.class.new(board,self.pos.dup,self.color)
  end

  def moves_into_check?(start,finish)
    new_board = @board.dup
    new_board[*start] = new_board[*finish]
    new_board[*start] = nil

    new_board.in_check?(self.color)

  end







  #something to keep track of
end
