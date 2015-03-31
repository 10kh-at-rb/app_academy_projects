class Piece

  def initialize(board, pos)
    @board = board
    @pos = pos
    @moves = []
  end

  def moves #override for pawn
    move_dirs.each do |move|
      pos = [pos[0] + move[0], pos[1] + move[1]]
      next unless pos.all?{|coord| coord.between?(0,8)}
      @moves << pos
    end
    @moves
  end





  #something to keep track of
end
