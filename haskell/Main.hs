import Exercicio
import Licao (getExercio, getExercicioLicao, corrigeExercicio)
import Sprites (formataLinhasTexto, licoes, getDadosLicoes, getDadosExercicios, setDadosExercicios)


-- iniciarLicao
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