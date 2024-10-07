:- module(util, [limparTerminal/0, colorirImprimirLinhas/1, encerraPrograma/0]).

limparTerminal :-
    shell('clear').
    
colorirImprimirLinhas(Linha) :-
    colorirLinha(Linha).

colorirLinha(Linha) :-
    string_chars(Linha, Chars),    
    maplist(colorirLetra, Chars).

colorirLetra('A') :- ansi_format([bold, fg(green)], '~w', ['A']). 
colorirLetra('S') :- ansi_format([bold, fg(red)], '~w', ['S']).   
colorirLetra('J') :- ansi_format([bold, fg(yellow)], '~w', ['J']). 
colorirLetra('K') :- ansi_format([bold, fg(blue)], '~w', ['K']).   
colorirLetra('L') :- ansi_format([bold, fg(magenta)], '~w', ['L']). 
colorirLetra(C) :- write(C).

encerraPrograma :-
    limparTerminal,
    write('Encerrando o programa...\n'),
    sleep(0.5),
    halt.  