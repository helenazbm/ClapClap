module Sprites where

import Licao
import Exercicio
import System.IO
import Text.Printf (printf)

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

getLetra '.' = unlines [
    "    ",
    "    ",
    " ▄  "
    ]

getLetra ',' = unlines [
    "    ",
    "    ",
    "▄▀  "
    ]

getLetra ';' = unlines [
    "    ",
    " ▀  ",
    "▄▀  "
    ]

getLetra '~' = unlines [
    "    ",
    "▀▄▀▄",
    "    "
    ]

getLetra '´' = unlines [
    "  ▄▀",
    "    ",
    "    "
    ]

getLetra '`' = unlines [
    "▀▄  ",
    "    ",
    "    "
    ]

getLetra '^' = unlines [
    "▄▀▀▄",
    "    ",
    "    "
    ]

getLetra 'ç' = unlines [
    "▄▀▀▄",
    "█  ▄",
    "▀█▀▀"
    ]

getCor :: String -> String
getCor "red" = "\ESC[31m"
getCor "green" = "\ESC[32m"
getCor "yellow" = "\ESC[33m"
getCor "orange" = "\ESC[38;5;208m"
getCor "default" = "\ESC[0m"

aplicarCorPixels :: String -> String -> String
aplicarCorPixels cor content = getCor cor ++ content ++ getCor "default"

aplicarCor :: [Char] -> String -> String
aplicarCor [] cor = ""
aplicarCor (head : tail) cor = aplicarCorPixels cor [head] ++ aplicarCor tail cor

concatLinha :: [[String]] -> Int -> String -> String
concatLinha (h: []) numeroLinha espaco = h !! numeroLinha
concatLinha (h: t) numeroLinha espaco = h !! numeroLinha ++ espaco ++ concatLinha t numeroLinha espaco

concatLinhas:: [[String]] -> Int -> String -> [String]
concatLinhas sprites numeroLinha espaco
  | numeroLinha < length (sprites !! 0) = [concatLinha sprites numeroLinha espaco] ++ concatLinhas sprites (numeroLinha + 1) espaco
  | otherwise = []

formatarLinhasTexto:: [(Char, String)] -> String -> [String]
formatarLinhasTexto [] spacer = []
formatarLinhasTexto dados espaco =
    let sprites = map (\(char, cor) -> aplicarCor (getLetra char) cor) dados
    in (concatLinhas (map (\sprite -> lines sprite) sprites) 0 espaco)

aplicarCorProgresso :: String -> String -> String
aplicarCorProgresso cor conteudo = getCor cor ++ conteudo ++ getCor "default"

preencherProgresso :: String -> Int -> String
preencherProgresso cor total = 
    let totalBlocos = 45 -- número de "blocos" na barra de progresso
        blocosPreenchidos = total * 3
    in aplicarCorProgresso cor (replicate blocosPreenchidos '▓') ++ replicate (45 - blocosPreenchidos) '░'

getCorProgresso :: Int -> String
getCorProgresso total
  | total == 15 = "green"
  | total >= 10 = "yellow"
  | total >= 5 = "orange"
  | otherwise = "red" 

exibirProgresso :: Int -> String
exibirProgresso total = "                                                    Progresso: ["
    ++ preencherProgresso (getCorProgresso total) total ++ "] " ++ printf "%.1f" percentual ++ "%"
  where 
    percentual = (fromIntegral total / 15 * 100) :: Double

colorirPalavra :: Bool -> String -> String
colorirPalavra True palavra = getCor "green" ++ palavra ++ getCor "default"
colorirPalavra False palavra = getCor "red" ++ palavra ++ getCor "default"

formataLicoesConcluida :: [Licao] -> String
formataLicoesConcluida (licao:[]) = colorirPalavra ((status licao) == "concluido") (Licao.id licao)
formataLicoesConcluida (licao:licoes) = colorirPalavra ((status licao) == "concluido") (Licao.id licao) ++ ", " ++ formataLicoesConcluida licoes

exibirLicoesConcluida :: [Licao] -> String
exibirLicoesConcluida licoes = "\n                                                    Concluídas: [" ++ formataLicoesConcluida licoes ++ "]"
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

ex7 :: (Char, Char, Char, Char) -> String -> Exercicio
ex7 (char1, char2, char3, char4) idLicao = Exercicio "7" idLicao [(char1, "default"),
    (char2, "default"), (char3, "default"), (char4, "default"), (char1, "default"),
    (char2, "default"), (char2, "default"), (char3, "default"), (char4, "default"),
    (char4, "default")]

licao1 :: [(String, String)] -> Licao
licao1 dadosLicao = 
    Licao "1" [ex1 'j' "1", ex2 ('f', 'j') "1", ex3 (' ', 'j') "1", ex4 ('j', 'f', ' ') "1"]
    (getStatusLicoes "1" dadosLicao)
    "../dados/arteTexto/licoes/licao1.txt"


licao2 :: [(String, String)] -> Licao
licao2 dadosLicao = 
    Licao "2" [ex1 'u' "2", ex2 ('r', 'u') "2", ex3 ('u', 'k') "2", ex4 ('r', 'u', 'k') "2"]
    (getStatusLicoes "2" dadosLicao)
    "../dados/arteTexto/licoes/licao2.txt"

licao3 :: [(String, String)] -> Licao
licao3 dadosLicao = 
    Licao "3" [ex1 'd' "3", ex2 ('d', 'i') "3", ex3 ('e', 'i') "3", ex4 ('d', 'e', 'i') "3"]
    (getStatusLicoes "3" dadosLicao)
    "../dados/arteTexto/licoes/licao3.txt"

licao4 :: [(String, String)] -> Licao
licao4 dadosLicao = 
    Licao "4" [ex1 'c' "4", ex2 ('g', 'n') "4", ex3 ('n', 'c') "4", ex4 ('c', 'g', 'n') "4"]
    (getStatusLicoes "4" dadosLicao)
    "../dados/arteTexto/licoes/licao4.txt"

licao5 :: [(String, String)] -> Licao
licao5 dadosLicao = 
    Licao "5" [ex5 ('j', 'f', 'u') "5", ex5 ('r', 'k', 'd') "5", ex5 ('e', 'i', 'c') "5",
        ex5 ('g', 'n', 'j') "5", ex6 ('j', ' ', 'f', ' ', 'u', ' ', 'r') "5",
        ex6 ('k', ' ', 'd', ' ', 'e', ' ', 'i') "5", ex6 ('g', ' ', 'n', ' ', 'j', ' ', 'f') "5"]
    (getStatusLicoes "5" dadosLicao)
    "../dados/arteTexto/licoes/licao5.txt"

licao6 :: [(String, String)] -> Licao
licao6 dadosLicao = 
    Licao "6" [ex1 't' "6", ex2 ('t', 'l') "6", ex3 ('s', 'l') "6", ex4 ('t', 's', 'l') "6"]
    (getStatusLicoes "6" dadosLicao)
    "../dados/arteTexto/licoes/licao6.txt"

licao7 :: [(String, String)] -> Licao
licao7 dadosLicao = 
    Licao "7" [ex1 'o' "7", ex2 ('b', 'o') "7", ex3 ('o', 'a') "7", ex4 ('o', 'b', 'a') "7"]
    (getStatusLicoes "7" dadosLicao)
    "../dados/arteTexto/licoes/licao7.txt"

licao8 :: [(String, String)] -> Licao
licao8 dadosLicao = 
    Licao "8" [ex1 'v' "9", ex2 ('v', 'm') "9", ex3 ('v', 'h') "9", ex4 ('v', 'h', 'm') "9"]
    (getStatusLicoes "8" dadosLicao)
    "../dados/arteTexto/licoes/licao8.txt"

licao9 :: [(String, String)] -> Licao
licao9 dadosLicao = 
    Licao "9" [ex2 (',', 'k') "9", ex1 '.' "9", ex3 ('.', 'l') "9", ex4 ('o', 'b', 'a') "9", ex7 ('l', '.', 'k', ',') "9"]
    (getStatusLicoes "9" dadosLicao)
    "../dados/arteTexto/licoes/licao9.txt"

licao10 :: [(String, String)] -> Licao
licao10 dadosLicao = 
    Licao "10" [ex5 ('t', 's', 'l') "10", ex5 ('o', 'b', 'a') "10", ex5 ('v', 'h', 'm') "10",
       ex5 ('.', ',', 't') "10", ex6 ('t', '.', 's', ',', 'l', '.', 'h') "10",
       ex6 ('b', '.', 'a', '.', 'h', '.', 'o') "10", ex6 ('m', ',', 'o', ',', 't', ',', 'v') "10"]
    (getStatusLicoes "10" dadosLicao)
    "../dados/arteTexto/licoes/licao10.txt"

licao11 :: [(String, String)] -> Licao
licao11 dadosLicao = 
    Licao "11" [ex1 'w' "11", ex2 ('w', ';') "11", ex3 (';', 'x') "11", ex4 ('w', 'x', ';') "11"]
    (getStatusLicoes "11" dadosLicao)
    "../dados/arteTexto/licoes/licao11.txt"

licao12 :: [(String, String)] -> Licao
licao12 dadosLicao = 
    Licao "12" [ex1 'ç' "12", ex2 ('ç', '~') "12", ex3 ('~', '´') "12", ex4 ('ç', '~', '´') "12"]
    (getStatusLicoes "12" dadosLicao)
    "../dados/arteTexto/licoes/licao12.txt"

licao13 :: [(String, String)] -> Licao
licao13 dadosLicao = 
    Licao "13" [ex1 '`' "13", ex2 ('`', '^') "13", ex1 '^' "13", ex4 ('`', '^', '´') "13", ex4 ('`', '^', '~') "13"]
    (getStatusLicoes "13" dadosLicao)
    "../dados/arteTexto/licoes/licao13.txt"

licao14 :: [(String, String)] -> Licao
licao14 dadosLicao = 
    Licao "14" [ex1 'q' "14", ex2 ('y', 'q') "14", ex3 ('q', 'p') "14", ex4 ('q', 'y', 'p') "14"]
    (getStatusLicoes "14" dadosLicao)
    "../dados/arteTexto/licoes/licao14.txt"

licao15 :: [(String, String)] -> Licao
licao15 dadosLicao = 
    Licao "15" [ex1 'z' "15", ex2 ('z', 'y') "15", ex3 ('p', 'z') "15", ex4 ('z', 'y', 'p') "15"]
    (getStatusLicoes "15" dadosLicao)
    "../dados/arteTexto/licoes/licao15.txt"

licoes :: [(String, String)] -> [Licao]
licoes dadosLicao = [licao1 dadosLicao, licao2 dadosLicao, licao3 dadosLicao,
                    licao4 dadosLicao, licao5 dadosLicao, licao6 dadosLicao,
                    licao7 dadosLicao, licao8 dadosLicao, licao9 dadosLicao,
                    licao10 dadosLicao, licao11 dadosLicao, licao12 dadosLicao,
                    licao13 dadosLicao, licao14 dadosLicao, licao15 dadosLicao]
