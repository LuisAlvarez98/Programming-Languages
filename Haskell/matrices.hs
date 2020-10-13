
add :: [[Double]] -> [[Double]] -> [[Double]]
add [] [] = []
add m1 [] = m1
add [] m2 = m2
add m1 m2 = (map (\ (x,y) -> x + y) (zip (head m1) (head m2))) : (add (tail m1) (tail m2))
-- add m1 m2 = zipWith (\x y -> zipWith (\a b -> a + b) x y) m1 m2

transpose :: [[Double]] -> [[Double]]
transpose([]:_) = []
transpose x = (map head x) : transpose (map tail x)

myMap :: (a -> b) -> [a] -> [b]
myMap _ [] = []
myMap f (h : t) = (f h) : (myMap f t)

main = do   
    print $ add[[1, 2, 3], [4,5,6]] [[10,20,30], [40,50,60]]
