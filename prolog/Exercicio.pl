:- module(Exercicio, [corrige_exercicio/3]).

corrige_exercicio([], [], []).
corrige_exercicio([], [[Gab, _]|Gabarito], [[Gab, "vermelho"]|R]) :-
    corrige_exercicio([], Gabarito, R).
corrige_exercicio([En|Entrada], [[Gab, _]|Gabarito], [[Gab, "verde"]|R]) :-
    En = Gab,
    corrige_exercicio(Entrada, Gabarito, R), !.
corrige_exercicio([En|Entrada], [[Gab, _]|Gabarito], [[Gab, "vermelho"]|R]) :- 
    corrige_exercicio(Entrada, Gabarito, R).