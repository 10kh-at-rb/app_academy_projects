load 'checkers.rb'

board = Board.new
board.make_starting_grid
p1 = Piece.new(:black, board, [3,1])
p2 = Piece.new(:black, board, [4,3])
board[3,1] = p1
board[4,3] = p2
board[2,0].legal_jump?([4,2])
board[2,0].perform_jump([4,2])


board.grid = Array.new(8) {Array.new(8)}
board.odd_row(:black, 4)
