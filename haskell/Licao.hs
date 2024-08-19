module Licao where

import Exercicio

data Licao = Licao {
    instrucao :: String,
    exercicios :: [Exercicio],
    status :: String
} deriving (Show, Read)

getExercio :: [Exercicio] -> Exercicio
getExercio (ex:exercicios) = if Exercicio.status ex == "nao_iniciado" 
                            then ex
                            else getExercio exercicios

getExercicioLicao :: [Licao] -> Exercicio
getExercicioLicao (licao:licoes) = if Licao.status licao == "nao_iniciado" || Licao.status licao == "em_processo"
                                then getExercio (exercicios licao)
                                else getExercicioLicao licoes

alteraCorExercicio :: String -> [(Char, String)] -> [(Char, String)]
alteraCorExercicio entrada [] = []
alteraCorExercicio (en:entrada) ((gabarito, cor):gabaritos) = if en == gabarito
                                                            then [(gabarito, "green")] ++ corrigeExercicio entrada gabaritos
                                                            else [(gabarito, "red")] ++ corrigeExercicio entrada gabaritos

contaErros :: String -> [(Char, String)] -> Int
contaErros (en:entrada) ((gabarito, cor):gabaritos) = 0

corrigeExercicio :: String -> [(Char, String)] -> [(Char, String)]
corrigeExercicio entrada exercicio = alteraCorExercicio entrada exercicio

