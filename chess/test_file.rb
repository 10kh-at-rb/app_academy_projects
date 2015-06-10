load './chess.rb'
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


bcheck = Board.new(Array.new(8) {Array.new(8)})

bcheck[4,4] = Queen.new(bcheck, [4,4], :yellow)
bcheck[1,0] = King.new(bcheck, [1,0], :black)
bcheck[3,0] = Rook.new(bcheck, [3,0], :black)
bcheck[6,0] = Rook.new(bcheck, [6,0], :yellow)

bcheck[3,0].move([5,0])
