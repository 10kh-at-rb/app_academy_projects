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
    until bombs.count == BOMBS
      row = (0...GRID_SIZE).to_a.sample
      col = (0...GRID_SIZE).to_a.sample
      pos = row, col
      bombs << pos unless bombs.include?(pos)
    end
    nil
  end

  def initialize(board = self.class.default_board,
                 bombs = self.class.place_bombs
                )
    @board = board
    @bombs = bombs
    @flags = []
  end

  def reveal(pos)

    root_tile = Tile.new(pos, self)

    unless root_tile.bomb?
      tile_queue = [root_tile]

      until tile_queue.empty?
        current_tile = tile_queue.shift
        bomb_count = current_tile.neighbor_bomb_count

        board[current_tile.position] = bomb_count
        tile_queue.concat(current_tile.neighbors) if bomb_count < 1
      end
    end

    root_tile
  end

  def [](pos)
    row, col = pos[0], pos[1]
    board[row][col]
  end

  def []=(pos, bomb_count)
    row, col = pos[0], pos[1]
    board[row][col] = bomb_count
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

  def initialize(position, board, parent = nil)
    @position = position
    @parent = parent
    @neighbors = find_neighbors(board)   #FLAGGED FOR REFACTOR
    @board = board
  end


  def find_neighbors(board)
    [].tap do |neighbors|
      x, y = position
      NEARBY.each do |(dx, dy)|
        new_position = [x + dx, y + dy]
        if new_position.all? { |pos| pos.between(0, board.grid_size - 1)}
          neighbor = Tile.new(new_position, board, self)
          neighbors << neighbor unless neighbor.revealed?
        end
      end
    end
  end

  def neighbor_bomb_count
    count = 0
    neighbors.each do |neighbor|
      count += 1 if neighbor.bomb?
    end
    count
  end

  def flagged?
    return true if board.flags.include?(self.position)
    false
  end

  def bomb?
    return true if board.bombs.include?(self.position)
    false
  end

  def revealed?
    return true unless board[position].empty?
    false
  end

  def

end
