{--
This is the section you have to change to make
your code match with mine.

I make a 1x1 game for the demo, so all of the functions are easy
and the first person to play wins.
--}

type Board = [[Int]]

drawBoard :: Board -> String
drawBoard board = show $ simplify board

is_won :: Board -> Bool
is_won board = False

is_move_legal :: Board -> Int -> Bool
is_move_legal board col = (col == 0)

make_move :: Board -> Int -> Int -> Board
make_move board col player = [[player]]

-- Just for the demo: force the board to be 1x1.
simplify board = [[board!!0!!0]]
                             
{--
User Interface plan for Connect Four

event_loop:
* draw board
* is it won? 
    - print the win message 
* not won? 
    - get a move
    - event loop with updated board and next player
--}

main :: IO()
main = do
  let board = make_board 8 6
  event_loop board 1

event_loop :: Board -> Int -> IO()
event_loop board player = do
  putStrLn $ drawBoard board

  if is_won board then do
    win_message board player
    return ()
  else do
    col <- get_move player
    handle_move board player col

handle_move :: Board -> Int -> Int -> IO ()
handle_move board player col
    | col == -99              = goodbye
    | is_move_legal board col = event_loop new_board (next_ player)
    | otherwise = complain_and_restart
    where complain_and_restart = do
              putStrLn "ERROR: That is not a legal move."
              event_loop board player
          new_board = make_move board col player
          goodbye = do putStrLn "You quit"

make_board :: Int -> Int -> Board
make_board cols rows =
    [ [0 | _ <- [1..cols] ] | _ <- [1..rows] ]

next_ player = 3 - player

get_move :: Int -> IO Int
get_move player = do
  putStrLn $ "(Enter -99 to quit.)"
  putStrLn $ "Player " ++(show player)++" moves."
  putStr $ "Column [0-7]? "
  x <- getLine
  return (get_number x)

-- get_number returns -1 for any invalid input
get_number :: String -> Int
get_number colIn
    = case (reads colIn)::[(Int,String)] of
        [(colnum, "")] -> colnum
        _              -> -1
                       
win_message board player = do
    putStrLn $ "The game is over"
    putStrLn $ "Player "++(show $ next_ player)++" won!"
    -- note: win computed at the start of the next turn
    -- so current player is the loser
             
           
