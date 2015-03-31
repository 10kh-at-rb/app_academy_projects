require './chess.rb'

class Board

  BOARD_SIZE = 8
  SETUP = {
    :rook => [0, 7],
    :knight => [1, 6],
    :bishop => [2, 5],
    :king => [4],
    :queen => [3]
  }

  def self.default_grid
    Array.new(BOARD_SIZE) {Array.new(BOARD_SIZE)}
  end

  attr_accessor :grid


  def initialize(grid = self.class.default_grid)
    @grid = grid #some method
  end

  def build_grid
    royalty_row("black",0)
    pawn_row("black",1)
    pawn_row("yellow",6)
    royalty_row("yellow",7)

  end

  def royalty_row(color, row)
    @grid[row][0] = Rook.new(self, [row, 0], color)
    @grid[row][1] =  Knight.new(self, [row, 1], color)
    @grid[row][2] =  Bishop.new(self, [row, 2], color)
    @grid[row][3] =  Queen.new(self, [row, 3], color)
    @grid[row][4] =  King.new(self, [row, 4], color)
    @grid[row][5] =  Bishop.new(self, [row, 5], color)
    @grid[row][6] =  Knight.new(self, [row, 6], color)
    @grid[row][7] =  Rook.new(self, [row, 7], color)
  end

  def pawn_row(color, row)
    BOARD_SIZE.times do |column|
      @grid[row][column] = Pawn.new(self, [row, column], color)
    end
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
  end


  def valid_move?(pos)
    pos.all? { |coord| coord.between?(0, BOARD_SIZE-1) }
  end


end
