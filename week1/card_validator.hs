{-# OPTIONS_GHC -Wall #-}



-- Exercise 1

-- toDigits converts an integer to a list of its compenent digits
toDigits :: Integer -> [Integer]
toDigits x
    | x <=0 = []
    | otherwise = toDigits (x `div` 10) ++ [x `mod` 10]


-- toDigitsRev converts an integer to a reversed list of its compenent digits
toDigitsRev :: Integer -> [Integer]
toDigitsRev = reverse . toDigits 



-- Exercise 2

-- doubleEveryOther doubles every other element in the list
-- starting from the penultimate item and then working backward
doubleEveryOther :: [Integer] -> [Integer]
doubleEveryOther = reverse . zipWith (*) p . reverse
    where p = 1:2:p



-- Exercise 3

-- sumDigits adds all the digits contained within a list of integers
sumDigits :: [Integer] -> Integer
sumDigits (x:xs) = sum (toDigits x) + sumDigits xs
sumDigits _ = 0
-- sumDigits xs = sum $ map (sum . toDigits) xs



-- Exercise 4

-- validate checks to see whether a credit card number is valid 
-- by ensuring that its checkdigit is zero
validate :: Integer -> Bool
validate x = sumDigits(doubleEveryOther(toDigits x)) `mod` 10 == 0



-- Test

main :: IO ()
main = do

    print "Expecting [1,2,3,4]"
    print (toDigits 1234)
    print (toDigits 1234 == [1,2,3,4])

    print "Expecting [4,3,2,1]"
    print (toDigitsRev 1234)
    print (toDigitsRev 1234 == [4,3,2,1])

    print "Expecting [16,7,12,5]"
    print (doubleEveryOther [8,7,6,5])
    print (doubleEveryOther [8,7,6,5] == [16,7,12,5])

    print "Expecting [1,4,3]"
    print (doubleEveryOther [1,2,3])
    print (doubleEveryOther [1,2,3] == [1,4,3])
    
    print "Expecting 22"
    print (sumDigits [16,7,12,5])
    print (sumDigits [16,7,12,5] == 22)

    print "Expecting True"
    print (validate  4012888888881881)
    print (validate  4012888888881881 == True)

    print "Expecting False"
    print (validate  4012888888881882)
    print (validate  4012888888881882 == False)

