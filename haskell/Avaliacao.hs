module Avaliacao where

import Exercicio
import Licao
--import Desafio
import Sprites (licao1)

contaLetrasExercicios :: [(Char, String)] -> Int
contaLetrasExercicios [] = 0
contaLetrasExercicios ((gabarito, cor):gabaritos) = 1 + contaLetrasExercicios gabaritos

contaErrosExercicios :: String -> [(Char, String)] -> Int
contaErrosExercicios _ [] = 0
contaErrosExercicios [] gabaritos = length gabaritos
contaErrosExercicios entrada gabaritos =
    let tamanhoEntrada = length entrada
        tamanhoGabarito = length gabaritos
        zipped = zip (take tamanhoEntrada (map fst gabaritos)) entrada
    in if tamanhoEntrada < tamanhoGabarito
           then tamanhoGabarito - tamanhoEntrada + sum [if e == g then 0 else 1 | (g, e) <- zipped]
           else sum [if e == g then 0 else 1 | (g, e) <- zipped]

calculaPrecisaoExercicios :: Int -> Int -> Float
calculaPrecisaoExercicios totalLetras totalErros =
    100.0 * fromIntegral (totalLetras - totalErros) / fromIntegral totalLetras

atribuiEstrelasLicao :: Float -> Int
atribuiEstrelasLicao precisao
    | precisao < 20.0 = 0
    | precisao <= 60.0 = 1
    | precisao <= 90.0 = 2
    | otherwise = 3    

-- contaLetrasDesafio :: Desafio -> Int
-- contaLetrasDesafio UmMinuto = contaCaracteres frases
-- contaLetrasDesafio DoisMinutos = contaCaracteres frases
-- contaLetrasDesafio CincoMinutos = contaCaracteres frases

-- contaCaracteres :: [String] -> Int
-- contaCaracteres = sum . map length 