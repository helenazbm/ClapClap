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

licao1 :: [(String, String)] -> Licao
licao1 dadosLicao = 
    Licao "instrucao" [ex1 'j' "1", ex2 ('f', 'j') "1", ex3 (' ', 'j') "1", ex4 ('j', 'f', ' ') "1"]
    (getStatusLicoes "1" dadosLicao)

-- criei essa licao 2 para testar 
licao2 :: [(String, String)] -> Licao
licao2 dadosLicao = 
    Licao "instrucao2" [ex1 'u' "1", ex2 ('r', 'u') "1", ex3 ('u', 'k') "1", ex4 ('r', 'u', 'k') "1"]
    (getStatusLicoes "2" dadosLicao)


licoes :: [(String, String)] -> [Licao]
licoes dadosLicao = 
    [ licao1 dadosLicao
    , licao2 dadosLicao
    -- Adicionar as outras lições aqui
    ]
