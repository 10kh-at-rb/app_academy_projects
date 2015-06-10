require './board.rb'
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
      form, to = parse(@player.play_turn)
      @board[*from].move(to)
      flip_turns
    end

    puts "Congrats #{@board.winner.to_s}. You won!"
  end

  def flip_turns
    @player == @player1 ? @player = @player2 : @player = @player1
  end

  def parse(turn)
    

  end


end



class Player

  def initialize(color)
    @color = color
  end


  def play_turn
    begin
      puts "Type the space you are moving from and to, like A7-A5, to move that piece."
      turn = gets.chomp

    rescue ArgumentError => e
      puts "We need a valid move, Try again."
      retry
    end

    turn
  end

  def get_input


end
