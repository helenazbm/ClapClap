module Sprites where

import Licao
import Exercicio
import System.IO

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

getLetra ' ' = unlines [
    "    ",
    "    ",
    "████"
    ]

getCor :: String -> String
getCor "red" = "\ESC[31m"
getCor "green" = "\ESC[32m"
getCor "default" = "\ESC[0m"

aplicaCorPixels :: String -> String -> String
aplicaCorPixels cor content = getCor cor ++ content ++ getCor "default"

aplicaCor :: [Char] -> String -> String
aplicaCor [] cor = ""
aplicaCor (head : tail) cor = aplicaCorPixels cor [head] ++ aplicaCor tail cor

concatLinha :: [[String]] -> Int -> String -> String
concatLinha (h: []) numeroLinha espaco = h !! numeroLinha
concatLinha (h: t) numeroLinha espaco = h !! numeroLinha ++ espaco ++ concatLinha t numeroLinha espaco

concatLinhas:: [[String]] -> Int -> String -> [String]
concatLinhas sprites numeroLinha espaco
  | numeroLinha < length (sprites !! 0) = [concatLinha sprites numeroLinha espaco] ++ concatLinhas sprites (numeroLinha + 1) espaco
  | otherwise = []

formataLinhasTexto:: [(Char, String)] -> String -> [String]
formataLinhasTexto [] spacer = []
formataLinhasTexto dados espaco =
    let sprites = map (\(char, cor) -> aplicaCor (getLetra char) cor) dados
    in (concatLinhas (map (\sprite -> lines sprite) sprites) 0 espaco)

------------------------------------------- Lições -------------------------------------------

ex1 :: Char -> String -> Exercicio
ex1 char idLicao  = Exercicio "1" idLicao [(char, "default"),
    (char, "default"), (char, "default"), (char, "default"), (char, "default"),
    (char, "default"), (char, "default"), (char, "default")]

ex2 :: (Char, Char) -> String -> Exercicio
ex2 (char1, char2) idLicao  = Exercicio "2" idLicao [(char1, "default"),
    (char1, "default"), (char1, "default"), (char2, "default"), (char1, "default"),
    (char1, "default"), (char1, "default"), (char2, "default"), (char1, "default"),
    (char1, "default"), (char1, "default"), (char2, "default"), (char1, "default"),
    (char1, "default"), (char1, "default"), (char2, "default")]

ex3 :: (Char, Char) -> String -> Exercicio
ex3 (char1, char2) idLicao  = Exercicio "3" idLicao [(char1, "default"),
    (char2, "default"),(char1, "default"), (char2, "default"), (char1, "default"),
    (char2, "default"), (char1, "default"), (char2, "default"), (char1, "default"),
    (char2, "default"), (char1, "default"), (char2, "default"), (char1, "default"),
    (char2, "default"), (char1, "default"), (char2, "default")]

ex4 :: (Char, Char, Char) -> String -> Exercicio
ex4 (char1, char2, char3) idLicao  = Exercicio "4" idLicao [(char1, "default"),
    (char1, "default"), (char3, "default"), (char2, "default"), (char2, "default"),
    (char1, "default"), (char1, "default"), (char3, "default"), (char2, "default"),
    (char1, "default"), (char1, "default"), (char3, "default"), (char2, "default"),
    (char1, "default"), (char1, "default"), (char3, "default"), (char2, "default"),
    (char1, "default"), (char1, "default"), (char3, "default"), (char2, "default"),
    (char1, "default"), (char1, "default"), (char3, "default")]

ex5 :: (Char, Char, Char) -> String -> Exercicio
ex5 (char1, char2, char3) idLicao  = Exercicio "5" idLicao [(char1, "default"),
    (char1, "default"), (char1, "default"), (char2, "default"), (char2, "default"),
    (char2, "default"), (char3, "default"), (char3, "default"), (char3, "default")]

ex6 :: (Char, Char, Char, Char, Char, Char, Char) -> String -> Exercicio
ex6 (char1, char2, char3, char4, char5, char6, char7) idLicao  = Exercicio "6" idLicao
    [(char1, "default"), (char2, "default"), (char3, "default"), (char4, "default"),
    (char5, "default"), (char6, "default"), (char7, "default")]

licao1 :: [(String, String)] -> Licao
licao1 dadosLicao = 
    Licao [ex1 'j' "1", ex2 ('f', 'j') "1", ex3 (' ', 'j') "1", ex4 ('j', 'f', ' ') "1"]
    (getStatusLicoes "1" dadosLicao)

-- criei essa licao 2 para testar 
licao2 :: [(String, String)] -> Licao
licao2 dadosLicao = 
    Licao [ex1 'u' "2", ex2 ('r', 'u') "2", ex3 ('u', 'k') "2", ex4 ('r', 'u', 'k') "2"]
    (getStatusLicoes "2" dadosLicao)

licao3 :: [(String, String)] -> Licao
licao3 dadosLicao = 
    Licao [ex1 'd' "3", ex2 ('d', 'i') "3", ex3 ('e', 'i') "3", ex4 ('d', 'e', 'i') "3"]
    (getStatusLicoes "3" dadosLicao)

licao4 :: [(String, String)] -> Licao
licao4 dadosLicao = 
    Licao [ex1 'c' "4", ex2 ('g', 'n') "4", ex3 ('n', 'c') "4", ex4 ('c', 'g', 'n') "4"]
    (getStatusLicoes "4" dadosLicao)

licao5 :: [(String, String)] -> Licao
licao5 dadosLicao = 
    Licao [ex5 ('j', 'f', 'u') "5", ex5 ('r', 'k', 'd') "5", ex5 ('e', 'i', 'c') "5",
        ex5 ('g', 'n', 'j') "5", ex6 ('j', ' ', 'f', ' ', 'u', ' ', 'r') "5",
        ex6 ('k', ' ', 'd', ' ', 'e', ' ', 'i') "5", ex6 ('g', ' ', 'n', ' ', 'j', ' ', 'f') "5"]
    (getStatusLicoes "5" dadosLicao)

licao6 :: [(String, String)] -> Licao
licao6 dadosLicao = 
    Licao [ex1 't' "6", ex2 ('t', 'l') "6", ex3 ('s', 'l') "6", ex4 ('t', 's', 'l') "6"]
    (getStatusLicoes "6" dadosLicao)

licao7 :: [(String, String)] -> Licao
licao7 dadosLicao = 
    Licao [ex1 't' "7", ex2 ('t', 'l') "7", ex3 ('s', 'l') "7", ex4 ('t', 's', 'l') "7"]
    (getStatusLicoes "7" dadosLicao)

licao8 :: [(String, String)] -> Licao
licao8 dadosLicao = 
    Licao [ex1 'o' "8", ex2 ('b', 'o') "8", ex3 ('o', 'a') "8", ex4 ('o', 'b', 'a') "8"]
    (getStatusLicoes "8" dadosLicao)

licao9 :: [(String, String)] -> Licao
licao9 dadosLicao = 
    Licao [ex1 'v' "9", ex2 ('v', 'm') "9", ex3 ('v', 'h') "9", ex4 ('v', 'h', 'm') "9"]
    (getStatusLicoes "9" dadosLicao)

licoes :: [(String, String)] -> [Licao]
licoes dadosLicao = [licao1 dadosLicao, licao2 dadosLicao, licao3 dadosLicao,
                    licao4 dadosLicao, licao5 dadosLicao, licao6 dadosLicao,
                    licao7 dadosLicao, licao8 dadosLicao, licao9 dadosLicao]
