load 'checkers.rb'

board = Board.new
board.make_starting_grid
piece = Piece.new(:black, board, [3,1])
board[3,1] = piece
board[2,0].legal_jump?([4,2])


board.grid = Array.new(8) {Array.new(8)}
board.odd_row(:black, 4)
