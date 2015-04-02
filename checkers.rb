class Piece
  def initialize(pos)
    @king_piece = false
  end

  def perform_slide

  end

  def perform_jump
  end

  def move_diffs
  end

  def legal_move?(from,to)
    #determines whether the player can go from one spot & to another
  end

  def maybe_promote
    #checks to see if the piece is on the backrow
  end


end


class Board
  BOARD = 8

  def self.default_grid
    Array.new(BOARD) {Array.new(BOARD)}
  end

  def initalize(grid = self.class.default_grid)
    @grid = grid
  end

end

class Checkers

end
