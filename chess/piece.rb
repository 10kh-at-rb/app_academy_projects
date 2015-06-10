require './board.rb'
require 'byebug'
class Piece

  attr_reader :color, :board
  attr_accessor :pos

  def initialize(board, pos, color)
    @board = board
    @pos = pos
    @color = color
  end

  # def moves #override for pawn
  #   @moves
  # end

  def inspect
    [self.class, self.color].inspect
  end

  def move(finish)
    raise ArgumentError if self.moves_into_check?(finish) || !self.moves.include?(finish)

    old_pos = self.pos.dup
    @board[*finish] = self
    self.pos = finish
    @board[*old_pos] = nil

    self.moved = true if self.class == Pawn
  end

  def dup(board = @board)
    self.class.new(board,self.pos.dup,self.color)
  end

  def moves_into_check?(finish)
    new_board = @board.dup
    new_pos = self.pos.dup
    new_board[*finish] = new_board[*new_pos]
    new_board[*new_pos] = finish
    new_board[*new_pos] = nil

    new_board.in_check?(self.color)

  end







  #something to keep track of
end
