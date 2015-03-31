class Queen < SlidingPieces

  def initialize
    @move_straight = true
    @move_diagonal = true
  end

  def move_dirs
    DIAGONAL + HORIZONTAL
  end

end
