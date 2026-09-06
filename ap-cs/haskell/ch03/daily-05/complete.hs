import Control.Monad
import Encryption -- comment this out or change to the next line
-- import Main 
-- 2023-09-11: All numbers changed to least significant digit first.

main = status


check_bcount = [ bcount [1,1,0,0,1] [0,1,0,1,1] == 8
               , bcount [0] [0,0,1] == 5
               ]
check_ensureLen = [
        ensureLen 4 [1] == [1,0,0,0]
        , ensureLen 3 [1,0,1,0,1] == [1,0,1,0,1]
        ]

check_and' = [ and' 0 0 == 0,
               and' 0 1 == 0,
               and' 1 0 == 0,
               and' 1 1 == 1
             ]

check_bitwiseAnd = [bitwiseAnd [1,0,0,1,1]
                               [1,0,1,0,1]
                     ==        [1,0,0,0,1]
                    ,bitwiseAnd [1,0,1,0,1,1,1,1]
                                [1,0,0,1,1,0,1,0]
                      ==        [1,0,0,0,1,0,1,0]
                   ]

-- name starts with underscore so that it does not conflict with your name
_xor' :: Int -> Int -> Int
_xor' a b = if a == b then 0 else 1

_or' :: Int -> Int -> Int                   
_or' a b = max a b

check_bitwise = [bitwise _xor' [1,0,1,0] [0,1,1,0] == [1,1,0,0]
                ,bitwise _or'  [0,1,0,1,0,1]
                               [0,0,1,1,1,1]
                  ==           [0,1,1,1,1,1]
                ]

checkExpects = [
  txtToBin "A" == [[1]]
  , txtToBin "Good" == [[1,1,1],[1,0,0,1,0,1],[1,0,0,1,0,1],[0,1,1,1,1]]
  , binToMsg [[1,1,1],[1,0,0,1,0,1],[1,0,0,1,0,1],[0,1,1,1,1]]
    == 
    [1,1,1,0,0,0,1,0,0,1,0,1,1,0,0,1,0,1,0,1,1,1,1,0]
  , "EA86 zA2KeA20Jy6E" == encrypt "Snake" "Voldemort Returns"
  ]
    

check_all = --  False : -- for testing
            check_bcount ++
            check_ensureLen ++
            check_and' ++
            check_bitwiseAnd ++
            check_bitwise ++
            checkExpects

checks = [("bcount", check_bcount),
          ("ensureLen", check_ensureLen),
          ("and'", check_and'),
          ("bitwiseAnd", check_bitwiseAnd),
          ("txtToBin, binToMsg, encrypt", checkExpects)
         ]
            
status = do
  putStrLn "Checking everything"
  print $ check_all

  when (and check_all) $ do putStrLn "ALL GOOD :)"

  unless (and check_all) $ do
    putStrLn "\nNot ok? Checking individual items\n"
    print "check_bcount"
    print $ check_bcount
    forM_ checks $ \(desc, result) ->
      do putStrLn ""
         putStrLn desc
         print $ result

