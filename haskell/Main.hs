import Licao
import Exercicio
import Sprites (formataLinhasTexto, licoes, getDadosLicoes, getDadosExercicios, setDadosExercicios)

getExercio :: [Exercicio] -> Exercicio
getExercio (ex:exercicios) = if Exercicio.status ex == "nao_iniciado" 
                            then ex
                            else getExercio exercicios

getExercicioLicao :: [Licao] -> Exercicio
getExercicioLicao (licao:licoes) = if Licao.status licao == "nao_iniciado" || Licao.status licao == "em_processo"
                                then getExercio (exercicios licao)
                                else getExercicioLicao licoes

corrigeExercicio :: String -> [(Char, String)] -> [(Char, String)]
corrigeExercicio entrada [] = []
corrigeExercicio (en:entrada) ((gabarito, cor):gabaritos) = if en == gabarito
                                                            then [(gabarito, "green")] ++ corrigeExercicio entrada gabaritos
                                                            else [(gabarito, "red")] ++ corrigeExercicio entrada gabaritos

-- teste :: String -> Exercicio -> [(Char, String)]
-- teste entrada ex = 
--     let _ = setDadosExercicios "1" "1"
--     in corrigeExercicio entrada (exercicio ex)

main :: IO ()
main = do
    dadosLicoes <- getDadosLicoes
    dadosExercicios <- getDadosExercicios

    let ex = (getExercicioLicao (licoes dadosLicoes dadosExercicios))
    let textLines = formataLinhasTexto (exercicio ex) " "

    mapM_ putStrLn textLines

    entrada <- getLine :: IO String
    let textLines2 = formataLinhasTexto (corrigeExercicio entrada (exercicio ex)) " "
    setDadosExercicios (Exercicio.id ex) (Exercicio.idLicao ex)
    mapM_ putStrLn textLines2


