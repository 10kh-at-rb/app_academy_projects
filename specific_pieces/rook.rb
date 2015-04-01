require './specific_pieces/sliding_piece.rb'

class Rook < SlidingPiece

  def move_dirs
    ORTHOGONAL
  end

  def render
    if self.color == COLORS[1]
      "\u2656"
    else
      "\u265c"
    end
  end

end
