module Avaliacao where

import Exercicio
import Licao
import Sprites (licao1)

data Avaliacao = Avaliacao {
        percentualAcertos :: Int,
        palavrasPorMinuto :: Int
    } deriving (Show, Read)

contaLetrasExercicios :: [(Char, String)] -> Int
contaLetrasExercicios [] = 0
contaLetrasExercicios ((gabarito, cor):gabaritos) = 1 + contaLetrasExercicios gabaritos

contaErrosExercicios :: String -> [(Char, String)] -> Int
contaErrosExercicios _ [] = 0  
contaErrosExercicios (en:entrada) ((gabarito, cor):gabaritos) =
    if en == gabarito
        then contaErrosExercicios entrada gabaritos
        else 1 + contaErrosExercicios entrada gabaritos

calculaPrecisaoExercicios :: Int -> Int -> Float
calculaPrecisaoExercicios totalLetras totalErros =
    if totalLetras == 0
        then 0.0
        else 100.0 * fromIntegral (totalLetras - totalErros) / fromIntegral totalLetras