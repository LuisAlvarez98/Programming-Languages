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

-- === distance ===
distance :: (Double, Double) -> (Double, Double) -> Double
distance (x1, y1) (x2, y2) = sqrt(((x1 - x2) ** 2) + ((y1 - y2) ** 2))

-- === shift ===

shift :: [t] -> Int -> [t]
shift [] _ = []
shift (h:t) n  = let 
                  len = length(h:t)
                 in 
                  take (len) . 
                  drop (n * (-1) `mod` len) .
                  cycle $ (h:t)

-- === myFilter ===

-- Please note that this function takes two arguments.
-- The first one is a function of type (t -> Bool)
-- The second one is a list of a generic type, t.
myFilter :: (t -> Bool) -> [t] -> [t]
myFilter f [] = []
myFilter f (h:t) = if f(h) 
                      then h : myFilter f t
                      else myFilter f t
                    

getElems :: [Char] -> Int -> [Char]
getElems [] _ = []
getElems _ 0 = []
getElems (h:t) x = h : getElems t (x - 1)

getRest :: Int -> [Char] -> [Char]
getRest _ [] = []
getRest 0 (h:t) = h:t
getRest x (h:t) = getRest (x-1) t

-- === crossover ===
crossover :: [Char] -> [Char] -> Int -> ([Char], [Char])
crossover [] [] _ = ([],[])
crossover lstA lstB 0 = (lstA, lstB)
crossover lstA lstB x = let
                aElems = getElems lstA x
                bElems = getElems lstB x
                aRest = getRest x lstA
                bRest = getRest x lstB 
                in (aElems ++ bRest, bElems ++ aRest)


-- === xSort ===
xSort :: [(String, Int, Int)] -> [(String, Int, Int)]
xSort [] = []
xSort ((name, points,goals) : rest) = let
    f = (name, points, goals)
    leftList = filter (\(x, y, z) -> if points == y then goals < z else points < y ) rest
    rightList = filter (\(x, y, z) -> if points == y then goals >= z else points >= y) rest
    in
      (xSort leftList)  ++  [f] ++  (xSort rightList)

-- === treeSum ===

data Tree = Tree Int Tree Tree | E deriving Show

treeTraverse :: Tree -> [Int]
treeTraverse E = []
treeTraverse (Tree x l r) = x : treeTraverse l ++ treeTraverse r

treeSum :: Tree -> Int
treeSum tree = sum(treeTraverse tree) -- sum array result from treeTraverse

-- === Test cases ===

main = do
    print "=== distance ==="
    print $ distance (10, 20) (5, 15) -- 7.0710678118654755
    print "=== shift ==="
    print $ shift [3, 5, 1, 4, 2] 3 -- [1,4,2,3,5]
    print $ shift [3, 5, 1, 4, 2] (-3) -- [4,2,3,5,1]
    print $ shift "helloworld" 75 -- "worldhello"
    print "=== myFilter ==="
    print $ myFilter (> 3) [1, 2, 3, 4, 5, 6, 7] -- [4,5,6,7]
    print $ myFilter (\x -> x * 2 < 5) [1, 2, 3, 4, 5, 6, 7] -- [1,2]
    print "=== crossover ==="
    print $ crossover "aaaaa" "bbbbb" 3 -- ("aaabb","bbbaa")
    print $ crossover "aaaaa" "bbbbb" 1 -- ("abbbb","baaaa")
    print $ crossover "aaaaa" "bbbbb" 4 -- ("aaaab","bbbba")
    print "=== qSort ==="
    print $ xSort [("Pumas", 10, 3), ("America", 10, 5), ("Chivas", 11, 8), ("Cruz Azul", 11, 2), ("Tigres", 9, 4), ("Rayados", 9, 6)] -- [("Chivas",11,8),("Cruz Azul",11,2),("America",10,5),("Pumas",10,3),("Rayados",9,6),("Tigres",9,4)]
    print "=== treeSum ==="
    print $ treeSum (Tree 8 (Tree 5 (Tree 2 E E) (Tree 7 E E)) (Tree 9 E E)) -- 31