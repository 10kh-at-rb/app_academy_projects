require 'piece'

class SlidingPiece < Piece

  BOARD_SIZE = Board::BOARD_SIZE

  VERTICAL_HORIZONTAL = self.delta_horizontal_vertical

  DIAGONAL_HORIZONTAL = self.delta_diagonal

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
    #location = [3,4]
    @move_straight = false
    @move_diagonal = false
  end

  def moves
    #depending on move dirs fills the @move array
  end

  def move_dirs
  end
  #move dirs









end
