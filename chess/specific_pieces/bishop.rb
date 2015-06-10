require './specific_pieces/sliding_piece.rb'

class Bishop < SlidingPiece


  def move_dirs
    DIAGONAL
  end

  def render
    if self.color == Board::COLORS[1]
      "\u2657"
    else
      "\u265d"
    end
  end

end
