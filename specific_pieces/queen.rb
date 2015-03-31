require './specific_pieces/sliding_piece.rb'

class Queen < SlidingPieces

  def initialize
    @move_straight = true
    @move_diagonal = true
  end

  def move_dirs
    DIAGONAL + ORTHOGONAL
  end

end
