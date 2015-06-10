require './piece.rb'

class Pawn < Piece
  attr_accessor :moved

  #all deltas are defaulted to black, for white row needs to be multiplied by -1
  TAKE_DELTAS = [
    [1, 1],
    [1, -1]
  ]

  MOVE_DELTAS = [
    [1, 0],
    [2, 0]
  ]

  def initialize(board,pos,color)
    super(board,pos,color)
    @moved = false
  end

  def moved?
    @moved
  end

  def moves
    moves = []
    #
    take_deltas = self.take_deltas
    move_deltas = self.move_deltas

    take_deltas.each do |(dx, dy)|
      new_move = [pos[0] + dx, pos[1] + dy]
      next if !@board.valid_move?(new_move)
      moves << new_move if can_take?(new_move)
    end

    move_deltas.each do |(dx, dy)|
      # byebug
      new_move = [pos[0] + dx, pos[1] + dy]
      break if !@board.valid_move?(new_move)
      break if !@board[*new_move].nil?
      moves << new_move
    end

    moves.uniq
  end

  def can_take?(pos)
    !@board[*pos].nil? && @board[*pos].color != self.color
  end

  def take_deltas
    if !self.is_white?
      TAKE_DELTAS
    else
      TAKE_DELTAS.map{|(dx,dy)| [dx * -1, dy]}
    end
  end

  def move_deltas
    if !self.is_white?
      move_deltas = MOVE_DELTAS
    else
      move_deltas = MOVE_DELTAS.map { |(dx,dy)| [dx*-1,dy] }
    end

    return [move_deltas.first] if self.moved?
    move_deltas
  end

  def is_white?
    self.color == Board::COLORS[1]
  end

  def render
    if self.color == Board::COLORS[1]
      "\u2659"
    else
      "\u265f"
    end
  end



end
