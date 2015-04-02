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
    self.render
  end

  def deltas
    @king_piece == true ? DELTAS + KING_DELTAS : forward(DELTAS)
  end

  def forward(deltas)
    deltas.map do |(dx, dy)|
      self.color == :red ? [dx,dy] : [dx*-1,dy]
    end
  end

  def perform_slide(to)
    #moves the piece on the from the from spot to the to space
  end

  def perform_jump(to)
    if legal_jump?(to)

      x_from, y_from = self.pos
      x_to, y_to = to
      opponent_pos = (x_from - x_to) / 2, (y_from - y_to) / 2

      @board[*to] = self
      @board[*opponent_pos] = nil
      @board[*self.pos] = nil
      self.pos = to
    else
      raise "not a legal jump"
    end
  end


  def legal_jump?(to)
    #checks if to position is on the board
    on_board = @board.on_board?(to)

    #checks if to position is empty
    to_empty = @board[*to].nil?

    #checks if there is an opponent between from & to positions
    x_from, y_from = self.pos
    x_to, y_to = to
    opponent_pos = (x_from - x_to) / 2, (y_from - y_to) / 2

    opponent = !@board[*opponent_pos].nil? && @board[*opponent_pos].color != self.color

    [on_board, to_empty, opponent].all? { |condition| condition }
  end

  def legal_slide?(to)
    @board[*to].nil?
  end


  def maybe_promote
    #checks to see if the piece is on the backrow
  end

  def moves
  end

  def render
    if @king_piece
      color == :red ? "☆" : "★"
    else
      color == :red ? "◎" : "◉"
    end
  end



end


class Board
  BOARD = 8

  attr_accessor :grid


  def initalize
    @grid = make_starting_grid
  end

  def on_board?(pos)
    row, col = pos
    pos.all? { |coord| coord.between?(0,7) }
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

  def even_row(color, row)
    (0..7).each do |col|
      pos = [row, col]
      self[*pos] = Piece.new(color, self, [row, col]) if col.even?
    end
  end




end

class Checkers

  def initialize
    @players = { white: HumanPlayer.new(:white),
                black: HumanPlayer.new(:black) }
  end

end
