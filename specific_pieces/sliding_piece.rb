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


  def generate_moves
    # byebug
    move_dirs.each do |direction|
      times = 1
      while true
        new_x, new_y = (direction[0] * times), (direction[1] * times)
        new_move = [new_x + self.pos[0], new_y + self.pos[1]]

        if !@board.valid_move?(new_move)
          break
        elsif filled?(new_move) && @board[new_move].color == self.color
          break
        elsif filled?(new_move) && @board[new_move].color != self.color
          @moves << new_move
          break
        else
          @moves << new_move
        end
        times += 1
      end
    end
    nil
  end

  def filled?(pos)
    !@board[pos].nil?
  end







end
