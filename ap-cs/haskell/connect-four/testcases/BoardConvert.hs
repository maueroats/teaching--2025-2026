
type Player = Int
type Posn = (Int, Int)
type Piece = (Player, Posn)
type Board = [Piece]

boardConvertToPieces :: [[Int]] -> [Piece]

boardConvertToPieces  matrix = [ (player, (x, fix y)) |
                           (row, y) <- zip matrix [0..],
                           (player, x) <- zip row [0..],
                           player /= 0 ]
         where fix y = length matrix - y - 1
               -- the bottom row is y=0

getPlayer :: Int -> Int -> [Piece] -> Player
getPlayer x0 y0 pieces 
    | null ps   = 0
    | otherwise = head ps
  where ps = [ player | (player,(x,y)) <- pieces, x == x0, y==y0 ]

boardConvertToMatrix :: Int -> Int -> [Piece] -> [[Int]]
boardConvertToMatrix width height pieces =
  reverse [[ getPlayer x y pieces | x <- [0..width-1]] | y <- [0..height-1] ]

board1 = [[0,0,0,0,0,0],
          [0,0,0,0,0,0],
          [1,2,2,2,0,0],
          [1,1,1,2,0,0],
          [1,2,1,1,0,2]]

board1converted = 
     [ (1,(0,2)), (2,(1,2)), (2,(2,2)), (2,(3,2)), 
       (1,(0,1)), (1,(1,1)), (1,(2,1)), (2,(3,1)),
       (1,(0,0)), (2,(1,0)), (1,(2,0)), (1,(3,0)), (2,(5,0)) ]

       
testBoardConvert = [
   boardConvertToPieces board1 == board1converted
   , boardConvertToMatrix 6 5 board1converted == board1
   ]
