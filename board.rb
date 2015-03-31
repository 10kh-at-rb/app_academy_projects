class Board

  BOARD_SIZE = 8

  def self.default_board
    Array.new(BOARD_SIZE) {Array.new(BOARD_SIZE)}
  end


  def initialize
    @board_size = size

end
