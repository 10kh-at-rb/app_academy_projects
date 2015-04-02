load 'checkers.rb'

board = Board.new
a = board[5,5]
a.perform_slide([4,4])
a.perform_slide([3,3])
b = board[6,6]
b.perform_slide([5,5])
c = board[2,2]
c.valid_move_seq?([[4,4],[6,6]])
