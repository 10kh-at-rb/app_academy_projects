load './board.rb'
load './piece.rb'
load './specific_pieces/sliding_piece.rb'
load './specific_pieces/stepping_piece.rb'
load './specific_pieces/knight.rb'
load './specific_pieces/king.rb'
load './specific_pieces/bishop.rb'
load './specific_pieces/queen.rb'
load './specific_pieces/rook.rb'
load './specific_pieces/pawn.rb'


board = Board.new

bishop = Bishop.new(board, [2,2], "black")
king = King.new(board, [6,6], "black")
knight = Knight.new(board, [7,7], "black")
rook = Rook.new(board, [0,0], "yellow")
pawn = Pawn.new(board, [5,5], "yellow")
queen = Queen.new(board, [1,2], "black")


board.grid[2][2] = bishop
board.grid[6][6] = king
board.grid[0][0] = rook
board.grid[7][7] = knight


bcheck = Board.new(Array.new(8) {Array.new(8)})
bcheck[1,0] = King.new(bcheck, [1,0], :black)
bcheck[1,1] = Rook.new(bcheck, [1,1], :yellow)
