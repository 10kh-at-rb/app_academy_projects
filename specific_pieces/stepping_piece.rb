require './piece.rb'

class SteppingPiece < Piece


  def moves
    move_dirs.each do |move|
      new_x, new_y = @pos[0] + move[0], @pos[1] + move[1]
      new_dir = [new_x, new_y]
      next if !board[new_dir].empty? && board[new_dir].color == self.color#location is filled & of the same color.
      @moves << new_dir
    end
    @moves
  end


end
