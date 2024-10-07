:- module(_, [conta_licoes_concluidas/1, inicia_licao/1, le_status/1, salva_status/1]).

:- use_module('./Exercicio.pl').
:- use_module('./Controller.pl').
:- use_module('./Utils.pl').

le_status(Dados) :-
    (exists_file("tabelas/tabela_licao.txt") -> 
        open("tabelas/tabela_licao.txt", read, Stream), 
        read(Stream, DadosAux), 
        (DadosAux == end_of_file -> Dados = [] ; Dados = DadosAux),
        close(Stream) ; 
    Dados = []).

altera_status(_, [], []).
altera_status(IdExercicio, [(Id, _)|Dados], [(Id, "concluida")|Dados2]) :-
    IdExercicio =:= Id,
    altera_status(IdExercicio, Dados, Dados2), !.
altera_status(IdExercicio, [(Id, Status)|Dados], [(Id, Status)|Dados2]) :-
    IdExercicio =\= Id,
    altera_status(IdExercicio, Dados, Dados2).

salva_status(Id) :-
    le_status(Dados),
    altera_status(Id, Dados, DadosAtual),
    open("tabelas/tabela_licao.txt", write, Stream),
    write(Stream, DadosAtual),
    write(Stream, "."),
    nl(Stream),
    close(Stream).

conta([], 0).
conta([(_, Status)|Dados], R) :-
    Status = concluida,
    conta(Dados, R2),
    R is R2 + 1, !.
conta([(_, _)|Dados], R2) :- conta(Dados, R2).

conta_licoes_concluidas(R) :-
    le_status(Dados),
    conta(Dados, R).

inicia_licao(NumeroLicao) :-
    limpar_tela,
    licao(NumeroLicao, Exercicios, _),
    salva_status(NumeroLicao),
    inicia_exercicio(Exercicios, 0, 0).

teste :-
    le_status(Dados),
    writeln(Dados),
    conta(Dados, R),
    writeln(R).