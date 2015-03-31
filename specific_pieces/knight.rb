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


end
