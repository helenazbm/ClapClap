module Avaliacao where

import Exercicio
import Licao
import Sprites (licao1)

data Avaliacao = Avaliacao {
        percentualAcertos :: Int,
        palavrasPorMinuto :: Int
    } deriving (Show, Read)

contaErrosExercicios :: String -> [(Char, String)] -> Int
contaErrosExercicios _ [] = 0
contaErrosExercicios (en:entrada) ((gabarito, cor):gabaritos) =
    if en == gabarito
        then contaErrosExercicios entrada gabaritos
        else 1 + contaErrosExercicios entrada gabaritos

calculaPrecisaoExercicios :: String -> [(Char, String)] -> Float
calculaPrecisaoExercicios entrada gabaritos =  
    100 - fromIntegral (contaErrosExercicios entrada gabaritos * 100) / fromIntegral (length entrada)

-- retorna a quantidade de estrelas do exercicio 
calculaPontuacaoExercicio :: String -> [(Char, String)] -> Int
calculaPontuacaoExercicio entrada gabarito =
    let precisao = calculaPrecisaoExercicios entrada gabarito
    in min 3 (ceiling (precisao * 3))


avaliaLicao :: [(Char, String)] -> [String] -> Float
avaliaLicao _ [] = 0
avaliaLicao gabaritos exercicios =
    let pontuacoes = map (\exercicio -> fromIntegral (calculaPontuacaoExercicio exercicio gabaritos)) exercicios
        totalPontuacoes = sum pontuacoes
        numExercicios = fromIntegral (length exercicios)
    in if numExercicios == 0
        then 0
        else totalPontuacoes / numExercicios

exibirAvaliacao :: [(Char, String)] -> [String] -> IO ()
exibirAvaliacao gabaritos respostas = do
    let pontuacao = avaliaLicao gabaritos respostas
    putStrLn $ "Pontuação da lição: " ++ show pontuacao

