require './specific_pieces/stepping_piece.rb'


class Knight < SteppingPiece
  KNIGHT_MOVES = [
    [-2, -1],
    [-2,  1],
    [-1, -2],
    [-1,  2],
    [ 1, -2],
    [ 1,  2],
    [ 2, -1],
    [ 2,  1]
  ]


  def move_dirs
    KNIGHT_MOVES
  end

  def render
    if self.color == COLORS[1]
      "\u2658"
    else
      "\u265e"
    end
  end


end
