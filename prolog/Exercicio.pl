:- module(Exercicio, [ex/3, ex/4, ex/5]).

ex(1, Char, [[Char, "default"], [Char, "default"], [Char, "default"], [Char, "default"],
    [Char, "default"], [Char, "default"], [Char, "default"], [Char, "default"]]).

ex(2, Char1, Char2, [[Char1, "default"], [Char1, "default"], [Char1, "default"], [Char2, "default"],
    [Char1, "default"], [Char1, "default"], [Char1, "default"], [Char2, "default"], [Char1, "default"],
    [Char1, "default"], [Char1, "default"], [Char2, "default"], [Char1, "default"],[Char1, "default"],
    [Char1, "default"], [Char2, "default"]]).

ex(3, Char1, Char2, [[Char1, "default"], [Char2, "default"],[Char1, "default"], [Char2, "default"],
    [Char1, "default"], [Char2, "default"], [Char1, "default"], [Char2, "default"], [Char1, "default"],
    [Char2, "default"], [Char1, "default"], [Char2, "default"], [Char1, "default"], [Char2, "default"],
    [Char1, "default"], [Char2, "default"]]).

ex(4, Char1, Char2, Char3, [[Char1, "default"], [Char1, "default"], [Char3, "default"], [Char2, "default"],
    [Char2, "default"], [Char1, "default"], [Char1, "default"], [Char3, "default"], [Char2, "default"],
    [Char1, "default"], [Char1, "default"], [Char3, "default"], [Char2, "default"], [Char1, "default"],
    [Char1, "default"], [Char3, "default"], [Char2, "default"], [Char1, "default"], [Char1, "default"],
    [Char3, "default"], [Char2, "default"], [Char1, "default"], [Char1, "default"], [Char3, "default"]]).