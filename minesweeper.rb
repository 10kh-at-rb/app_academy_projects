require 'byebug'

class MineSweeper


    #initialize
      #creates board object or gets saved one

    #run game method
    #game loop until over?
      #render board
      #ask user what they want to do
      #get coordinates for that
      #change board state
      #check win/loss
      #end
    # messages about end game state

  def render
  end

  def display
    puts render
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
  attr_accessor :board, :flags

  def initialize(board = self.class.default_board,
                 bombs = self.class.place_bombs
                )
    @board = board
    @bombs = bombs
    @flags = []
    @grid_size = GRID_SIZE
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
        board[x][y] = bomb_count
        tile_queue.concat(current_tile.neighbors) if bomb_count < 1
      end
    end

    root_tile
  end

  def [](pos)
    row, col = pos[0], pos[1]
    board[row][col]
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
      if new_position.all? { |pos| pos.between?(0, @board.grid_size - 1)}
        neighbor = Tile.new(new_position, @board, self)
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

  def flagged?
    return true if @board.flags.include?(self.position)
    false
  end

  def bomb?
    return true if @board.bombs.include?(self.position)
    false
  end

  def revealed?
    return true unless @board[position].nil?
    false
  end

end
