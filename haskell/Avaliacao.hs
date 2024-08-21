module Avaliacao where

import Exercicio
import Licao

data Avaliacao = Avaliacao {
        percentualAcertos :: Int,
        palavrasPorMinuto :: Int
    } deriving (Show, Read)

contaLetrasExercicios :: [(Char, String)] -> Int
contaLetrasExercicios [] = 0
contaLetrasExercicios ((gabarito, cor):gabaritos) = 1 + contaLetrasExercicios gabaritos

contaErrosExercicios :: String -> [(Char, String)] -> Int
contaErrosExercicios [] _ = 0
contaErrosExercicios _ [] = 0
contaErrosExercicios (en:entrada) ((gabarito, cor):gabaritos) =
    if en == gabarito
        then contaErrosExercicios entrada gabaritos
        else 1 + contaErrosExercicios entrada gabaritos

calculaPrecisaoExercicios :: String -> [(Char, String)] -> Float
calculaPrecisaoExercicios entrada gabaritos =
    let contaLetras = contaLetrasExercicios gabaritos
        contaErros = contaErrosExercicios entrada gabaritos
    in fromIntegral (contaErros * 100) / fromIntegral contaLetras
