module Sprites where

import Licao
import Exercicio

getLetra:: Char -> String
getLetra 'a' = unlines [
    "▄▀▀▄",
    "█■■█",
    "█  █"
    ]
getLetra 'b' = unlines [
    "█▀▀▄",
    "█■■█",
    "█▄▄▀"
    ]
getLetra 'c' = unlines [
    "▄▀▀▄",
    "█   ",
    "▀▄▄▀"
    ]
getLetra 'd' = unlines [
    "█▀▀▄",
    "█  █",
    "█▄▄▀"
    ]
getLetra 'e' = unlines [
    "▄▀▀▀",
    "█■■ ",
    "▀▄▄▄"
    ]
getLetra 'f' = unlines [
    "▄▀▀▀",
    "█■■ ",
    "█   "
    ]
getLetra 'g' = unlines [
    "▄▀▀ ",
    "█ ▀█",
    "▀▄▄▀"
    ]
getLetra 'h' = unlines [
    "█  █",
    "█■■█",
    "█  █"
    ]
getLetra 'i' = unlines [
    " ▐▌ ",
    " ▐▌ ",
    " ▐▌ "
    ]
getLetra 'j' = unlines [
    "   █",
    "   █",
    "▀▄▄▀"
    ]
getLetra 'k' = unlines [
    "█ ▄▀",
    "██  ",
    "█ ▀▄"
    ]
getLetra 'l' = unlines [
    "█   ",
    "█   ",
    "▀▄▄▄"
    ]
getLetra 'm' = unlines [
    "█▄▄█",
    "█▐▌█",
    "█  █"
    ]
getLetra 'n' = unlines [
    "█▄ █",
    "█ ▀█",
    "█  █"
    ]
getLetra 'o' = unlines [
    "▄▀▀▄",
    "█  █",
    "▀▄▄▀"
    ]
getLetra 'p' = unlines [
    "█▀▀▄",
    "█▄▄▀",
    "█   "
    ]
getLetra 'q' = unlines [
    "▄▀▀▄",
    "█  █",
    " ▀▀▄"
    ]
getLetra 'r' = unlines [
    "█▀▀▄",
    "█▄▄▀",
    "█  █"
    ]
getLetra 's' = unlines [
    "▄▀▀▀",
    " ▀▀▄",
    "▄▄▄▀"
    ]
getLetra 't' = unlines [
    "▀▐▌▀",
    " ▐▌ ",
    " ▐▌ "
    ]
getLetra 'u' = unlines [
    "█  █",
    "█  █",
    "▀▄▄▀"
    ]
getLetra 'v' = unlines [
    "█  █",
    "▐▌▐▌",
    " ▐▌ "
    ]
getLetra 'w' = unlines [
    "█  █",
    "█▐▌█",
    "█▀▀█"
    ]
getLetra 'x' = unlines [
    "▀▄▄▀",
    " ▐▌ ",
    "▄▀▀▄"
    ]
getLetra 'y' = unlines [
    "▀▄▄▀",
    " ▐▌ ",
    " ▐▌ "
    ]
getLetra 'z' = unlines [
    "▀▀▀█",
    " ▄▀ ",
    "█▄▄▄"
    ]

getLetra '_' = unlines [
    "████",
    "████",
    "████"
    ]

getCor :: String -> String
getCor "red" = "\ESC[31m"
getCor "green" = "\ESC[32m"
getCor "default" = "\ESC[0m"

aplicaCorPixels :: String -> String -> String
aplicaCorPixels color content = getCor color ++ content ++ getCor "default"

aplicaCor :: [Char] -> String -> String
aplicaCor [] color = ""
aplicaCor (head : tail) color = aplicaCorPixels color [head] ++ aplicaCor tail color

concatLinha :: [[String]] -> Int -> String -> String
concatLinha (h: []) lineNumber spacer = h !! lineNumber
concatLinha (h: t) lineNumber spacer = h !! lineNumber ++ spacer ++ concatLinha t lineNumber spacer

concatLinhas:: [[String]] -> Int -> String -> [String]
concatLinhas sprites lineNumber spacer
  | lineNumber < length (sprites !! 0) = [concatLinha sprites lineNumber spacer] ++ concatLinhas sprites (lineNumber + 1) spacer
  | otherwise = []

formataLinhasTexto :: [(Char, String)] -> String -> [String]
formataLinhasTexto [] spacer = []
formataLinhasTexto dataList spacer =
    let (head, tail) = splitAt 8 dataList
        sprites = map (\(char, color) -> aplicaCor (getLetra char) color) head
    in (concatLinhas (map (\sprite -> lines sprite) sprites) 0 spacer) ++ formataLinhasTexto tail spacer


------------------------------------------- Lições -------------------------------------------

ex1 :: Char -> Exercicio
ex1 char = Exercicio [(char, "default"), (char, "default"), (char, "default"), (char, "default"),
    (char, "default"), (char, "default"), (char, "default"), (char, "default")] "nao_iniciado"

ex2 :: Char -> Char -> Exercicio
ex2 char1 char2 = Exercicio [(char1, "default"), (char1, "default"), (char1, "default"), (char2, "default"),
    (char1, "default"), (char1, "default"), (char1, "default"), (char2, "default"),
    (char1, "default"), (char1, "default"), (char1, "default"), (char2, "default"),
    (char1, "default"), (char1, "default"), (char1, "default"), (char2, "default")] "nao_iniciado"

ex3 :: Char -> Char -> Exercicio
ex3 char1 char2 = Exercicio [(char1, "default"), (char2, "default"), (char1, "default"), (char2, "default"),
    (char1, "default"), (char2, "default"), (char1, "default"), (char2, "default"),
    (char1, "default"), (char2, "default"), (char1, "default"), (char2, "default"),
    (char1, "default"), (char2, "default"), (char1, "default"), (char2, "default")] "nao_iniciado"

ex4 :: Char -> Char -> Char -> Exercicio
ex4 char1 char2 char3 = Exercicio [(char1, "default"), (char1, "default"), (char3, "default"), (char2, "default"),
    (char2, "default"), (char1, "default"), (char1, "default"), (char3, "default"),
    (char2, "default"), (char1, "default"), (char1, "default"), (char3, "default"),
    (char2, "default"), (char1, "default"), (char1, "default"), (char3, "default"),
    (char2, "default"), (char1, "default"), (char1, "default"), (char3, "default"),
    (char2, "default"), (char1, "default"), (char1, "default"), (char3, "default")] "nao_iniciado"

licao1 :: Licao
licao1 = Licao "instrucao" [ex1 'j', ex2 'f' 'j', ex3 '_' 'j', ex4 'j' 'f' '_'] "nao_iniciado"

licoes :: [Licao]
licoes = [licao1]