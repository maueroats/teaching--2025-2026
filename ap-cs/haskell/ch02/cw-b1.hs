import Debug.Trace

-- 1.
p1 :: Int -> Bool
p1 n = (n `mod` 17 == 0)

{--
2. The problem is that when x is not odd, Haskell keeps searching the list [1,3..] forever.
--}

p2 xs = [ x | x <- xs, x `mod` 7 == 0 && x `mod` 2 == 1]  -- or x `mod` 14 == 7

-- 3.

after_x_or_long :: String -> Bool
after_x_or_long word = (word >= "x") || (length word > 4)
p3 words = [ word | word <- words, after_x_or_long word ]

-- A lot of people just did (head word > 'x') -- that's ok with me.

-- 4.
-- Very surprisingly hard to get right; more than one possible approach.
-- Sometimes low, other times high (depends in whether you test above or below)
good_rootfinder_helper what_root num lower upper 
  | cube == num       =  num
  | lower > upper    = upper   -- one candidate, does not work
  | cube < num        = iterate (candidate+1) upper
  | otherwise         = iterate lower (candidate-1)
     where candidate = (lower + upper) `div` 2
           cube = candidate^what_root
           iterate = good_rootfinder_helper what_root num
           
good_rootfinder what_root num = good_rootfinder_helper what_root num 0 num

