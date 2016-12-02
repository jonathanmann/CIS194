{-# OPTIONS_GHC -Wall #-}



-- Exercise 5

-- define new types
type Peg = String
type Move = (Peg,Peg)

-- hanoi 
hanoi :: Integer -> Peg -> Peg -> Peg -> [Move]
hanoi x a b c
    | x <= 0 = [] 
    | otherwise = hanoi (x-1) a c b ++ [(a,b)] ++ hanoi(x-1) c b a


-- Exercise 6
hanoi' :: Integer -> Peg -> Peg -> Peg -> Peg -> [Move]
hanoi' 0 a b c d = []
hanoi' x a b c d = hanoi' (x-1) a c b d ++ [(a,b)] ++ hanoi' (x-1) c b a d



-- Test

main :: IO ()
main = do

    print "Expecting [('a','c'), ('a','b'), ('c','b')])"
    print (hanoi 2 "a" "b" "c")
    print (hanoi 2 "a" "b" "c" == [("a","c"), ("a","b"), ("c","b")])

    print "Expecting [('a','c'), ('a','b'), ('c','b')]"
    print (hanoi' 2 "a" "b" "c" "d")
    print (hanoi' 2 "a" "b" "c" "d" == [("a","c"), ("a","b"), ("c","b")])
