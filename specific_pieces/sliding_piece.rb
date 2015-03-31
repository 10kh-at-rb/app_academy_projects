require './piece.rb'

class SlidingPiece < Piece

  BOARD_SIZE = Board::BOARD_SIZE

  ORTHOGONAL = [
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
        new_move = [new_x + self.pos[0], new_y + self.pos[1]]

        if filled?(new_move) && board[new_move].color == self.color
          break
        elsif filled?(new_move) && board[new_move].color != self.color
          @moves << new_move
          break
        else
          @moves << new_move
        end

        times += 1
      end
    end
  end

  def filled?(pos)
    !board[pos].empty?
  end







end
