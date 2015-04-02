class Board
  BOARD = 8

  attr_accessor :grid

  def initialize(grid = nil)
    if grid
      @grid = grid
    else
      @grid = make_starting_grid
    end
  end

  def on_board?(pos)
    row, col = pos
    pos.all? { |coord| coord.between?(0,7) }
  end

  def [](*pos)
    i,j = pos
    @grid[i][j]
  end

  def []=(*pos, piece)
    i,j = pos
    @grid[i][j] = piece
  end

  def valid_pos?(pos)
    pos.all? { |coord| coord.between?(0,7) }
  end

  def make_starting_grid
    grid = Array.new(BOARD) {Array.new(BOARD)}
    p "test 1"
    8.times do |row|
      case row
      when 0, 2
        grid[row] = even_row(:red, row)
        p "test 2"
      when 1
        grid[row] = odd_row(:red, row)
      when 5, 7
        grid[row] = odd_row(:black, row)
      when 6
        grid[row] = even_row(:black, row)
      end
    end
    grid
  end

  def odd_row(color, row)
    new_row = Array.new(BOARD)
    (0..7).each do |col|
      new_row[col] = Piece.new(color, self, [row, col]) if col.odd?
      new_row[col] = nil if col.even?
    end
    new_row
  end

  def even_row(color, row)
    new_row = Array.new(BOARD)
    (0..7).each do |col|
      new_row[col] = Piece.new(color, self, [row, col]) if col.even?
      new_row[col] = nil if col.odd?
    end
    new_row
  end

  def render
    render_str = "          0 1 2 3 4 5 6 7 <==== columns\n"
    @grid.each_with_index do |row, index|
      count = index
      render_str << "   row: #{index} "
      row.each do |el|
        count.even? ? background = :white : background = :light_white
        el.nil? ? r = "  ".colorize(:background => background) : r = "#{el.render} ".colorize(:background => background) #if count.even?
        render_str << r
        count += 1
      end
      render_str << "\n"
    end
    render_str
  end

  def display
    puts render
  end

  def dup
    new_grid = Array.new(BOARD) { Array.new(BOARD) }
    dup_board = Board.new(new_grid)
    BOARD.times do |row|
      BOARD.times do |col|
        pos = [row, col]
        self[*pos].nil? ? dup_board[*pos] = nil : dup_board[*pos] = self[*pos].dup(dup_board)
      end
    end
    dup_board
  end
end
