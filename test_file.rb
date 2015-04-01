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
board.collect_moves(:black)


bcheck = Board.new
bcheck[1,0] = King.new(bcheck, [1,0], :black)
bcheck[1,1] = Rook.new(bcheck, [1,1], :yellow)
