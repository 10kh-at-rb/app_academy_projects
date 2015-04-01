require './specific_pieces/sliding_piece.rb'

class Queen < SlidingPiece

  def move_dirs
    DIAGONAL + ORTHOGONAL
  end

  def render
    if self.color == COLORS[1]
      "\u2655"
    else
      "\u265b"
    end
  end

end
