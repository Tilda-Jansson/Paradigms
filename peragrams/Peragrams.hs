import Data.List

import Data.Ord


main :: IO ()
main = do
    arg <- getLine
    putStrLn (show (peragrams arg))

--Om strängen har längd 1, returnera 0

-- Om strängen har jämn längd, sortera och gruppera strängen sådant att alla bokstäver grupperas till listor.
-- Mappa därefter length funktionen på varje list-element 
-- Filtrera därefter bort alla udda tal från listan
-- Ta därefter ut längden av listan
-- Kör en helper-funktion som korrigerar värdet beroende på om den är jämn eller inte
-- Om strängen ursprungligtvis är udda, gör samma sak som för jämn förutom helper-funktionen, och dekrementera slutvärdet med 1
peragrams :: String -> Int
peragrams str
    |length str == 1 = 0
    |even (length str) = helper (length (filter odd (map length ( group ( sort str)))))
    |otherwise = length (filter odd (map length ( group ( sort str)))) - 1

helper :: Int -> Int 
helper a
    |a == 0 = 0
    |otherwise = a - 1
