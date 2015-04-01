require './chess.rb'
require './piece.rb'
require 'byebug'

class Board

  BOARD_SIZE = 8
  COLORS = [:black, :yellow]


  def default_grid
    Array.new(BOARD_SIZE) {Array.new(BOARD_SIZE)}
  end

  attr_accessor :grid


  def initialize(grid = nil)
    if grid.nil?
      @grid = default_grid
      # build_grid
    else
      @grid = grid
    end
    @colors = COLORS
  end


  def build_grid
    # byebug
    self.royalty_row(@colors[0],0)

    pawn_row(@colors[0],1)
    pawn_row(@colors[1],6)
    self.royalty_row(@colors[1],7)
  end

  def royalty_row(color, row)
    arr = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]

    arr.each_with_index do |piece, col|

      self[row,col] = piece.new(self, [row, col], color)
    end

  end

  def in_check?(color)

    moves = collect_moves()
    moves.include?(king_position(color))
  end

  def move(start,end_pos)
    # checks to make sure the move doesn't put the player in check
    # board[end_pos] = board[start_pos]
    # board[start_pos] = nil
  end

  def collect_moves(color)
    all_possible_moves = []
    BOARD_SIZE.times do |row|
      BOARD_SIZE.times do |col|
        all_possible_moves.concat(self[row,col].moves) if self[row,col].color == color
      end
    end
    all_possible_moves
  end

  def king_position(color)
    BOARD_SIZE.times do |row|
      BOARD_SIZE.times do |col|
        return [row,col] if self[row,col].is_a?(King) && self[row,col].color == color
      end
    end
  end




  def pawn_row(color, row)
    BOARD_SIZE.times do |column|
      pos = [row,column]
      self[*pos] = Pawn.new(self, pos, color)
    end
  end

  def [](*pos)
    row, col = pos[0], pos[1]
    @grid[row][col]
  end

  def []=(*pos, piece)
    row, col = pos[0], pos[1]
    @grid[row][col] = piece
  end




    # grid.times do |row|
    #   case row
    #   when 0,1
    #     color = "black"
    #   when 2..5
    #     next
    #   when 6,7
    #     color = "yellow"
    #   end
    #   grid.times do |column|
    #
    #


  def valid_move?(pos)
    pos.all? { |coord| coord.between?(0, BOARD_SIZE-1) }
  end


end
