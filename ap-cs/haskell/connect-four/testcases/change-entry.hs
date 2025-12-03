type Board = [[Int]]
type BoardRow = [Int]
    
changeEntry :: Board -> Int -> Int -> Int -> Board
changeEntry = changeEntryRow

changeEntryRow :: Board -> Int -> Int -> Int -> Board
changeEntryRow [] _ _ _ = []
changeEntryRow (b:bs) col row newVal =
    currentValue' : moreResult
        where moreResult = changeEntryRow bs col (row - 1) newVal
              changedValue = changeEntryCol b col newVal
              currentValue' = if (row /= 0) then b else changedValue

changeEntryCol :: BoardRow -> Int -> Int -> BoardRow
changeEntryCol [] _ _ = []
changeEntryCol (b:bs) col newVal
    | col == 0  = newVal : moreResult
    | otherwise = b : moreResult
    where moreResult = changeEntryCol bs (col - 1) newVal
