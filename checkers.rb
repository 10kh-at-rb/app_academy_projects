require 'byebug'
require 'colorize'
class Piece
  DELTAS = [
    [1, 1],
    [1, -1]
  ]

  KING_DELTAS = [
    [-1, 1],
    [-1, -1]
  ]

  attr_accessor :color, :board, :pos, :king

  def initialize(color, board, pos)
    @king = false
    @color, @board, @pos = color, board, pos
  end

  def inspect
    self.render
  end

  def king?
    @king
  end

  def maybe_promote
    return if king?
    current_row = self.pos[0]
    self.color == :red ? back_row = 7 : back_row = 0

    @king = true if current_row == back_row
  end


  def deltas
    @king == true ? DELTAS + KING_DELTAS : forward(DELTAS)
  end

  def forward(deltas)
    deltas.map do |(dx, dy)|
      self.color == :red ? [dx, dy] : [dx * -1, dy]
    end
  end


  def perform_slide(to)
    if legal_slide?(to)
      from = self.pos
      board[*to] = self
      board[*from] = nil
      self.pos = to
      maybe_promote
    else
      raise InvalidMoveError
    end
  end

  def legal_slide?(to)
    #checks if to place is empty & on board
    on_board = @board.on_board?(to)
    to_empty = @board[*to].nil?
    #checks if move is in the available moves for that position
    x_from, y_from = self.pos
    x_to, y_to = to
    delta = x_to - x_from, y_to - y_from
    valid = self.deltas.include?(delta)
    # byebug

    [on_board, to_empty, valid].all?
  end

  def perform_jump(to)
    if legal_jump?(to)

      x_from, y_from = self.pos
      x_to, y_to = to
      opponent_pos = (x_from + x_to) / 2, (y_from + y_to) / 2

      @board[*to] = self
      @board[*opponent_pos] = nil
      @board[*self.pos] = nil
      self.pos = to
      maybe_promote
    else
      raise InvalidMoveError
    end
  end


  def legal_jump?(to)
    # byebug
    #checks if to position is on the board
    on_board = @board.on_board?(to)

    #checks if to position is empty
    to_empty = @board[*to].nil?

    #checks if there is an opponent between from & to positions
    x_from, y_from = self.pos
    x_to, y_to = to
    opponent_pos = (x_from + x_to) / 2, (y_from + y_to) / 2
    has_opponent = !@board[*opponent_pos].nil? && @board[*opponent_pos].color != self.color

    [on_board, to_empty, has_opponent].all?
  end



  def render
    if @king_piece
      color == :red ? "☆".red : "★".black
    else
      color == :red ? "◎".red : "◉".black
    end
  end



end


class Board
  BOARD = 8

  attr_accessor :grid

  def initialize
    make_starting_grid
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

  def render
    render_str = "      0 1 2 3 4 5 6 7\n"
    @grid.each_with_index do |row, index|
      count = index
      render_str << "   #{index} "
      row.each do |el|
        count.even? ? background = :white : background = :light_white
        el.nil? ? r = "  ".colorize(:background => background) : r = "#{el.render} ".colorize(:background => background) #if count.even?
        render_str << r
        count += 1
      end
      render_str << "\n"
    end
    render_str
  end

  def display
    puts render
  end




end

class Checkers

  def initialize
    @players = { white: HumanPlayer.new(:white),
                black: HumanPlayer.new(:black) }
  end

end

class InvalidMoveError < StandardError
end
