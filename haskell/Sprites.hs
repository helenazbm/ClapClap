module Sprites where

getLetterSprite:: Char -> String
getLetterSprite 'a' = unlines [
    "▄▀▀▄",
    "█■■█",
    "█  █"
    ]
getLetterSprite 'b' = unlines [
    "█▀▀▄",
    "█■■█",
    "█▄▄▀"
    ]
getLetterSprite 'c' = unlines [
    "▄▀▀▄",
    "█   ",
    "▀▄▄▀"
    ]
getLetterSprite 'd' = unlines [
    "█▀▀▄",
    "█  █",
    "█▄▄▀"
    ]
getLetterSprite 'e' = unlines [
    "▄▀▀▀",
    "█■■ ",
    "▀▄▄▄"
    ]
getLetterSprite 'f' = unlines [
    "▄▀▀▀",
    "█■■ ",
    "█   "
    ]
getLetterSprite 'g' = unlines [
    "▄▀▀ ",
    "█ ▀█",
    "▀▄▄▀"
    ]
getLetterSprite 'h' = unlines [
    "█  █",
    "█■■█",
    "█  █"
    ]
getLetterSprite 'i' = unlines [
    " ▐▌ ",
    " ▐▌ ",
    " ▐▌ "
    ]
getLetterSprite 'j' = unlines [
    "   █",
    "   █",
    "▀▄▄▀"
    ]
getLetterSprite 'k' = unlines [
    "█ ▄▀",
    "██  ",
    "█ ▀▄"
    ]
getLetterSprite 'l' = unlines [
    "█   ",
    "█   ",
    "▀▄▄▄"
    ]
getLetterSprite 'm' = unlines [
    "█▄▄█",
    "█▐▌█",
    "█  █"
    ]
getLetterSprite 'n' = unlines [
    "█▄ █",
    "█ ▀█",
    "█  █"
    ]
getLetterSprite 'o' = unlines [
    "▄▀▀▄",
    "█  █",
    "▀▄▄▀"
    ]
getLetterSprite 'p' = unlines [
    "█▀▀▄",
    "█▄▄▀",
    "█   "
    ]
getLetterSprite 'q' = unlines [
    "▄▀▀▄",
    "█  █",
    " ▀▀▄"
    ]
getLetterSprite 'r' = unlines [
    "█▀▀▄",
    "█▄▄▀",
    "█  █"
    ]
getLetterSprite 's' = unlines [
    "▄▀▀▀",
    " ▀▀▄",
    "▄▄▄▀"
    ]
getLetterSprite 't' = unlines [
    "▀▐▌▀",
    " ▐▌ ",
    " ▐▌ "
    ]
getLetterSprite 'u' = unlines [
    "█  █",
    "█  █",
    "▀▄▄▀"
    ]
getLetterSprite 'v' = unlines [
    "█  █",
    "▐▌▐▌",
    " ▐▌ "
    ]
getLetterSprite 'w' = unlines [
    "█  █",
    "█▐▌█",
    "█▀▀█"
    ]
getLetterSprite 'x' = unlines [
    "▀▄▄▀",
    " ▐▌ ",
    "▄▀▀▄"
    ]
getLetterSprite 'y' = unlines [
    "▀▄▄▀",
    " ▐▌ ",
    " ▐▌ "
    ]
getLetterSprite 'z' = unlines [
    "▀▀▀█",
    " ▄▀ ",
    "█▄▄▄"
    ]

getColorPrefix :: String -> String
getColorPrefix "red" = "\ESC[31m"
getColorPrefix "green" = "\ESC[32m"
getColorPrefix "default" = "\ESC[0m"

paintString :: String -> String -> String
paintString color content = getColorPrefix color ++ content ++ getColorPrefix "default"

paintLetterPixels :: [Char] -> String -> Char -> String
paintLetterPixels [] color char = ""
paintLetterPixels (head : tail) color char = paintString color [head] ++ paintLetterPixels tail color char

concatLine:: [[String]] -> Int -> String -> String
concatLine (h: []) lineNumber spacer = h !! lineNumber
concatLine (h: t) lineNumber spacer = h !! lineNumber ++ spacer ++ concatLine t lineNumber spacer

concatLines:: [[String]] -> Int -> String -> [String]
concatLines sprites lineNumber spacer
  | lineNumber < length (sprites !! 0) = [concatLine sprites lineNumber spacer] ++ concatLines sprites (lineNumber+1) spacer
  | otherwise = []

makeTextLines:: [(Char, String)] -> String -> [String]
makeTextLines dataList spacer =
    let sprites = map (\(char, color) -> paintLetterPixels (getLetterSprite char) color '|') dataList
    in (concatLines (map (\sprite -> lines sprite) sprites) 0 spacer)