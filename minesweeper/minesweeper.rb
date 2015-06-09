require 'byebug'
require 'yaml'

class MineSweeper

  attr_reader :board

  def initialize(board = Board.new)
    @board = board
  end

  def play
    until board.over?
      display
      play_action(get_action)
    end

    end_game
  end

  def get_action
    loop do
      puts "(R)eveal, toggle a (F)lag or (S)ave game"
      input = gets.chomp.upcase
      return input if input.match(/R|S|F/)
    end
  end

  def play_action(action)
    case action
    when "R"
      board.reveal(get_coordinates)
    when "F"
      board.flag(get_coordinates)
    when "S"
      save_game
      board.over = true
      p "Game Saved."
      exit
    end
  end

  def get_coordinates
    loop do
      puts "Enter row, from 1 to #{board.grid_size}."
      row = gets.chomp.to_i - 1
      puts "Enter column, from 1 to #{board.grid_size}"
      column = gets.chomp.to_i - 1
      return [row, column] if board.grid[row][column].nil?
      puts "Please enter a valid co-ordinate"
    end
  end

  def render
    "".tap do |render_str|
      board.grid.each_with_index do |row, rindex|
        row.each_with_index do |el, cindex|
          if board.over? && board.bombs.include?([rindex, cindex])
            render_str << "B "
          elsif board.flags.include?([rindex, cindex])
            render_str << "F "
          elsif el.nil?
            render_str << "_ "
          else
            render_str << "#{el.to_s} "
          end
        end
        render_str << "\n"
      end
    end
  end

  def display
    puts render
  end

  def end_game
    if board.won?
      puts "Great job! You won."
    else
      display
      puts "Oops. You revealed a bomb!"
    end
  end

  def save_game
    serialize = self.to_yaml
    puts "Filename of save game (without extension): "
    filename = gets.chomp + ".ms"

    file = File.new("#{filename}", "w")
    file << serialize
    file.close
  end

end


class Board


  GRID_SIZE = 9
  BOMBS = 10


  def self.default_board
    Array.new(GRID_SIZE) {Array.new(GRID_SIZE)}
  end

  def self.place_bombs
    bombs = []
    until bombs.count == BOMBS
      row = (0...GRID_SIZE).to_a.sample
      col = (0...GRID_SIZE).to_a.sample
      pos = row, col
      bombs << pos unless bombs.include?(pos)
    end
    bombs
  end

  attr_reader :bombs, :grid_size
  attr_accessor :grid, :flags, :over

  def initialize(grid = self.class.default_board,
                 bombs = self.class.place_bombs
                )
    @grid = grid
    @bombs = bombs
    @flags = []
    @grid_size = GRID_SIZE
    @over = false
  end

  def reveal(pos)

    root_tile = Tile.new(pos, self)

    unless root_tile.bomb?
      tile_queue = [root_tile]

      until tile_queue.empty?
        current_tile = tile_queue.shift
        current_tile.find_neighbors
        bomb_count = current_tile.neighbor_bomb_count

        x, y = current_tile.position
        grid[x][y] = bomb_count
        tile_queue.concat(current_tile.neighbors) if bomb_count < 1
      end
    else
      @over = true
    end

  end

  def flag(pos)
    if @flags.include?(pos)
      @flags.delete(pos)
    else
      @flags << pos
    end
  end

  def won?
    empty = 0
    grid.each do |rows|
      rows.each do |el|
        empty += 1 if el.nil?
      end
    end
    empty == BOMBS
  end

  def over?
    if self.won?
      @over = true
    end
    @over
  end

  def [](pos)
    row, col = pos[0], pos[1]
    grid[row][col]
  end

  def []=(pos, value)
    row, col = pos[0], pos[1]
    grid[row][col] = value
  end

end


class Tile

  NEARBY = [
    [1,1],
    [1,-1],
    [1,0],
    [0,-1],
    [0,1],
    [-1,-1],
    [-1,0],
    [-1,-1]
  ]

  attr_reader :position, :parent, :neighbors, :board

  def initialize(position, board, parent = nil)
    @position = position
    @parent = parent
    @neighbors = []
    @board = board
  end


  def find_neighbors
    x, y = position
    NEARBY.each do |(dx, dy)|
      new_x = x + dx
      new_y = y + dy
      new_position = [new_x, new_y]
      if new_position.all? { |pos| pos.between?(0, board.grid_size - 1)}
        neighbor = Tile.new(new_position, board, self)
        neighbors << neighbor unless neighbor.revealed?
      end
    end

    nil
  end

  def neighbor_bomb_count
    count = 0
    neighbors.each do |neighbor|
      count += 1 if neighbor.bomb?
    end

    count
  end

  def bomb?
    board.bombs.include?(self.position)
  end

  def revealed?
    !board[position].nil?
  end

end

if __FILE__ == $PROGRAM_NAME && !ARGV.empty?
  filename = ARGV.shift
  serialize = YAML::load(filename)
  game = MineSweeper.new(serialize)
  game.play
else
  game = MineSweeper.new
  game.play
end
