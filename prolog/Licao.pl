:- module(Licao, [licao/2]).

:- use_module('./Exercicio.pl').

licao(1, [Ex1, Ex2, Ex3, Ex4]) :-
    ex(1, 'j', Ex1),
    ex(2, 'f', 'j', Ex2),
    ex(3, ' ', 'j', Ex3),
    ex(4, 'j', 'f', ' ', Ex4).