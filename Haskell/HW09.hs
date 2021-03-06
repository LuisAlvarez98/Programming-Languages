-- ====================
-- Complete the following functions and submit your file to Canvas.
-- ====================
-- Do not change the names of the functions. 
-- Do not change the number of arguments in the functions.
-- If your file cannot be loaded by the Haskell compiler, your submission may be cancelled. 
-- Then, submit only code that works.
-- ====================
-- Grading instructions:
-- There is a series of test cases for each function. In order to state that your function
-- "works as described", your output must be similar to the expected one in each case.

-- === invert ===

invert :: [t] -> [t]
invert [] = []
invert (head:tail) = invert(tail) ++ [head]

-- === or ===

listor :: [Int] -> [Int] -> [Int]
listor [] [] = []
listor (a:b) (c:d) = 
    if a == 1 || c == 1
        then [1] ++ listor b d        
        else [0] ++ listor b d  
-- === multiples ===

multiples :: [Int] -> Int -> [Int]
multiples [] _ = []
multiples (h:t) x = if mod h x == 0
                    then [h] ++ multiples t x
                    else multiples t x
-- === differences ===

diffHelper :: [Int] -> Int -> [Int]
diffHelper [] _ = []
diffHelper [i] x  = [abs(i - x)]
diffHelper (h:t) x = abs(h - head t) : diffHelper t x

differences :: [Int] -> [Int]
differences [] = []
differences [x] = [0]
differences (h:t) = diffHelper (h:t) h


-- === toBinaryString ===

toBinaryString :: Int -> [Char]
toBinaryString 0 = ['0']
toBinaryString 1 = ['1']
toBinaryString x = if mod x 2 == 0
                   then toBinaryString(quot x 2) ++ ['0']
                   else toBinaryString(quot x 2) ++ ['1']

-- === modulo ===

modulo :: Int -> Int -> Int
modulo x y = if x - y == 0
             then 0
             else if x >= y
                then modulo (x - y) y
                else x
            -- 17 - 2 = 15
            -- 15 -2 = 13 
            -- 13 - 2= 11
            -- 11 - 2 = 9
            -- 9 - 2 = 7
            -- 7 -2 = 5
            -- 5 - 2 = 3
            -- 3 - 2 = 1
            -- 1 - 2
-- === evaluate ===

evaluate :: [Double] -> Double -> Double
evaluate [] _ = 0
evaluate lst x = (head lst) * (x ** fromIntegral((length lst - 1))) + evaluate (tail lst) x

-- === cleanString ===

cleanStringHelper :: [Char] -> Char -> Bool
cleanStringHelper [] _ = False
cleanStringHelper (h:t) x = if h == x
                        then True
                        else cleanStringHelper t x

cleanString :: [Char] -> [Char]
cleanString [] = ""
cleanString (h:t) = if cleanStringHelper t h
                    then cleanString t
                    else [h] ++ cleanString t

-- === iSort ===

isSortHelper :: [Int] -> Int -> [Int]
isSortHelper [] _ = []
isSortHelper lstA x = if x > (head lstA)
                    then (head lstA) : isSortHelper (tail lstA) x
                    else x : lstA

iSort :: [Int] -> [Int]
iSort [] = []
iSort [x] = [x]
iSort (h:t) = isSortHelper (iSort t) h


enigma01 :: [Char] -> Int
enigma01 [_, ’b’, c] = 0
enigma01 (_: ’b’: c) = 1
enigma01 lst = 2

-- === Test cases ===

main = do 
    print "=== invert ==="
    print $ invert ([] :: [Int])-- []
    print $ invert [1, 2, 3, 4, 5] -- [5,4,3,2,1]
    print $ invert "hello world!" -- "!dlrow olleh"
    print "=== listor ==="
    print $ listor [1, 1, 0] [0, 1, 0] -- [1,1,0]
    print $ listor [1, 0, 1, 0] [0, 0, 1, 1] -- [1,0,1,1]
    print $ listor [1, 0, 1, 0, 1] [1, 1, 1, 0, 0] -- [1,1,1,0,1]
    print "=== multiples ==="
    print $ multiples [2, 4, 5, 6] 2 -- [2,4,6]
    print $ multiples [9, 27, 8, 15, 4] 3 -- [9,27,15]
    print $ multiples [9, 8, 17, 5] 6 -- []
    print "=== differences ==="
    print $ differences [1, 2, 4, 8, 20] -- [1,2,4,12,19]
    print $ differences [5, 9, 13, 27, 100, 91, 4] -- [4,4,14,73,9,87,1]
    print $ differences [99] -- [0]
    print $ differences [] -- [] 
    print "=== toBinaryString ==="
    print $ toBinaryString 0 -- "0"
    print $ toBinaryString 1 -- "1"
    print $ toBinaryString 7 -- "111"
    print $ toBinaryString 32 -- "100000"
    print $ toBinaryString 1024 -- "10000000000"
    print "=== modulo ==="
    print $ modulo 10 2 -- 0
    print $ modulo 15 4 -- 3
    print $ modulo 20 9 -- 2
    print $ modulo 77 10 -- 7
    print "=== evaluate ==="
    print $ evaluate ([] :: [Double]) 100 -- 0.0
    print $ evaluate [2, 3.1, 10, 0] 2 -- 48.4
    print $ evaluate [10, 0] 2 -- 20.0
    print $ evaluate [1, 2, 3, 4, 5] 3 -- 179.0
    print "=== cleanString ==="
    print $ cleanString ([] :: String) -- ""
    print $ cleanString "yyzzza" -- "yza"
    print $ cleanString "aaaabbbccd" -- "abcd"
    print "=== iSort ==="
    print $ iSort [] -- []
    print $ iSort [1] -- [1]
    print $ iSort [1, 6, 3, 10, 2, 14] -- [1,2,3,6,10,14]