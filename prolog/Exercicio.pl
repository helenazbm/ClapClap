:- module(_, [corrige_exercicio/3, inicia_exercicio/3]).
:- use_module('./Utils.pl').
:- use_module('./Sprites.pl').
:- use_module('./Controller.pl').
:- use_module('./Exercicio.pl').
:- use_module('./Avaliacao.pl').
:- use_module('./Menu.pl').
    
inicia_exercicio(Exercicios, Numero, TotalErros) :-
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
    conta_erros_exercicio(ExercicioCorrigido, TotalErrosExercicio),
    TotalErrosAtualizado is TotalErros + TotalErrosExercicio,
    formata_linhas_texto(ExercicioCorrigido, " ", SpritesCorrigidos),
    unlines(SpritesCorrigidos, RCorrigido),
    writeln(RCorrigido),
    nl,
    delay,
    ProximoNumero is Numero + 1,
    inicia_exercicio(Exercicios, ProximoNumero, TotalErrosAtualizado).

inicia_exercicio(Exercicios, _, TotalErros) :-
    limpar_tela,
    avalia_licao(Exercicios, TotalErros, _),
    nl,
    ler_entrada(_),
    lista_licoes.

avalia_licao(Exercicios, TotalErros, Estrelas) :-
    conta_letras_licao(Exercicios, TotalLetras),
    calcula_precisao_licao(TotalLetras, TotalErros, Precisao),
    exibe_estrelas_licao(Precisao, Estrelas).

corrige_exercicio(_, [], []).
corrige_exercicio([], [[Gab, _]|Gabarito], [[Gab, "vermelho"]|R]) :-
    corrige_exercicio([], Gabarito, R).
corrige_exercicio([En|Entrada], [[Gab, _]|Gabarito], [[Gab, "verde"]|R]) :-
    En = Gab,
    corrige_exercicio(Entrada, Gabarito, R), !.
corrige_exercicio([_|Entrada], [[Gab, _]|Gabarito], [[Gab, "vermelho"]|R]) :- 
    corrige_exercicio(Entrada, Gabarito, R).