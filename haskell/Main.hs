import Licao
import Exercicio
import Sprites (makeTextLines)

ex :: Exercicio
ex = Exercicio [('a', "green"), ('a', "red"), ('a', "default"), ('a', "default"), ('a', "default"),
    ('a', "default"), ('a', "default"), ('a', "default"), ('a', "default"), ('a', "default")] "nao_iniciada"

main :: IO ()
main = do
    let textLines = makeTextLines (exercicio ex) " "

    mapM_ putStrLn textLines
