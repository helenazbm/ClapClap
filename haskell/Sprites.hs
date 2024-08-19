module Sprites where

import Licao
import Exercicio
import System.IO
import Data.List (intercalate)
import Data.List.Split (splitOn)
import System.Directory (renameFile, removeFile)

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
aplicaCorPixels cor content = getCor cor ++ content ++ getCor "default"

aplicaCor :: [Char] -> String -> String
aplicaCor [] cor = ""
aplicaCor (head : tail) cor = aplicaCorPixels cor [head] ++ aplicaCor tail cor

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
        sprites = map (\(char, cor) -> aplicaCor (getLetra char) cor) head
    in (concatLinhas (map (\sprite -> lines sprite) sprites) 0 spacer) ++ formataLinhasTexto tail spacer


------------------------------------------- Lições -------------------------------------------

getDadosExercicios :: IO [(String, String, String)]
getDadosExercicios = do
    conteudo <- readFile "../dados/tabela_exercicio.txt"
    let linhas = tail $ map (splitOn ";") (lines conteudo)
    return $ map (\[id, idLicao, status] -> (id, idLicao, status)) linhas

getStatusExercicios :: String -> String -> [(String, String, String)] -> String
getStatusExercicios idEx idLic [] = ""
getStatusExercicios idEx idLic dados =
    let (id, idLicao, status) = head dados
    in if id == idEx && idLicao == idLic
        then status
        else getStatusExercicios idEx idLic (tail dados)

atualizaLinha :: String -> String -> String -> String
atualizaLinha idEx idLic linha =
    let [id, idLicao, status] = splitOn ";" linha
    in if id == idEx && idLicao == idLic
       then intercalate ";" [id, idLicao, "concluido"]
       else linha

setDadosExercicios :: String -> String -> IO ()
setDadosExercicios idExercicio idLicao = do
    let filePath = "../dados/tabela_exercicio.txt"
        tempFilePath = filePath ++ ".tmp"

    conteudo <- readFile filePath
    let linhas = lines conteudo
        linhasProcessadas = map (\linha -> atualizaLinha idExercicio idLicao linha) linhas

    writeFile tempFilePath (unlines linhasProcessadas)

    renameFile tempFilePath filePath

ex1 :: Char -> String -> [(String, String, String)] -> Exercicio
ex1 char idLicao dados = Exercicio [(char, "default"), (char, "default"), (char, "default"), (char, "default"),
    (char, "default"), (char, "default"), (char, "default"), (char, "default")] (getStatusExercicios "1" idLicao dados)

ex2 :: (Char, Char) -> Exercicio
ex2 (char1, char2) = Exercicio [(char1, "default"), (char1, "default"), (char1, "default"), (char2, "default"),
    (char1, "default"), (char1, "default"), (char1, "default"), (char2, "default"),
    (char1, "default"), (char1, "default"), (char1, "default"), (char2, "default"),
    (char1, "default"), (char1, "default"), (char1, "default"), (char2, "default")] "nao_iniciado"

ex3 :: (Char, Char) -> Exercicio
ex3 (char1, char2) = Exercicio [(char1, "default"), (char2, "default"), (char1, "default"), (char2, "default"),
    (char1, "default"), (char2, "default"), (char1, "default"), (char2, "default"),
    (char1, "default"), (char2, "default"), (char1, "default"), (char2, "default"),
    (char1, "default"), (char2, "default"), (char1, "default"), (char2, "default")] "nao_iniciado"

ex4 :: (Char, Char, Char) -> Exercicio
ex4 (char1, char2, char3) = Exercicio [(char1, "default"), (char1, "default"), (char3, "default"), (char2, "default"),
    (char2, "default"), (char1, "default"), (char1, "default"), (char3, "default"),
    (char2, "default"), (char1, "default"), (char1, "default"), (char3, "default"),
    (char2, "default"), (char1, "default"), (char1, "default"), (char3, "default"),
    (char2, "default"), (char1, "default"), (char1, "default"), (char3, "default"),
    (char2, "default"), (char1, "default"), (char1, "default"), (char3, "default")] "nao_iniciado"

getDadosLicoes :: IO [(String, String)]
getDadosLicoes = do
    conteudo <- readFile "../dados/tabela_licao.txt"
    let linhas = tail $ map (splitOn ";") (lines conteudo)
    return $ map (\[id, status] -> (id, status)) linhas

getStatusLicoes :: String -> [(String, String)] -> String
getStatusLicoes idLicao [] = ""
getStatusLicoes idLicao dados =
    let (id, status) = head dados
    in if id == idLicao
        then status
        else getStatusLicoes idLicao (tail dados)

licao1 :: [(String, String)] -> [(String, String, String)] -> Licao
licao1 dadosLicao dadosExercicios = 
    Licao "instrucao" [ex1 'j' "1" dadosExercicios, ex2 ('f', 'j'), ex3 ('_', 'j'), ex4 ('j', 'f', '_')]
    (getStatusLicoes "1" dadosLicao)

licoes :: [(String, String)] -> [(String, String, String)] -> [Licao]
licoes dadosLicao dadosExercicios = [licao1 dadosLicao dadosExercicios]