withoutDoubles :: Int -> Int -> Bool -> Int
withoutDoubles = undefined

testWithout = [withoutDoubles 2 3 True == 5
              , withoutDoubles 3 3 True == 7
              , withoutDoubles 3 3 False == 6
              ]

xyBalance :: String -> Bool
xyBalance = undefined

testXY = [xyBalance "pixxa" == False
         , xyBalance "pixely art" == True
         , xyBalance "xay anythxng" == False
         ]

teaParty :: Int -> Int -> Int
teaParty tea candy = undef
   where good = 1
         great = 2
         bad = 0

testTea = [ bad == teaParty 1 3
          , bad == teaParty 0 20
          , good == teaParty 7 9
          , great == teaParty 6 12
          , great == teaParty 15 7
          , bad == teaParty 2 7
          , bad == teaParty 7 2
           ]
     where good = 1
           great = 2
           bad = 0

unluckyOne2 :: [Int] -> Bool
unluckyOne2 = undefined

testUnlucky12 = [ True == unluckyOne2 [1,3,5,9]
                , True == unluckyOne2 [7,1,3,5,9]
                , True == unluckyOne2 [9,3,1,3]
                , False == unluckyOne2 [9,3,1,4,3]
                , False == unluckyOne2 []
                , False == unluckyOne2 [2,1,5,3]
                ]
