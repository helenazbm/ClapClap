:- module(Licao, [inicia_licao/1]).
:- use_module('./Exercicio.pl').
:- use_module('./Controller.pl').
:- use_module('./Utils.pl').

inicia_licao(NumeroLicao) :-
    limpar_tela,
    licao(NumeroLicao, Exercicios, _),
    inicia_exercicio(Exercicios, 0).
