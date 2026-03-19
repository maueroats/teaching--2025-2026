
changeEntry :: Int -> (a->a) -> [a] -> [a]
changeEntry idx changer xs = start ++ (newVal : end)
    where (start, edit:end) = splitAt idx xs
          newVal = changer edit

changeEntryCol :: Int -> Int -> [Int] -> [Int]    
changeEntryCol col newVal oneRow =
    changeEntry col (\x -> newVal) oneRow

changeEntryRowCol :: Int -> Int -> Int -> [[Int]] -> [[Int]]
changeEntryRowCol row col newVal allRows =
    changeEntry row (\oneRow -> changeEntryCol col newVal oneRow) allRows
