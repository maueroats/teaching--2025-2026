module UIConnectFour where

import ConnectFour 

{--
User Interface plan for Connect Four

repeat while not is_won board:

"Player 1 plays. Which column? "
c <- read
if is_legal_move board c:
    make_move
    player = switch player
else 
    warn "illegal move"
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

make_board :: Int -> Int -> Board
make_board cols rows = []
--    [ [0 | _ <- [1..cols] ] | _ <- [1..rows] ]

next_ player = 3 - player

get_move player = do
  putStrLn $ "(Enter -99 to quit.)"
  putStrLn $ "Player " ++(show player)++" moves."
  putStr $ "Column [0-6]? "
  x <- getLine
  return (get_number x)

-- get_number returns -1 for any invalid input
get_number :: String -> Int
get_number colIn
    = case (reads colIn)::[(Int,String)] of
        [(colnum, "")] -> colnum
        _              -> -1
                       
handle_move board player col
    | col == -99              = goodbye
    | is_move_legal board col = event_loop new_board (next_ player)
    | otherwise = complain_and_restart
    where complain_and_restart = do
              putStrLn "ERROR: That is not a legal move."
              event_loop board player
          new_board = make_move board col player
          goodbye = do putStrLn "You quit"

win_message board player = do
    putStrLn $ "The game is over"
    putStrLn $ "Player "++(show $ next_ player)++" won!"
    -- note: win computed at the start of the next turn
    -- so current player is the loser
             
           
