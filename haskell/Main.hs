import Licao
import Exercicio
import Sprites (formataLinhasTexto, licao1)

exibeLicao :: Licao -> [(Char, String)]
exibeLicao licao = getExercio (exercicios licao)

getExercio :: [Exercicio] -> [(Char, String)]
getExercio [] = []
getExercio (ex:exercicios) = if Exercicio.status ex == "nao_iniciado" 
                                        then Exercicio.exercicio ex
                                        else getExercio exercicios


main :: IO ()
main = do
    -- let entrada = 'jjjjajjj'

    -- let textLines = formataLinhasTexto (exercicio (ex1 'j'))  " "
    -- mapM_ putStrLn textLines

    let textLines = formataLinhasTexto (exibeLicao licao1) " "

    mapM_ putStrLn textLines
