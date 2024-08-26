module Avaliacao where


contarLetrasExercicios :: [(Char, String)] -> Int
contarLetrasExercicios [] = 0
contarLetrasExercicios ((gabarito, cor):gabaritos) = 1 + contarLetrasExercicios gabaritos

contarErrosExercicios :: String -> [(Char, String)] -> Int
contarErrosExercicios _ [] = 0
contarErrosExercicios [] gabaritos = length gabaritos
contarErrosExercicios entrada gabaritos =
    let tamanhoEntrada = length entrada
        tamanhoGabarito = length gabaritos
        zipped = zip (take tamanhoEntrada (map fst gabaritos)) entrada
    in if tamanhoEntrada < tamanhoGabarito
           then tamanhoGabarito - tamanhoEntrada + sum [if e == g then 0 else 1 | (g, e) <- zipped]
           else sum [if e == g then 0 else 1 | (g, e) <- zipped]

calcularPrecisaoExercicios :: Int -> Int -> Float
calcularPrecisaoExercicios totalLetras totalErros =
    100.0 * fromIntegral (totalLetras - totalErros) / fromIntegral totalLetras

atribuirEstrelasLicao :: Float -> Int
atribuirEstrelasLicao precisao
    | precisao < 20.0 = 0
    | precisao <= 60.0 = 1
    | precisao <= 90.0 = 2
    | otherwise = 3     