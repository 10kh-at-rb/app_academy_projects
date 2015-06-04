class Piece
  DELTAS = [
    [1, 1],
    [1, -1]
  ]

  KING_DELTAS = [
    [-1, 1],
    [-1, -1]
  ]

  attr_accessor :color, :board, :pos, :king

  def initialize(color, board, pos)
    @king = false
    @color, @board, @pos = color, board, pos
  end

  def inspect
    self.render
  end

  def king?
    @king
  end

  def perform_moves(move_sequence)
    if valid_move_seq?(move_sequence)
      perform_moves!(move_sequence)
    else
      raise InvalidMoveError.new "You can't perform this move!"
    end
  end




  def perform_moves!(move_sequence)
    if move_sequence.flatten.count < 3
      # byebug
      if legal_slide?(move_sequence[0])
        self.perform_slide(move_sequence[0])
      elsif legal_jump?(move_sequence[0])
        self.perform_jump(move_sequence[0])
      else
        raise InvalidMoveError.new "You can't perform this move!"
      end

    else
      move_sequence.each_with_index do |move, index|
        raise InvalidMoveError.new "Invalid move, move no. #{index}." if !self.legal_jump?(move)
        self.perform_jump(move)
      end
    end
  end

  def valid_move_seq?(move_seq)
    begin
        new_board = @board.dup
        current_pos = self.pos.dup
        new_board[*current_pos].perform_moves!(move_seq)
    rescue InvalidMoveError
      false

    else
      true
    end


  end


  def maybe_promote
    return if king?
    current_row = self.pos[0]
    self.color == :red ? back_row = 7 : back_row = 0

    @king = true if current_row == back_row
  end


  def deltas
    @king == true ? DELTAS + KING_DELTAS : forward(DELTAS)
  end

  def forward(deltas)
    deltas.map do |(dx, dy)|
      self.color == :red ? [dx, dy] : [dx * -1, dy]
    end
  end


  def perform_slide(to)
    if legal_slide?(to)
      from = self.pos
      board[*to] = self
      board[*from] = nil
      self.pos = to
      maybe_promote
    else
      raise InvalidMoveError "Illegal slide!"
    end
  end

  def legal_slide?(to)
    #checks if to place is empty & on board
    on_board = @board.on_board?(to)
    to_empty = @board[*to].nil?
    #checks if move is in the available moves for that position
    x_from, y_from = self.pos
    x_to, y_to = to
    delta = x_to - x_from, y_to - y_from
    valid = self.deltas.include?(delta)
    # byebug

    [on_board, to_empty, valid].all?
  end

  def perform_jump(to)
    if legal_jump?(to)

      x_from, y_from = self.pos
      x_to, y_to = to
      opponent_pos = (x_from + x_to) / 2, (y_from + y_to) / 2

      @board[*to] = self
      @board[*opponent_pos] = nil
      @board[*self.pos] = nil
      self.pos = to
      maybe_promote
    else
      raise InvalidMoveError.new "Illegal jump!"
    end
  end


  def legal_jump?(to)
    # byebug
    #checks if to position is on the board
    on_board = @board.on_board?(to)

    #checks if to position is empty
    to_empty = @board[*to].nil?

    #checks if there is an opponent between from & to positions
    x_from, y_from = self.pos
    x_to, y_to = to
    opponent_pos = (x_from + x_to) / 2, (y_from + y_to) / 2
    has_opponent = !@board[*opponent_pos].nil? && @board[*opponent_pos].color != self.color

    [on_board, to_empty, has_opponent].all?
  end



  def render
    if king?
      color == :red ? "☆".red : "★".black
    else
      color == :red ? "◎".red : "◉".black
    end
  end

  def dup(board)
    new_piece = Piece.new(self.color, board, self.pos.dup)
  end



end
