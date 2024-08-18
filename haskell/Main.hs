import Licao
import Exercicio
import Sprites (formataLinhasTexto, licoes, getDadosLicoes, getDadosExercicios)

getExercio :: [Exercicio] -> [(Char, String)]
getExercio [] = []
getExercio (ex:exercicios) = if Exercicio.status ex == "nao_iniciado" 
                            then Exercicio.exercicio ex
                            else getExercio exercicios

getExercicioLicao :: [Licao] -> [(Char, String)]
getExercicioLicao [] = []
getExercicioLicao (licao:licoes) = if Licao.status licao == "nao_iniciado" || Licao.status licao == "em_processo"
                                then getExercio (exercicios licao)
                                else getExercicioLicao licoes

corrigeExercicio :: String -> [(Char, String)] -> [(Char, String)]
corrigeExercicio entrada [] = []
corrigeExercicio (en:entrada) ((gabarito, cor):gabaritos) = if en == gabarito
                                                            then [(gabarito, "green")] ++ corrigeExercicio entrada gabaritos
                                                            else [(gabarito, "red")] ++ corrigeExercicio entrada gabaritos

main :: IO ()
main = do
    dadosLicoes <- getDadosLicoes
    dadosExercicios <- getDadosExercicios
    let textLines = formataLinhasTexto (getExercicioLicao (licoes dadosLicoes dadosExercicios)) " "

    mapM_ putStrLn textLines

    -- entrada <- readLn :: IO String
    -- let textLines2 = formataLinhasTexto (corrigeExercicio entrada (getExercicioLicao licoes)) " "
    -- mapM_ putStrLn textLines2


