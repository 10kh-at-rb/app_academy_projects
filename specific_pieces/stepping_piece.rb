require './piece.rb'

class SteppingPiece < Piece


  def generate_moves
    move_dirs.each do |move|
      # byebug
      new_x, new_y = @pos[0] + move[0], @pos[1] + move[1]
      new_move = [new_x, new_y]
      if @board.grid[new_move[0]][new_move[1]].nil?
        @moves << new_move
      elsif @board.grid[new_move[0]][new_move[1]].color != self.color
        @moves << new_move
      end
    end
    nil
  end


end
