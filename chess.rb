require 'board.rb'
require 'yaml'


class Chess
  attr_reader :player1, :player2
  def initialize
    @board = Board.new
    @player1 = Player.new(Board::COLORS[1])
    @player2 = Player.new(Board::COLORS[0])
    @player = @player1
  end

  def play
    until @board.over?
      @player.play_turn
      flip_turns
    end

    puts "Congrats #{@board.winner.to_s}. You won!"
  end

  def flip_turns
    @player == @player1 ? @player = @player2 : @player = @player1
  end


end



class Player

  def initialize(color)
    @color = color
  end


  def play_turn
  end

end
