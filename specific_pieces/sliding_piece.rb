require 'piece'

class SlidingPiece < Piece

  BOARD_SIZE = Board::BOARD_SIZE

  STRAIGHT = self.delta_horizontal_vertical

  DIAGONAL = self.delta_diagonal

  def delta_horizontal_vertical
    possible = []
    (-(BOARD_SIZE)..BOARD_SIZE).each do |num|
      possible << [num, 0]
      possible << [0, num]
    end
    possible.reject {|coordinate| coordinate == [0,0]}
  end

  def delta_diagonal
    [].tap do |possible|
      (1..BOARD_SIZE).each do |num|
        possible << [num,num]
        possible << [num,-num]
        possible << [-num,-num]
        possible << [-num,num]
      end
    end
  end


  def initialize

  end









end
