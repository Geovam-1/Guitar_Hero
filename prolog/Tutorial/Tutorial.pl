:- module(tutorial, [mostrarTutorial/1]).
:- use_module('InterfaceTexto/Texto.pl').
:- use_module('Util.pl').

tutorial_guitar([
    "| A |   |   |   |   |\n|   |   |   |   |   |\n| A |   |   |   |   |\n|   |   |   | K |   |\n|   |   | J |   |   |\n|   |   |   |   | L |\n|---|---|---|---|---|\n| A | S | J | K | L |",
    "|   |   |   |   |   |\n| A |   |   |   |   |\n|   |   |   |   |   |\n| A |   |   |   |   |\n|   |   |   | K |   |\n|   |   | J |   |   |\n|---|---|---|---|---|\n| A | S | J | K | L |",
    "|   |   |   |   | L |\n|   |   |   |   |   |\n| A |   |   |   |   |\n|   |   |   |   |   |\n| A |   |   |   |   |\n|   |   |   | K |   |\n|---|---|---|---|---|\n| A | S | J | K | L |",
    "|   |   | J |   |   |\n|   |   |   |   | L |\n|   |   |   |   |   |\n| A |   |   |   |   |\n|   |   |   |   |   |\n| A |   |   |   |   |\n|---|---|---|---|---|\n| A | S | J | K | L |",
    "|   |   |   | K |   |\n|   |   | J |   |   |\n|   |   |   |   | L |\n|   |   |   |   |   |\n| A |   |   |   |   |\n|   |   |   |   |   |\n|---|---|---|---|---|\n| A | S | J | K | L |",
    "| A |   |   |   |   |\n|   |   |   | K |   |\n|   |   | J |   |   |\n|   |   |   |   | L |\n|   |   |   |   |   |\n| A |   |   |   |   |\n|---|---|---|---|---|\n| A | S | J | K | L |",
    "|   |   |   |   |   |\n| A |   |   |   |   |\n|   |   |   | K |   |\n|   |   | J |   |   |\n|   |   |   |   | L |\n|   |   |   |   |   |\n|---|---|---|---|---|\n| A | S | J | K | L |",
    "| A |   |   |   |   |\n|   |   |   |   |   |\n| A |   |   |   |   |\n|   |   |   | K |   |\n|   |   | J |   |   |\n|   |   |   |   | L |\n|---|---|---|---|---|\n| A | S | J | K | L |",
    "|   |   |   |   |   |\n| A |   |   |   |   |\n|   |   |   |   |   |\n| A |   |   |   |   |\n|   |   |   | K |   |\n|   |   | J |   |   |\n|---|---|---|---|---|\n| A | S | J | K | L |",
    "|   |   |   |   | L |\n|   |   |   |   |   |\n| A |   |   |   |   |\n|   |   |   |   |   |\n| A |   |   |   |   |\n|   |   |   | K |   |\n|---|---|---|---|---|\n| A | S | J | K | L |",
    "|   |   | J |   |   |\n|   |   |   |   | L |\n|   |   |   |   |   |\n| A |   |   |   |   |\n|   |   |   |   |   |\n| A |   |   |   |   |\n|---|---|---|---|---|\n| A | S | J | K | L |",
    "|   |   |   | K |   |\n|   |   | J |   |   |\n|   |   |   |   | L |\n|   |   |   |   |   |\n| A |   |   |   |   |\n|   |   |   |   |   |\n|---|---|---|---|---|\n| A | S | J | K | L |",
    "| A |   |   |   |   |\n|   |   |   | K |   |\n|   |   | J |   |   |\n|   |   |   |   | L |\n|   |   |   |   |   |\n| A |   |   |   |   |\n|---|---|---|---|---|\n| A | S | J | K | L |",
    "|   |   |   |   |   |\n| A |   |   |   |   |\n|   |   |   | K |   |\n|   |   | J |   |   |\n|   |   |   |   | L |\n|   |   |   |   |   |\n|---|---|---|---|---|\n| A | S | J | K | L |"
]).

mostrarTutorial(N) :-
    N > 0,
    tutorial_guitar(Estados),
    mostrarGuitarra(Estados, N).

mostrarGuitarra([], _).
mostrarGuitarra([Estado | Resto], N) :-
    limparTerminal,
    strT(TutorialTexto),
    writeln(TutorialTexto),
    colorirImprimirLinhas(Estado),
    nl,
    sleep(0.5),  
    N1 is N - 1, 
    mostrarGuitarra(Resto, N1).

strT(Str):-
    strTutorial(Str).
