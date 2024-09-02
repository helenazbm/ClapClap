module Avaliacao where

contaLetrasExercicios :: [(Char, String)] -> Int
contaLetrasExercicios [] = 0
contaLetrasExercicios ((gabarito, cor):gabaritos) = 1 + contaLetrasExercicios gabaritos

contaErrosExercicios :: String -> [(Char, String)] -> Int
contaErrosExercicios _ [] = 0
contaErrosExercicios [] gabaritos = length gabaritos
contaErrosExercicios entrada gabaritos =
    let tamanhoEntrada = length entrada
        tamanhoGabarito = length gabaritos
        zipped = zip (take tamanhoEntrada (map fst gabaritos)) entrada
    in if tamanhoEntrada < tamanhoGabarito
           then tamanhoGabarito - tamanhoEntrada + sum [if e == g then 0 else 1 | (g, e) <- zipped]
           else sum [if e == g then 0 else 1 | (g, e) <- zipped]

calculaPrecisaoExercicios :: Int -> Int -> Float
calculaPrecisaoExercicios totalLetras totalErros =
    100.0 * fromIntegral (totalLetras - totalErros) / fromIntegral totalLetras

atribuaEstrelasLicao :: Float -> Int
atribuaEstrelasLicao precisao
    | precisao < 20.0 = 0
    | precisao <= 60.0 = 1
    | precisao <= 90.0 = 2
    | otherwise = 3

contaPalavrasDesafio :: String -> Int
contaPalavrasDesafio input = length (words input)

contaPalavrasCorretas :: String -> String -> Int
contaPalavrasCorretas fraseCorreta fraseDigitada =
    let palavrasCorretas = words fraseCorreta
        palavrasDigitadas = words fraseDigitada
        palavrasCorretasDigitadas = zip palavrasCorretas palavrasDigitadas
        palavrasCorretasCorretas = filter (\(c, d) -> c == d) palavrasCorretasDigitadas
    in length palavrasCorretasCorretas

calculaWpm :: Int -> Int -> Int
calculaWpm tempo palavras = (palavras * 60) `div` tempo

calculaPrecisaoDesafio :: Int -> Int -> Float
calculaPrecisaoDesafio palavrasDigitadas palavrasCorretas = 
    (100.0 * fromIntegral palavrasCorretas) / fromIntegral palavrasDigitadas

atribuaEstrelasDesafio :: Int -> Float -> Int
atribuaEstrelasDesafio ppm precisao
    | precisao < 20.0 || ppm < 20 = 0
    | precisao <= 60.0 || ppm <= 30 = 1
    | precisao <= 90.0 || ppm <= 40 = 2
    | otherwise = 3  