require './board.rb'
require 'byebug'
class Piece

  # attr_reader :moves

  def initialize(board, pos)
    @board = board
    @pos = pos
    @moves = []
  end

  def moves #override for pawn
    # debugger
    move_dirs.each do |move|
      pos = [@pos[0] + move[0], @pos[1] + move[1]]
      next unless pos.all? { |coord| coord.between?(0, Board::BOARD_SIZE - 1) }
      @moves << pos
    end

    @moves
  end





  #something to keep track of
end
