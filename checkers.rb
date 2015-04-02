require 'byebug'
class Piece
  DELTAS = [
    [1, 1],
    [1, -1]
  ]

  KING_DELTAS = [
    [-1, 1],
    [-1, -1]
  ]

  attr_accessor :color, :board, :pos

  def initialize(color, board, pos)
    @king_piece = false
    @color, @board, @pos = color, board, pos
  end

  def inspect
    self.color.inspect
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

  attr_accessor :grid


  def initalize
    make_starting_grid
  end

  def [](*pos)
    i,j = pos
    @grid[i][j]
  end

  def []=(*pos, piece)
    i,j = pos
    @grid[i][j] = piece
  end

  def valid_pos?(pos)
    pos.all? { |coord| coord.between?(0,7) }
  end

  def make_starting_grid
    @grid = Array.new(BOARD) {Array.new(BOARD)}
    8.times do |row|
      case row
      when 0, 2
        even_row(:red, row)
      when 1
        odd_row(:red, row)
      when 5, 7
        odd_row(:black, row)
      when 6
        even_row(:black, row)
      end
    end
  end

  def odd_row(color, row)
    # byebug
    (0..7).each do |col|
      pos = [row, col]
      self[*pos] = Piece.new(color, self, [row, col]) if col.odd?
      end
    end
  end

  def even_row(color, row)
    (0..7).each do |col|
      pos = [row, col]
      self[*pos] = Piece.new(color, self, [row, col]) if col.even?
    end
  end

  # def fill_rows
  #   8.times do |i|
  #     case i
  #     when 0, 2
  #       color = :red
  #       start = 0
  #     when 1
  #       color = :red
  #       start = 1
  #     when 5, 7
  #       color = :black
  #       start = 1
  #     when 6
  #       color = :black
  #       start = 0
  #     else
  #       start = 0
  #     end
  #
  #     8.times do |j|
  #       j += start
  #       pos = [i,j]
  #       @grid[*i,j] = Piece.new(color, self, [i, j]) if j.even?
  #     end
  #   end
  # end




end

class Checkers

  def initialize
    @players = { white: HumanPlayer.new(:white),
                black: HumanPlayer.new(:black) }
  end

end
