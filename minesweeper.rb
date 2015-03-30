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

  def initialize()
  end
  #array of arrays that = board state
  #array of bombs created in initialize or passed from prev. game
  #array of flags
  #array of revealed tile objects
  #

  def [](pos)
    row, col = pos[0], pos[1]
    @position[row][col]
  end

  def []=(pos, state)

  end


end


class Tile

  NEIGHBORS = [
    [1,1],
    [1,-1],
    [1,0],
    [0,-1],
    [0,1],
    [-1,-1],
    [-1,0],
    [-1,-1]
  ]

  #initialize (parent = nil)
  def initialize(position, board, parent = nil)
    @position = position
    @parent = parent
    @neighbors = find_neighbors(board)
    @board = board
  end

  #neighbors - array of tile objects
  #neighbor bomb count - integer
    #loop through neighbors array, bomb? generates neighbor bomb count
  #bomb?
  #revealed?
  #flagged?

  def find_neighbors(board)
    [].tap do |nearby|
      x, y = position
      NEIGHBORS.each do |(dx, dy)|
        new_position = [x + dx, y + dy]
        if new_position.all? { |pos| pos.between(0, board.grid_size - 1)}
          nearby << Tile.new([new_x, new_y], board, self)
        end
      end
    end
  end

end
