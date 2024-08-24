module Exercicio where

import Data.List (intercalate)
import Data.List.Split (splitOn)
import System.Directory (renameFile, removeFile)

data Exercicio = Exercicio {
    id :: String,
    idLicao :: String,
    exercicio :: [(Char, String)]
    -- avaliacao :: Avaliacao
} deriving (Show, Read)

corrigeExercicio :: String -> [(Char, String)] -> [(Char, String)]
corrigeExercicio entrada [] = []
corrigeExercicio "" ((exercicioCorreto, cor):exerciciosCorreto) = [(exercicioCorreto, "red")] ++ corrigeExercicio "" exerciciosCorreto
corrigeExercicio (en:entrada) ((exercicioCorreto, cor):exerciciosCorreto) =
    if en == exercicioCorreto
    then [(exercicioCorreto, "green")] ++ corrigeExercicio entrada exerciciosCorreto
    else [(exercicioCorreto, "red")] ++ corrigeExercicio entrada exerciciosCorreto