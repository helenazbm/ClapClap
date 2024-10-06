:- module(Exercicio, [corrige_exercicio/3, inicia_exercicio/2]).
:- use_module('./Utils.pl').
:- use_module('./Sprites.pl').
:- use_module('./Controller.pl').
:- use_module('./Exercicio.pl').

    
inicia_exercicio(Exercicios, Numero) :-
    length(Exercicios, Tamanho),
    Numero < Tamanho, 
    NumeroExercicio is Numero + 1,
    format('Exercício ~w~n', [NumeroExercicio]), 
    nl,
    nth0(Numero, Exercicios, Exercicio),   
    formata_linhas_texto(Exercicio, " ", Sprites), 
    unlines(Sprites, R),  
    writeln(R),
    nl,
    ler_entrada(Entrada), 
    nl,
    string_chars(Entrada, ListaEntrada),  
    corrige_exercicio(ListaEntrada, Exercicio, ExercicioCorrigido),
    formata_linhas_texto(ExercicioCorrigido, " ", SpritesCorrigidos),
    unlines(SpritesCorrigidos, RCorrigido),
    writeln(RCorrigido),
    nl,
    delay,
    ProximoNumero is Numero + 1,
    inicia_exercicio(Exercicios, ProximoNumero).

inicia_exercicio(Exercicios, Numero) :-
    %nesse passo colocar a avaliação do exercício
    length(Exercicios, Tamanho),
    Numero >= Tamanho,  
    writeln('fim da lição').

corrige_exercicio(_, [], []).
corrige_exercicio([], [[Gab, _]|Gabarito], [[Gab, "vermelho"]|R]) :-
    corrige_exercicio([], Gabarito, R).
corrige_exercicio([En|Entrada], [[Gab, _]|Gabarito], [[Gab, "verde"]|R]) :-
    En = Gab,
    corrige_exercicio(Entrada, Gabarito, R), !.
corrige_exercicio([En|Entrada], [[Gab, _]|Gabarito], [[Gab, "vermelho"]|R]) :- 
    corrige_exercicio(Entrada, Gabarito, R).

