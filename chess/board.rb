require './chess.rb'
require './piece.rb'
require 'colorize'

class Board

  BOARD_SIZE = 8
  COLORS = [:black, :white]


  def default_grid
    Array.new(BOARD_SIZE) {Array.new(BOARD_SIZE)}
  end

  attr_accessor :grid



  def initialize(grid = nil)
    if grid.nil?
      @grid = default_grid
      build_grid
    else
      @grid = grid
    end

  end


  def build_grid
    # byebug
    self.royalty_row(COLORS[0],0)

    pawn_row(COLORS[0],1)
    pawn_row(COLORS[1],6)
    self.royalty_row(COLORS[1],7)
  end

  def royalty_row(color, row)
    arr = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]
    arr.each_with_index do |piece, col|
      self[row,col] = piece.new(self, [row, col], color)
    end

  end

  def in_check?(color)
    opponent = other_color(color)
    moves = collect_moves(opponent)
    moves.include?(king_position(color))
  end

  def collect_moves(color)

    all_possible_moves = []
    BOARD_SIZE.times do |row|
      BOARD_SIZE.times do |col|
        next if self[row,col].nil?
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

  def other_color(color)
    # byebug
    color == COLORS[0] ? COLORS[1] : COLORS[0]
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

  def checkmate?(color)
    self.in_check?(color) && self.collect_moves(color).empty?
  end

  def over?
    COLORS.any? {|color| checkmate?(color) }
  end

  def winner
    if checkmate?(COLOR[0])
      COLOR[1]
    else
      COLOR[0]
    end
  end

  def valid_move?(pos)
    pos.all? { |coord| coord.between?(0, BOARD_SIZE-1) }
  end

  def dup
    new_grid = self.default_grid
    new_board = Board.new(new_grid)
    # byebug

    BOARD_SIZE.times do |row|
      BOARD_SIZE.times do |col|
        next if self[row,col].nil?
        new_board[row,col] = self[row,col].dup(new_board)
      end
    end
    new_board
  end

  def render
    render = ""
    check = false
    @grid.each do |rows|
      rows.each do |el|
        if el.nil?
          render << "  ".on_white if check
          render << "  ".on_light_white if !check
        else
          render << "#{el.render} ".on_white if check
          render << "#{el.render} ".on_light_white if !check
        end
        check == false ? check = true : check = false
      end
      check == false ? check = true : check = false
      render << "\n"
    end

    render
  end


  def display
    puts render
  end



end
