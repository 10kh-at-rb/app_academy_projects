require './piece.rb'

class SlidingPiece < Piece

  BOARD_SIZE = Board::BOARD_SIZE

  ORTHOGONAL - [
    [1, 0],
    [0, 1],
    [-1, 0],
    [0, -1]
  ]

  DIAGONAL = [
  [-1, 1],
  [1, -1],
  [1, 1],
  [-1, -1]
  ]



  def initialize

  end

  def moves
    move_dirs.each do |direction|
      while true
        times = 1
        new_x, new_y = direction[0] * times, direction[1] * times
        new_dir = [new_x, new_y]
        break if blocked?(new_dir) || !board.valid_pos?(new_dir)
        @moves << new_dir
        times += 1
      end
  end







end
