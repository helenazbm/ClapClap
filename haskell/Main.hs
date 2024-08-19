import Exercicio
import Licao (getExercio, getExercicioLicao, corrigeExercicio)
import Sprites (formataLinhasTexto, licoes, getDadosLicoes, getDadosExercicios, setDadosExercicios)
import Menu (printMenu)


main :: IO ()
main = do
    printMenu

