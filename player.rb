class HumanPlayer
  attr_reader :color

  def initialize(color)
    @color = color
  end

  def play_turn(board)
    board.display
    puts "It's your turn #{color.to_s.capitalize}"
    from = get_input("Which Piece do you want to move?")
    moves = []
    count = 1
    to = to_input("Where to? If its multiple moves, seperate them by a space")
    board[*from].perform_moves(to)

    rescue InvalidMoveError => e
      puts "Error: #{e.message}"
      retry
    end
  end

  def get_input(prompt)
    puts prompt
    gets.chomp.split(',').map {|coord_s| Integer(coord_s) }
  end

  def to_input(prompt)
    puts prompt
    answer = gets.chomp
    if answer.length == 3
      [answer.split(',').map {|coord_s| Integer(coord_s) }]
    else
      answers = answer.split(' ')
      [].tap do |final|
        answers.each do |answer|
          final << answer.split(',').map {|coord_s| Integer(coord_s) }
        end
      end
    end

  end
