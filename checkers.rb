class Piece
  DELTAS = [
    [1, 0],
    [-1, 0]
  ]

  def initialize(color, board, pos)
    @king_piece = false
    @pos, @board = board, pos
  end

  def perform_slide(from,to)
    #moves the piece on the from the from spot to the to space
  end

  def perform_jump(from,to)
  end

  def move_diffs

  end

  def available_jump?
    #checks to see if there is a piece at the delta & if the delta *2
    #is empty
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

  def [](pos)
    i,j = pos
    @grid[i][j]
  end

  def []=(pos, piece)
    i,j = pos
    @grid[i][j] = piece
  end

end

class Checkers

  def initialize
    @players = { white: HumanPlayer.new(:white),
                black: HumanPlayer.new(:black) }
  end

end
