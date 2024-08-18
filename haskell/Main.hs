import Licao
import Exercicio
import Sprites (makeTextLines)

ex1 :: Char -> Exercicio
ex1 char = Exercicio [(char, "green"), (char, "red"), (char, "default"), (char, "default"),
    (char, "default"), (char, "default"), (char, "default"), (char, "default")] "nao_iniciado"

ex2 :: Char -> Char -> Exercicio
ex2 char1 char2 = Exercicio [(char1, "green"), (char1, "red"), (char1, "default"), (char2, "default"),
    (char1, "default"), (char1, "default"), (char1, "default"), (char2, "default"),
    (char1, "default"), (char1, "default"), (char1, "default"), (char2, "default"),
    (char1, "default"), (char1, "default"), (char1, "default"), (char2, "default")] "nao_iniciado"

ex3 :: Char -> Char -> Exercicio
ex3 char1 char2 = Exercicio [(char1, "green"), (char2, "red"), (char1, "default"), (char2, "default"),
    (char1, "default"), (char2, "default"), (char1, "default"), (char2, "default"),
    (char1, "default"), (char2, "default"), (char1, "default"), (char2, "default"),
    (char1, "default"), (char2, "default"), (char1, "default"), (char2, "default")] "nao_iniciado"

licao1 :: Licao
licao1 = Licao "instrucao" [ex1 'j', ex2 'f' 'j', ex3 '_' 'j'] "nao_iniciado"

main :: IO ()
main = do
    let textLines = makeTextLines (exercicio (ex3 '_' 'j'))  " "

    mapM_ putStrLn textLines
