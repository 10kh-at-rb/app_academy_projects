require 'byebug'
require 'yaml'

class MineSweeper

    def initialize(board = Board.new)
      @board = board
    end

    def play
      until @board.over?
        display
        action = get_action
        case action
        when "R"
          @board.reveal(get_coordinates)

        when "F"
          @board.flag(get_coordinates)
        when "S"
          save_game
          p "Game Saved."
          return
        else
          next
        end
      end

      if @board.all_revealed?
        puts "Great job! You won."
      else
        display
        puts "Oops. You revealed a bomb!"
      end
    end

    def get_action
      loop do
        puts "(R)eveal, toggle a (F)lag or (S)ave game"
        input = gets.chomp.upcase
        return input if input.match(/r|s|f/)
      end
    end

    def get_coordinates
      loop do
        puts "Enter row, from 1 to #{@board.grid_size}."
        row = gets.chomp.to_i - 1
        puts "Enter column, from 1 to #{@board.grid_size}"
        column = gets.chomp.to_i - 1
        return [row, column] if @board[row][column].nil?
        puts "Please enter a valid co-ordinate"
      end
    end

  def render
    render_str = ""
    @board.each_with_index do |row, rindex|
      row.each_with_index do |el, cindex|
        if @board.over? && @board.bombs.include?([rindex, cindex])
          render_str << "B"
        elsif el.nil?
          render_str << "_"
        elsif @board.flags.include?([rindex, cindex])
          render_str << "F"
        else
          render_str << el.to_s
        end
      end
      render_str << "\n"
    end
    render_str
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
  attr_accessor :board, :flags, :over

  def initialize(board = self.class.default_board,
                 bombs = self.class.place_bombs
                )
    @board = board
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
        board[x][y] = bomb_count
        tile_queue.concat(current_tile.neighbors) if bomb_count < 1
      end
    end

    root_tile
  end

  def flag(pos)
    if @flags.include?(pos)
      @flags.delete(pos)
    else
      @flags << pos
    end
  end

  def all_revealed?
    empty = 0
    self.each do |rows|
      rows.each do |el|
        empty += 1 if el.nil?
      end
    end
    @over = (empty == BOMBS)
  end

  def over?
    @over
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

  def bomb?
    return true if @board.bombs.include?(self.position)
    false
  end

  def revealed?
    return true unless @board[position].nil?
    false
  end

end
