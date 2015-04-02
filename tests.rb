load 'checkers.rb'

board = Board.new
piece = Piece.new(:red, board, [1,2])
board[1,2] = piece

board.grid = Array.new(8) {Array.new(8)}
board.odd_row(:black, 4)
