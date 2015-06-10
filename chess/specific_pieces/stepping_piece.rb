require './piece.rb'

class SteppingPiece < Piece


  def moves
    moves = []
    move_dirs.each do |move|
      # byebug
      new_x, new_y = @pos[0] + move[0], @pos[1] + move[1]
      new_move = [new_x, new_y]

      next if !@board.valid_move?(new_move)

      if board[*new_move].nil?
        moves << new_move
      elsif @board[*new_move].color != self.color
        moves << new_move
      end
    end
    moves.uniq
  end


end
