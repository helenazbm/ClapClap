:- module(Sprites, [get_letra/2, formata_linhas_texto/3, exibe_progresso/2, exibe_licoes_concluidas/2]).

:- use_module('./Utils.pl').
:- use_module('./Controller.pl').
:- use_module('./Exercicio.pl').

get_letra('a', R) :- unlines([
    "▄▀▀▄",
    "█■■█",
    "█  █"
], R), !.

get_letra('b', R) :- unlines([
    "█▀▀▄",
    "█■■█",
    "█▄▄▀"
], R), !.

get_letra('c', R) :- unlines([
    "▄▀▀▄",
    "█   ",
    "▀▄▄▀"
], R), !.

get_letra('d', R) :- unlines([
    "█▀▀▄",
    "█  █",
    "█▄▄▀"
], R), !.

get_letra('e', R) :- unlines([
    "▄▀▀▀",
    "█■■ ",
    "▀▄▄▄"
], R), !.

get_letra('f', R) :- unlines([
    "▄▀▀▀",
    "█■■ ",
    "█   "
], R), !.

get_letra('g', R) :- unlines([
    "▄▀▀ ",
    "█ ▀█",
    "▀▄▄▀"
], R), !.

get_letra('h', R) :- unlines([
    "█  █",
    "█■■█",
    "█  █"
], R), !.

get_letra('i', R) :- unlines([
    " ▐▌ ",
    " ▐▌ ",
    " ▐▌ "
], R), !.

get_letra('j', R) :- unlines([
    "   █",
    "   █",
    "▀▄▄▀"
], R), !.

get_letra('k', R) :- unlines([
    "█ ▄▀",
    "██  ",
    "█ ▀▄"
], R), !.

get_letra('l', R) :- unlines([
    "█   ",
    "█   ",
    "▀▄▄▄"
], R), !.

get_letra('m', R) :- unlines([
    "█▄▄█",
    "█▐▌█",
    "█  █"
], R), !.

get_letra('n', R) :- unlines([
    "█▄ █",
    "█ ▀█",
    "█  █"
], R), !.

get_letra('o', R) :- unlines([
    "▄▀▀▄",
    "█  █",
    "▀▄▄▀"
], R), !.

get_letra('p', R) :- unlines([
    "█▀▀▄",
    "█▄▄▀",
    "█   "
], R), !.

get_letra('q', R) :- unlines([
    "▄▀▀▄",
    "█  █",
    " ▀▀▄"
], R), !.

get_letra('r', R) :- unlines([
    "█▀▀▄",
    "█▄▄▀",
    "█  █"
], R), !.

get_letra('s', R) :- unlines([
    "▄▀▀▀",
    " ▀▀▄",
    "▄▄▄▀"
], R), !.

get_letra('t', R) :- unlines([
    "▀▐▌▀",
    " ▐▌ ",
    " ▐▌ "
], R), !.

get_letra('u', R) :- unlines([
    "█  █",
    "█  █",
    "▀▄▄▀"
], R), !.

get_letra('v', R) :- unlines([
    "█  █",
    "▐▌▐▌",
    " ▐▌ "
], R), !.

get_letra('w', R) :- unlines([
    "█  █",
    "█▐▌█",
    "█▀▀█"
], R), !.

get_letra('x', R) :- unlines([
    "▀▄▄▀",
    " ▐▌ ",
    "▄▀▀▄"
], R), !.

get_letra('y', R) :- unlines([
    "▀▄▄▀",
    " ▐▌ ",
    " ▐▌ "
], R), !.

get_letra('z', R) :- unlines([
    "▀▀▀█",
    " ▄▀ ",
    "█▄▄▄"
], R), !.

get_letra(' ', R) :- unlines([
    "    ",
    "    ",
    "████"
], R), !.

get_letra('.', R) :- unlines([
    "    ",
    "    ",
    " ▄  "
], R), !.

get_letra(',', R) :- unlines([
    "    ",
    "    ",
    "▄▀  "
], R), !.

get_letra(';', R) :- unlines([
    "    ",
    " ▀  ",
    "▄▀  "
], R), !.

get_letra('~', R) :- unlines([
    "    ",
    "▀■▀■",
    "    "
], R), !.

get_letra('ã', R) :- unlines([
    "▀■▀■",
    "▄▀▀▄",
    "█■■█",
    "█  █"
], R), !.

get_letra('õ', R) :- unlines([
    "▀■▀■",
    "▄▀▀▄",
    "█  █",
    "▀▄▄▀"
], R), !.

get_letra('´', R) :- unlines([
    "  ■▀",
    "    ",
    "    "
], R), !.

get_letra('á', R) :- unlines([
    "  ■▀",
    "▄▀▀▄",
    "█■■█",
    "█  █"
], R), !.

get_letra('é', R) :- unlines([
    "  ■▀",
    "▄▀▀▀",
    "█■■ ",
    "▀▄▄▄"
], R), !.

get_letra('è', R) :- unlines([
    "▀■  ",
    "▄▀▀▀",
    "█■■ ",
    "▀▄▄▄"
], R), !.

get_letra('ó', R) :- unlines([
    "  ■▀",
    "▄▀▀▄",
    "█  █",
    "▀▄▄▀"
], R), !.

get_letra('`', R) :- unlines([
    "▀■  ",
    "    ",
    "    "
], R), !.

get_letra('à', R) :- unlines([
    "▀■  ",
    "▄▀▀▄",
    "█■■█",
    "█  █"
], R), !.

get_letra('ò', R) :- unlines([
    "▀■  ",
    "▄▀▀▄",
    "█  █",
    "▀▄▄▀"
], R), !.

get_letra('^', R) :- unlines([
    "■▀▀■",
    "    ",
    "    "
], R), !.

get_letra('â', R) :- unlines([
    "■▀▀■",
    "▄▀▀▄",
    "█■■█",
    "█  █"
], R), !.

get_letra('ê', R) :- unlines([
    "■▀▀■",
    "▄▀▀▀",
    "█■■ ",
    "▀▄▄▄"
], R), !.

get_letra('ô', R) :- unlines([
    "■▀▀■",
    "▄▀▀▄",
    "█  █",
    "▀▄▄▀"
], R), !.

get_letra('ç', R) :- unlines([
    "▄▀▀▄",
    "█   ",
    "▀■■▀",
    "■▀  "
], R), !.

get_cor("vermelho", "\e[31m").
get_cor("verde", "\e[32m").
get_cor("amarelo", "\e[33m").
get_cor("azul", "\e[34m").
get_cor("laranja", "\e[38;5;208m").
get_cor("magenta", "\e[35m").
get_cor("ciano", "\e[36m").
get_cor("default", "\e[0m").

aplica_cor_conteudo(_, "", "").
aplica_cor_conteudo(Cor, Conteudo, R) :-
    get_cor(Cor, CodigoCor),
    get_cor("default", CodigoDefaultCor),
    concatena_strings([CodigoCor, Conteudo, CodigoDefaultCor], R).

aplica_cor([], _, "").
aplica_cor([Sprite|Sprites], Cor, R) :-
    aplica_cor_conteudo(Cor, Sprite, R2),
    aplica_cor(Sprites, Cor, R3),
    concatena_strings([R2, R3], R).

concatena_linha([Sprite|[]], NumeroLinha, _, R) :-
    nth0(NumeroLinha, Sprite, R).
concatena_linha([Sprite|Sprites], NumeroLinha, Espaco, R) :-
    nth0(NumeroLinha, Sprite, Elemento),
    concatena_linha(Sprites, NumeroLinha, Espaco, R2),
    concatena_strings([Elemento, Espaco, R2], R).

concatena_linhas(Sprites, NumeroLinha, Espaco, [R2|R3]) :-
    nth0(0, Sprites, Sprite),
    length(Sprite, Tamanho),
    NumeroLinha < Tamanho,
    concatena_linha(Sprites, NumeroLinha, Espaco, R2),
    NumeroLinhaInc is NumeroLinha + 1,
    concatena_linhas(Sprites, NumeroLinhaInc, Espaco, R3), !.
concatena_linhas(_, _, _, []).

aplica_cor_sprites([], []).
aplica_cor_sprites([[Char, Cor]|Dados], [SpriteColorida|R]) :-
    get_letra(Char, Sprite),
    string_chars(Sprite, Chars),
    aplica_cor(Chars, Cor, SpriteColorida),
    aplica_cor_sprites(Dados, R).

formata_linhas_texto(Dados, Espaco, R) :-
    aplica_cor_sprites(Dados, SpritesColoridos),
    maplist(lines, SpritesColoridos, R2),
    concatena_linhas(R2, 0, Espaco, R).

replica(0, _, "") :- !.
replica(N, Caracter, R) :-
    N2 is N - 1,
    replica(N2, Caracter, R2),
    concatena_strings([Caracter, R2], R).

get_cor_progresso(Total, "verde") :- Total =:= 15, !.
get_cor_progresso(Total, "amarelo") :- Total >= 10, !.
get_cor_progresso(Total, "laranja") :- Total >= 5, !.
get_cor_progresso(Total, "vermelho").

preenche_progresso(Cor, 0, R) :- replica(45, '░', R).
preenche_progresso(Cor, Total, R) :-
    TotalBlocos = 45,
    BlocosPreenchidos = Total * 3,
    replica(BlocosPreenchidos, '▓', Progresso),
    aplica_cor_conteudo(Cor, Progresso, ProgressoColoridos),
    RestanteBlocos is TotalBlocos - BlocosPreenchidos,
    replica(RestanteBlocos, '░', ProgressoRestante),
    concatena_strings([ProgressoColoridos, ProgressoRestante], R).

exibe_progresso(Total, R) :-
    get_cor_progresso(Total, Cor),
    preenche_progresso(Cor, Total, Progresso),
    Percentual is Total / 15 * 100,
    PercentualArredondado is round(Percentual * 100) / 100,
    concatena_strings(["                                                    Progresso: [", Progresso, "] ", PercentualArredondado, "%"], R).

get_cor_status("concluida", "verde").
get_cor_status("pendente", "vermelho").

aplica_cor_licoes([], "").
aplica_cor_licoes([(Id, Status)], R) :-
    atom_string(Status, String),
    get_cor_status(String, Cor),
    aplica_cor_licoes([], R2),
    aplica_cor_conteudo(Cor, Id, IdColorido),
    concatena_strings([IdColorido, R2], R), !.
aplica_cor_licoes([(Id, Status)|Dados], R) :-
    atom_string(Status, String),
    get_cor_status(String, Cor),
    aplica_cor_licoes(Dados, R2),
    aplica_cor_conteudo(Cor, Id, IdColorido),
    concatena_strings([IdColorido, ", ", R2], R).

exibe_licoes_concluidas(Dados, R) :-
    aplica_cor_licoes(Dados, LicoesConcluidas),
    concatena_strings(["                                                    Concluídas: [", LicoesConcluidas, "]"], R).

teste2 :-
    licao(1, Exercicios, _),
    nth0(0, Exercicios, Exercicio),
    corrige_exercicio(['j', 'j', 'j', 'j', 'j', 'j', 'j', 'j'], Exercicio, ExercicioCorrigido),
    formata_linhas_texto(ExercicioCorrigido, " ", Sprites),
    unlines(Sprites, R),
    writeln(R).

teste :-
    licao(1, Exercicios, _),
    nth0(3, Exercicios, Exercicio),
    formata_linhas_texto(Exercicio, " ", Sprites),
    unlines(Sprites, R),
    writeln(R).

teste3 :-
    exibe_licoes_concluidas([(1,concluida),(2,concluida),(3,pendente),(4,pendente)], R),
    writeln(R).