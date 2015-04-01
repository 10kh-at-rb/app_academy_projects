require './piece.rb'

class SteppingPiece < Piece


  def generate_moves
    move_dirs.each do |move|
      # byebug
      new_x, new_y = @pos[0] + move[0], @pos[1] + move[1]
      new_move = [new_x, new_y]
      if @board[new_move].nil?
        @moves << new_move
      elsif @board[new_move].color != self.color
        @moves << new_move
      end
    end
    nil
  end


end
