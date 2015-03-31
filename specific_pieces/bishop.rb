require './specific_pieces/sliding_piece.rb'

class Bishop < SlidingPiece

  def move_dirs
    DIAGONAL
  end

end
