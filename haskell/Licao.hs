module Licao where

    import Exercicio

    data Licao = Licao {
        instrucao :: String,
        exercicios :: [Exercicio],
        --avaliacao :: Avaliacao
        status :: String
    } deriving (Show, Read)