import Licao
import Exercicio

exibirExercicio :: Exercicio -> String
exibirExercicio (Exercicio exercicio _) = unlines exercicio

main :: IO()
main = do
    conteudo <- readFile "../dados/licoes/licao-1/exercicio-1.txt"
    let exercicio = Exercicio [conteudo] "0"
    let licao = Licao "use o indicador" [exercicio] "0"
    putStrLn (exibirExercicio exercicio)