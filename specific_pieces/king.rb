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


end
