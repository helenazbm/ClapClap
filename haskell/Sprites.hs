module Sprites where

import Text.Printf (printf)
import Data.List (intercalate)
import Data.List.Split (splitOn)

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
getCor "vermelho" = "\ESC[31m"
getCor "verde" = "\ESC[32m"
getCor "amarelo" = "\ESC[33m"
getCor "azul" = "\ESC[34m"
getCor "laranja" = "\ESC[38;5;208m"
getCor "magenta" = "\ESC[35m"
getCor "ciano" = "\ESC[36m"
getCor "default" = "\ESC[0m"

aplicaCorInstrucao :: String -> String
aplicaCorInstrucao semCor = 
    let semCorTags = substituiTags semCor
        linhasColoridos = lines semCorTags
    in unlines linhasColoridos

substituiTags :: String -> String
substituiTags = substituiTag "[AZUL]" "azul"
            . substituiTag "[DEFAULT]" "default"
            . substituiTag "[VERMELHO]" "vermelho"
            . substituiTag "[VERDE]" "verde"
            . substituiTag "[AMARELO]" "amarelo"
            . substituiTag "[MAGENTA]" "magenta"
            . substituiTag "[CIANO]" "ciano"

substituiTag :: String -> String -> String -> String
substituiTag tag cor = intercalate (getCor cor) . splitOn tag

aplicaCorConteudo :: String -> String -> String
aplicaCorConteudo cor conteudo = getCor cor ++ conteudo ++ getCor "default"

aplicarCor :: [Char] -> String -> String
aplicarCor [] cor = ""
aplicarCor (head : tail) cor = aplicaCorConteudo cor [head] ++ aplicarCor tail cor

concatenaLinha :: [[String]] -> Int -> String -> String
concatenaLinha (h: []) numeroLinha espaco = h !! numeroLinha
concatenaLinha (h: t) numeroLinha espaco = h !! numeroLinha ++ espaco ++ concatenaLinha t numeroLinha espaco

concatenaLinhas:: [[String]] -> Int -> String -> [String]
concatenaLinhas sprites numeroLinha espaco
  | numeroLinha < length (sprites !! 0) = [concatenaLinha sprites numeroLinha espaco] ++ concatenaLinhas sprites (numeroLinha + 1) espaco
  | otherwise = []

formataLinhasTexto:: [(Char, String)] -> String -> [String]
formataLinhasTexto [] spacer = []
formataLinhasTexto dados espaco =
    let sprites = map (\(char, cor) -> aplicarCor (getLetra char) cor) dados
    in (concatenaLinhas (map (\sprite -> lines sprite) sprites) 0 espaco)

preencheProgresso :: String -> Int -> String
preencheProgresso cor total = 
    let totalBlocos = 45 -- número de "blocos" na barra de progresso
        blocosPreenchidos = total * 3
    in aplicaCorConteudo cor (replicate blocosPreenchidos '▓') ++ replicate (45 - blocosPreenchidos) '░'

getCorProgresso :: Int -> String
getCorProgresso total
  | total == 15 = "verde"
  | total >= 10 = "amarelo"
  | total >= 5 = "laranja"
  | otherwise = "vermelho" 

exibeProgresso :: Int -> String
exibeProgresso total = "                                                    Progresso: ["
    ++ preencheProgresso (getCorProgresso total) total ++ "] " ++ printf "%.1f" percentual ++ "%"
  where 
    percentual = (fromIntegral total / 15 * 100) :: Double

aplicaCorSucessoFalha :: Bool -> String -> String
aplicaCorSucessoFalha True palavra = aplicaCorConteudo "verde" palavra
aplicaCorSucessoFalha False palavra = aplicaCorConteudo "vermelho" palavra

ajustaNome :: String -> String
ajustaNome label =
    if length label > 5 then take 5 label else label ++ replicate (5 - length label) ' '

ajustaWpm :: String -> String
ajustaWpm wpm =
    if length wpm > 3 then take 3 wpm else replicate (3 - length wpm) ' ' ++ wpm

formataLinhaRanking :: String -> String -> String -> String
formataLinhaRanking id nome wpm = id ++ " min" ++ "   --------------- " ++ ajustaNome nome ++ " --------------- " ++ ajustaWpm wpm

formataLinhasRanking :: (String, String, String) -> (String, String, String) -> (String, String, String) -> String
formataLinhasRanking (id1, nome1, wpm1) (id2, nome2, wpm2) (id3, nome3, wpm3) =
    "                                                           " ++ aplicaCorConteudo "azul" "_____________________________________________________\n\n" ++
    "                                                             " ++ aplicaCorConteudo "azul" "Desafio --------------- Nome ---------------- WPM\n" ++ 
    "                                                             " ++ formataLinhaRanking id1 nome1 wpm1 ++ "\n" ++
    "                                                             " ++ formataLinhaRanking id2 nome2 wpm2 ++ "\n" ++
    "                                                             " ++ formataLinhaRanking id3 nome3 wpm3 ++ "\n" ++
    "                                                           " ++ aplicaCorConteudo "azul" "_____________________________________________________" ++ "\n"

formataRanking :: (String, String, String) -> (String, String, String) -> (String, String, String) -> IO()
formataRanking linha1 linha2 linha3 = do
    arteRanking <- readFile "../dados/arteTxt/ranking.txt"
    let cabecalho = aplicaCorConteudo "azul" "Desafio --------------- Nome ---------------- WPM"

    putStrLn arteRanking
    putStr (formataLinhasRanking linha1 linha2 linha3)
    putStrLn "\n\n\n                                                           * Pressione Enter para voltar ao Menu de Desafios *"