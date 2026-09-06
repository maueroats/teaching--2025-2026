module ConnectFour where

board_width = 7
board_height = 6

type Player = Int -- really only two choices
type Posn = (Int, Int) -- coordinates
type Piece = (Player, Posn)
type Board = [Piece]
type BoardOld = [[Int]] -- the matrix representation

drawBoard :: Board -> String
drawBoard board  = "FIXME:\n" ++ (show board)

is_won :: Board -> Bool
is_won board = False

is_move_legal :: Board -> Int -> Bool
is_move_legal board col = (col == 0)

make_move :: Board -> Int -> Int -> Board
make_move board col player = [(player,(0,col))] -- totally wrong



