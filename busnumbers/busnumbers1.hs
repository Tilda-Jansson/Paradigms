module Main where
import Data.List

main :: IO ()
main = do
  getLine
  b <- getLine
  let sortedInts = sort (strListToInts (words b) [])
  let list = findBusNumbers sortedInts
  putStrLn (unwords list)

-- Convert list of strings to list of ints
strListToInts :: [String] -> [Int] -> [Int]
strListToInts (x:xs) list = strListToInts xs (list ++ [read x])
strListToInts [x] list    = list ++ [read x]
strListToInts [] list     = list

findBusNumbers :: [Int] -> [String]
findBusNumbers [] = []
findBusNumbers (x:xs) 
            | xs == [] = show x : [] -- Om det bara är ett element kvar
            | (tail xs) == [] = show x : show (head xs) : [] -- Om det bara är två element kvar
            | x /= (head xs) - 1 = show x : findBusNumbers xs -- Om nästa tal inte är efterföljande
            | x == (head xs) - 1 && head xs /= (head (tail xs)) - 1 = show x : show (head xs) : findBusNumbers (tail xs) -- Om endast två eferföljande
            | otherwise = ((show x) ++ "-" ++ (show (fst lastNum))) : findBusNumbers (snd lastNum) -- Om fler än två på varandra efterföljande
                where
                    lastNum = findConsec xs 

-- Hitta konsekutiva tal
findConsec :: [Int] -> (Int, [Int])
findConsec (x:xs)
        | xs == [] = (x, []) -- endast ett element
        | x == (head xs) - 1 = findConsec xs -- efterföljande
        | otherwise = (x, xs) -- Om inte efterföljande
