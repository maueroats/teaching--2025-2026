import System.IO

-- Be careful: your encrypt might have inputs in the opposite order from mine!

-- Make a file "lyrics.txt" on your computer or repl.it

main = do
       putStrLn "Enter Passphrase: "
       passphrase <- getLine

       lyrics <- readFile "lyrics.txt"
       putStrLn $ encrypt passphrase lyrics  

-- of course use your own encrypt function

encrypt :: String -> String -> String
encrypt key message = take 21 message

