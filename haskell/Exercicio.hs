module Exercicio where

import Data.List (intercalate)
import Data.List.Split (splitOn)
import Util (limparTela, lerCaractere, delay)
import Avaliacao (contarErrosExercicios, contarLetrasExercicios)
import System.Directory (renameFile, removeFile)
import Sprites (formatarLinhasTexto)


data Exercicio = Exercicio {
    id :: String,
    idLicao :: String,
    exercicio :: [(Char, String)]
} deriving (Show, Read)

corrigeExercicio :: String -> [(Char, String)] -> [(Char, String)]
corrigeExercicio entrada [] = []
corrigeExercicio "" ((exercicioCorreto, cor):exerciciosCorreto) = [(exercicioCorreto, "red")] ++ corrigeExercicio "" exerciciosCorreto
corrigeExercicio (en:entrada) ((exercicioCorreto, cor):exerciciosCorreto) =
    if en == exercicioCorreto
    then [(exercicioCorreto, "green")] ++ corrigeExercicio entrada exerciciosCorreto
    else [(exercicioCorreto, "red")] ++ corrigeExercicio entrada exerciciosCorreto


-- Função para fazer um exercício específico
iniciarExercicio :: Exercicio -> IO (Int, Int)
iniciarExercicio ex = do
    let texto = formatarLinhasTexto (exercicio ex) " "
    putStrLn ("Exercício " ++ show (Exercicio.id ex) ++ "\n")
    mapM_ putStrLn texto
    
    entrada <- getLine
    let textoCorrigido = formatarLinhasTexto (corrigeExercicio entrada (exercicio ex)) " "
        erros = contarErrosExercicios entrada (exercicio ex)
        letras = contarLetrasExercicios (exercicio ex)

    mapM_ putStrLn textoCorrigido
    delay
    return (erros, letras)
