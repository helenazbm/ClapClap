module Sprites where

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
getCor "blue" = "\ESC[34m"
getCor "orange" = "\ESC[38;5;208m"
getCor "default" = "\ESC[0m"

aplicarCorConteudo :: String -> String -> String
aplicarCorConteudo cor conteudo = getCor cor ++ conteudo ++ getCor "default"

aplicarCor :: [Char] -> String -> String
aplicarCor [] cor = ""
aplicarCor (head : tail) cor = aplicarCorConteudo cor [head] ++ aplicarCor tail cor

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

ajustaNome :: String -> String
ajustaNome label =
    if length label > 5 then take 5 label else label ++ replicate (5 - length label) ' '

ajustaWpm :: String -> String
ajustaWpm wpm =
    if length wpm > 3 then take 3 wpm else replicate (3 - length wpm) ' ' ++ wpm

formataRanking :: String -> String -> String -> String -> String -> String -> String -> String -> String -> IO()
formataRanking id1 nome1 wpm1 id2 nome2 wpm2 id5 nome5 wpm5 = do
    arteRanking <- readFile "../dados/arteTexto/ranking.txt"
    let cabecalho = aplicarCorConteudo "blue" "Desafio --------------- Nome ---------------- WPM"
        linha1 = id1 ++ " min" ++ "   --------------- " ++ ajustaNome nome1 ++ " --------------- " ++ ajustaWpm wpm1
        linha2 = id2 ++ " min" ++ "   --------------- " ++ ajustaNome nome2 ++ " --------------- " ++ ajustaWpm wpm2
        linha3 = id5 ++ " min" ++ "   --------------- " ++ ajustaNome nome5 ++ " --------------- " ++ ajustaWpm wpm5

    putStrLn arteRanking
    putStrLn "\n"
    putStrLn ("                                                           " ++ aplicarCorConteudo "blue" "_____________________________________________________" ++ "\n")
    putStrLn ("                                                             " ++ cabecalho)
    putStrLn ("                                                             " ++ linha1)
    putStrLn ("                                                             " ++ linha2)
    putStrLn ("                                                             " ++ linha3)
    putStrLn ("                                                           " ++ aplicarCorConteudo "blue" "_____________________________________________________" ++ "\n")
    putStrLn "\n\n\n                                                           * Pressione Enter para voltar ao Menu de Desafios *"