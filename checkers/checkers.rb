require 'byebug'
require 'colorize'
require_relative 'piece'
require_relative 'board'
require_relative 'player'


class Checkers

  attr_reader :board
  attr_accessor :current_player, :players

  def initialize
    @players = { red: HumanPlayer.new(:red),
                black: HumanPlayer.new(:black) }
    @current_player = :red
    @board = Board.new
  end

  def play
    loop do
      players[@current_player].play_turn(board)
      switch_turns
    end
  end

  def switch_turns
    current_player == :red ? @current_player = :black : @current_player = :red
  end

end




class InvalidMoveError < StandardError

end
