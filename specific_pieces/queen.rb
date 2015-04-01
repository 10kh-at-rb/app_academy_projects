require './specific_pieces/sliding_piece.rb'

class Queen < SlidingPiece

  def move_dirs
    DIAGONAL + ORTHOGONAL
  end

end
