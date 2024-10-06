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
    nth0(Numero, Exercicios, Exercicio),   
    formata_linhas_texto(Exercicio, " ", Sprites), 
    unlines(Sprites, R),  
    writeln(R),
    writeln("Digite sua resposta: "),
    ler_entrada(Entrada), 
    string_chars(Entrada, ListaEntrada),  
    corrige_exercicio(ListaEntrada, Exercicio, ExercicioCorrigido),
    formata_linhas_texto(ExercicioCorrigido, " ", SpritesCorrigidos),
    unlines(SpritesCorrigidos, RCorrigido),
    writeln(RCorrigido),  % Exibe o resultado corrigido
    writeln("Pressione Enter para continuar..."),
    ler_entrada(_), 
    ProximoNumero is Numero + 1,
    inicia_exercicio(Exercicios, ProximoNumero).


corrige_exercicio([], [], []).
corrige_exercicio([], [[Gab, _]|Gabarito], [[Gab, "vermelho"]|R]) :-
    corrige_exercicio([], Gabarito, R).
corrige_exercicio([En|Entrada], [[Gab, _]|Gabarito], [[Gab, "verde"]|R]) :-
    En = Gab,
    corrige_exercicio(Entrada, Gabarito, R), !.
corrige_exercicio([En|Entrada], [[Gab, _]|Gabarito], [[Gab, "vermelho"]|R]) :- 
    corrige_exercicio(Entrada, Gabarito, R).

