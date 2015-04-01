require './specific_pieces/stepping_piece.rb'

class King < SteppingPiece
  KING_MOVES = [
    [0,1],
    [1,0],
    [1,1],
    [-1,-1],
    [0,-1],
    [-1,0],
    [1,-1],
    [-1,1]
  ]

  def move_dirs
    KING_MOVES
  end

  def render
    if self.color == COLORS[1]
      "\u2654"
    else
      "\u265a"
    end
  end


end
