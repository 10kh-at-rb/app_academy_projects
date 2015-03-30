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
  #array of arrays that = board state
  #array of bombs created in initialize or passed from prev. game
  #array of flags
  #array of revealed tile objects
  #



end


class Tile
  #initialize (parent = nil)
  #neighbors - array of tile objects
  #neighbor bomb count - integer
    #loop through neighbors array, bomb? generates neighbor bomb count
  #bomb?
  #revealed?
  #flagged?

end
