:- use_module('InterfaceTexto/Texto.pl').
:- use_module(library(readutil)).
:- use_module(library(sleep)).
:- use_module(library(strings)).

limparTerminal :-
    shell('clear').

emptyString(String) :-
    string_length(String, Length),
    Length =:= 0.

clearBuffer :-
    get_char(_),  
    peek_char(Char),  
    ( Char == '\n' -> clear_buffer ; 
        true).


menuBemVindo :-
    limparTerminal,
    strBemvindo(Str),
    write(Str),
    read_line_to_codes(user_input, X3),
    string_to_atom(X3,Char),
    write(Char),
    (Char = '1' -> menuNickName ;
        (Char = '2' -> encerra_programa ;
            writeln('Comando Invalido! Tente novamente.'),
            sleep(2),
            limparTerminal,
            menuBemVindo)).


/* Problema com a parte de entrada vazia para aejitar */
menuNickName :-
    limparTerminal,
    strNickName(Str),
    write(Str),
    read_line_to_codes(user_input, Codes),
    string_codes(NickName, Codes), 
    (NickName = "1" -> menuBemVindo ;
        ( emptyString(NickName) -> writeln('Insira um nome valido!'),
        sleep(2),
        menuNickName ;
            menuInicial(NickName))).

menuInicial(NickName) :-
    limparTerminal,
    strInicial(NickName, Str),
    write(Str),
    read_line_to_codes(user_input, Codes),
    string_codes(Op, Codes),
    (Op = "1" -> menuMusicas(NickName) ;
        (Op = "2" -> write('Tutorial') ;
            writeln('Comando Invalido! Tente novamente.'),
            sleep(2),
            menuInicial(NickName))).


menuMusicas(NickName) :-
    limparTerminal,
    strMusicas(Str),
    write(Str), halt.

encerra_programa :-
    write('Encerrando o programa...\n'),
    halt.  


main :-
    limparTerminal,
    menuBemVindo.
    