:- module(Licao, [conta_licoes_concluidas/1, inicia_licao/1]).

:- use_module('./Exercicio.pl').
:- use_module('./Controller.pl').
:- use_module('./Utils.pl').

id(1).
incrementa_id :- retract(id(X)), Y is X + 1, assert(id(Y)).
:- dynamic id/1.

ler_dados(Dados) :-
    (exists_file("tabelas/tabela_licao.txt") -> 
        open("tabelas/tabela_licao.txt", read, Stream), 
        read(Stream, DadosAux), 
        (DadosAux == end_of_file -> Dados = [] ; Dados = DadosAux),
        close(Stream) ; 
    Dados = []).

conta([], 0).
conta([(_, Status)|Dados], R) :-
    Status = "concluida",
    conta(Dados, R2),
    R is R2 + 1, !.
conta([(_, _)|Dados], R2) :- conta(Dados, R2).

conta_licoes_concluidas(R) :-
    ler_dados(Dados),
    conta(Dados, R).

inicia_licao(NumeroLicao) :-
    limpar_tela,
    licao(NumeroLicao, Exercicios, _),
    inicia_exercicio(Exercicios, 0).
