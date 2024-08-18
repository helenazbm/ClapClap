import Licao
import Exercicio
import Sprites (formataLinhasTexto, licoes)

exibeExercicio :: [Licao] -> [(Char, String)]
exibeExercicio [] = []
exibeExercicio (licao:licoes) = if Licao.status licao == "nao_iniciado" || Licao.status licao == "em_processo"
                                then getExercio (exercicios licao)
                                else exibeExercicio licoes

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

    let textLines = formataLinhasTexto (exibeExercicio licoes) " "

    mapM_ putStrLn textLines
