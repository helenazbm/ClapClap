:- module(_, [get_letra/2, formata_linhas_texto/3, exibe_progresso/2, exibe_licoes_concluidas/2, exibe_ranking/2, aplica_cor_instrucao/2]).

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

tags(["[VERMELHO]", "[VERDE]", "[AMARELO]", "[AZUL]", "[MAGENTA]", "[CIANO]", "[DEFAULT]"]).

    tag_cor("[VERMELHO]", "\e[31m").
    tag_cor("[VERDE]", "\e[32m").
    tag_cor("[AMARELO]", "\e[33m").
    tag_cor("[AZUL]", "\e[34m").
    tag_cor("[MAGENTA]", "\e[35m").
    tag_cor("[CIANO]", "\e[36m").
    tag_cor("[DEFAULT]", "\e[0m").


aplica_cor_instrucao(SemCor, LinhaColorida):- 
    tags(Tags),
    string_codes(SemCor, ListaDeCaracteres),
    findall(Tag, encontra_tag(ListaDeCaracteres, Tags, Tag), TagsTexto),
    substitui_tags_linha(SemCor, TagsTexto, LinhaColorida).

encontra_tag(Lista, Tags, Tag) :-
    append(_, _, Lista),
    member(Tag, Tags),
    string_codes(Tag, _).

substitui_tags_linha(Linha, [], Linha).
substitui_tags_linha(Linha, [Tag | Resto], Resultado):- 
    ( sub_string(Linha, _, _, _, Tag) ->
        tag_cor(Tag, Cor),
        replace_substring(Linha, Tag, Cor, NovaLinha),
        substitui_tags_linha(NovaLinha, Resto, Resultado)
    ; 
        substitui_tags_linha(Linha, Resto, Resultado)
    ).

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
get_cor_progresso(_, "vermelho").

preenche_progresso(_, 0, R) :- replica(45, '░', R).
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
    atom_string(Status, Status2),
    get_cor_status(Status2, Cor),
    aplica_cor_licoes(Dados, R2),
    aplica_cor_conteudo(Cor, Id, IdColorido),
    concatena_strings([IdColorido, ", ", R2], R).

exibe_licoes_concluidas(Dados, R) :-
    aplica_cor_licoes(Dados, LicoesConcluidas),
    concatena_strings(["                                                    Concluídas: [", LicoesConcluidas, "]"], R).

ajusta_wpm(_, 0, "") :- !.
ajusta_wpm([], N, R) :-
    N2 is N - 1,
    ajusta_wpm([], N2, R2),
    concatena_strings([R2, " "], R).
ajusta_wpm([Digito|Digitos], N, R) :-
    N2 is N - 1,
    ajusta_wpm(Digitos, N2, R2),
    concatena_strings([Digito, R2], R).

ajusta_nome(_, 0, "") :- !.
ajusta_nome([], N, R) :-
    N2 is N - 1,
    ajusta_nome([], N2, R2),
    concatena_strings([" ", R2], R).
ajusta_nome([Letra|Letras], N, R) :-
    N2 is N - 1,
    ajusta_nome(Letras, N2, R2),
    concatena_strings([Letra, R2], R).

formata_ranking([], "").
formata_ranking([(Id, Nome, Wpm)|Dados], R) :-
    formata_ranking(Dados, R2),
    atom_chars(Nome, CharsNome),
    ajusta_nome(CharsNome, 5, Nome2),
    atom_chars(Wpm, CharsWpm),
    ajusta_wpm(CharsWpm, 3, Wpm2),
    concatena_strings(["                                                             ", Id, " min", "   --------------- ", Nome2, " --------------- ", Wpm2, "\n", R2], R).

exibe_ranking(Dados, R) :-
    ler_arquivo("../dados/arteTxt/ranking.txt"),
    aplica_cor_conteudo("azul", "                                                             Desafio --------------- Nome ---------------- WPM\n", Cabecalho),
    aplica_cor_conteudo("azul", "                                                           _____________________________________________________\n\n", Linha),
    formata_ranking(Dados, LinhasFormatadas),
    concatena_strings([Linha, Cabecalho, LinhasFormatadas, Linha, "                                                            * Pressione Enter para voltar ao Menu de Desafios *\n"], R).

teste :-
    exibe_ranking([(1,"Ray", 10),(2,"Teste", 80),(3,"Oi",70)], R),
    writeln(R).