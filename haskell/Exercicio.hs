module Exercicio where

import Data.List (intercalate)
import Data.List.Split (splitOn)
import Sprites (formataLinhasTexto)
import Util (limpaTela, leCaractere, delay)
import System.Directory (renameFile, removeFile)
import Avaliacao (contaErrosExercicios, contaLetrasExercicios)

data Exercicio = Exercicio {
    id :: String,
    idLicao :: String,
    exercicio :: [(Char, String)]
} deriving (Show, Read)

corrigeExercicio :: String -> [(Char, String)] -> [(Char, String)]
corrigeExercicio entrada [] = []
corrigeExercicio "" ((exercicioCorreto, cor):exerciciosCorreto) = [(exercicioCorreto, "vermelho")] ++ corrigeExercicio "" exerciciosCorreto
corrigeExercicio (en:entrada) ((exercicioCorreto, cor):exerciciosCorreto) =
    if en == exercicioCorreto
    then [(exercicioCorreto, "verde")] ++ corrigeExercicio entrada exerciciosCorreto
    else [(exercicioCorreto, "vermelho")] ++ corrigeExercicio entrada exerciciosCorreto

iniciaExercicio :: Exercicio -> Int -> IO (Int, Int)
iniciaExercicio ex numero = do
    let texto = formataLinhasTexto (exercicio ex) " "
    putStrLn ("Exercício " ++ show numero ++ "\n")
    mapM_ putStrLn texto
    
    entrada <- getLine
    let textoCorrigido = formataLinhasTexto (corrigeExercicio entrada (exercicio ex)) " "
        erros = contaErrosExercicios entrada (exercicio ex)
        letras = contaLetrasExercicios (exercicio ex)

    mapM_ putStrLn textoCorrigido
    delay
    return (erros, letras)
