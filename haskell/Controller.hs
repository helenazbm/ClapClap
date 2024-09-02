module Controller where

import Licao
import Exercicio

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
    "../dados/arteTxt/licoes/licao1.txt"


licao2 :: [(String, String)] -> Licao
licao2 dadosLicao = 
    Licao "2" [ex1 'u' "2", ex2 ('r', 'u') "2", ex3 ('u', 'k') "2", ex4 ('r', 'u', 'k') "2"]
    (getStatusLicoes "2" dadosLicao)
    "../dados/arteTxt/licoes/licao2.txt"

licao3 :: [(String, String)] -> Licao
licao3 dadosLicao = 
    Licao "3" [ex1 'd' "3", ex2 ('d', 'i') "3", ex3 ('e', 'i') "3", ex4 ('d', 'e', 'i') "3"]
    (getStatusLicoes "3" dadosLicao)
    "../dados/arteTxt/licoes/licao3.txt"

licao4 :: [(String, String)] -> Licao
licao4 dadosLicao = 
    Licao "4" [ex1 'c' "4", ex2 ('g', 'n') "4", ex3 ('n', 'c') "4", ex4 ('c', 'g', 'n') "4"]
    (getStatusLicoes "4" dadosLicao)
    "../dados/arteTxt/licoes/licao4.txt"

licao5 :: [(String, String)] -> Licao
licao5 dadosLicao = 
    Licao "5" [ex5 ('j', 'f', 'u') "5", ex5 ('r', 'k', 'd') "5", ex5 ('e', 'i', 'c') "5",
        ex5 ('g', 'n', 'j') "5", ex6 ('j', ' ', 'f', ' ', 'u', ' ', 'r') "5",
        ex6 ('k', ' ', 'd', ' ', 'e', ' ', 'i') "5", ex6 ('g', ' ', 'n', ' ', 'j', ' ', 'f') "5"]
    (getStatusLicoes "5" dadosLicao)
    "../dados/arteTxt/licoes/licao5.txt"

licao6 :: [(String, String)] -> Licao
licao6 dadosLicao = 
    Licao "6" [ex1 't' "6", ex2 ('t', 'l') "6", ex3 ('s', 'l') "6", ex4 ('t', 's', 'l') "6"]
    (getStatusLicoes "6" dadosLicao)
    "../dados/arteTxt/licoes/licao6.txt"

licao7 :: [(String, String)] -> Licao
licao7 dadosLicao = 
    Licao "7" [ex1 'o' "7", ex2 ('b', 'o') "7", ex3 ('o', 'a') "7", ex4 ('o', 'b', 'a') "7"]
    (getStatusLicoes "7" dadosLicao)
    "../dados/arteTxt/licoes/licao7.txt"

licao8 :: [(String, String)] -> Licao
licao8 dadosLicao = 
    Licao "8" [ex1 'v' "9", ex2 ('v', 'm') "9", ex3 ('v', 'h') "9", ex4 ('v', 'h', 'm') "9"]
    (getStatusLicoes "8" dadosLicao)
    "../dados/arteTxt/licoes/licao8.txt"

licao9 :: [(String, String)] -> Licao
licao9 dadosLicao = 
    Licao "9" [ex2 (',', 'k') "9", ex1 '.' "9", ex3 ('.', 'l') "9", ex4 ('o', 'b', 'a') "9", ex7 ('l', '.', 'k', ',') "9"]
    (getStatusLicoes "9" dadosLicao)
    "../dados/arteTxt/licoes/licao9.txt"

licao10 :: [(String, String)] -> Licao
licao10 dadosLicao = 
    Licao "10" [ex5 ('t', 's', 'l') "10", ex5 ('o', 'b', 'a') "10", ex5 ('v', 'h', 'm') "10",
       ex5 ('.', ',', 't') "10", ex6 ('t', '.', 's', ',', 'l', '.', 'h') "10",
       ex6 ('b', '.', 'a', '.', 'h', '.', 'o') "10", ex6 ('m', ',', 'o', ',', 't', ',', 'v') "10"]
    (getStatusLicoes "10" dadosLicao)
    "../dados/arteTxt/licoes/licao10.txt"

licao11 :: [(String, String)] -> Licao
licao11 dadosLicao = 
    Licao "11" [ex1 'w' "11", ex2 ('w', ';') "11", ex3 (';', 'x') "11", ex4 ('w', 'x', ';') "11"]
    (getStatusLicoes "11" dadosLicao)
    "../dados/arteTxt/licoes/licao11.txt"

licao12 :: [(String, String)] -> Licao
licao12 dadosLicao = 
    Licao "12" [ex1 'ç' "12", ex2 ('ç', '~') "12", ex3 ('~', '´') "12", ex4 ('ç', '~', '´') "12"]
    (getStatusLicoes "12" dadosLicao)
    "../dados/arteTxt/licoes/licao12.txt"

licao13 :: [(String, String)] -> Licao
licao13 dadosLicao = 
    Licao "13" [ex1 '`' "13", ex2 ('`', '^') "13", ex1 '^' "13", ex4 ('`', '^', '´') "13", ex4 ('`', '^', '~') "13"]
    (getStatusLicoes "13" dadosLicao)
    "../dados/arteTxt/licoes/licao13.txt"

licao14 :: [(String, String)] -> Licao
licao14 dadosLicao = 
    Licao "14" [ex1 'q' "14", ex2 ('y', 'q') "14", ex3 ('q', 'p') "14", ex4 ('q', 'y', 'p') "14"]
    (getStatusLicoes "14" dadosLicao)
    "../dados/arteTxt/licoes/licao14.txt"

licao15 :: [(String, String)] -> Licao
licao15 dadosLicao = 
    Licao "15" [ex1 'z' "15", ex2 ('z', 'y') "15", ex3 ('p', 'z') "15", ex4 ('z', 'y', 'p') "15"]
    (getStatusLicoes "15" dadosLicao)
    "../dados/arteTxt/licoes/licao15.txt"

licoes :: [(String, String)] -> [Licao]
licoes dadosLicao = [licao1 dadosLicao, licao2 dadosLicao, licao3 dadosLicao,
                    licao4 dadosLicao, licao5 dadosLicao, licao6 dadosLicao,
                    licao7 dadosLicao, licao8 dadosLicao, licao9 dadosLicao,
                    licao10 dadosLicao, licao11 dadosLicao, licao12 dadosLicao,
                    licao13 dadosLicao, licao14 dadosLicao, licao15 dadosLicao]