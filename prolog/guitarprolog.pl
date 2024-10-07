:- use_module('InterfaceTexto/Texto.pl').
:- use_module('MusicPlayer.pl').
:- use_module('Tutorial/Tutorial.pl').
:- use_module('Util.pl').
:- use_module('MusicData.pl').
:- use_module('Jogo.pl').
:- use_module(library(time)).
:- use_module(library(readutil)).
:- use_module(library(strings)).
:- use_module(library(process)).

emptyString(String) :-
    string_length(String, Length),
    Length =:= 0.

menuBemVindo :-
    limparTerminal,
    strBemvindo(Str),
    write(Str),
    get_single_char(Char),
    (Char = 49 -> menuNickName;
    Char = 50 -> pararMusica, encerraPrograma;
    writeln('Comando Invalido! Tente novamente.'),
    sleep(1),
    limparTerminal,
    menuBemVindo).

menuNickName :-
    limparTerminal,
    strNickName(Str),
    write(Str),
    read_string(user_input, "\n", "", _, NickName),
    (NickName = "1" -> menuBemVindo ;
    emptyString(NickName) -> writeln('Insira um nome valido!'),
    sleep(1),
    menuNickName;
    menuInicial(NickName)).

menuInicial(NickName) :-
    limparTerminal,
    strInicial(NickName, Str),
    write(Str),
    get_single_char(Char),
    (Char = 49 -> menuMusicas(NickName);
    Char = 50 -> mostrarTutorial(2), menuInicial(NickName);
    Char = 51 -> menuNickName;
    writeln('Comando Invalido! Tente novamente.'),
    sleep(1),
    menuInicial(NickName)).

menuMusicas(NickName) :-
    limparTerminal,
    strMusicas(Str),
    write(Str),
    get_single_char(Char),
    (Char = 49 -> menuDificuldade(NickName, "1");
    Char = 50 -> menuDificuldade(NickName, "2");
    Char = 51 -> menuDificuldade(NickName, "3"); 
    Char = 52 -> menuInicial(NickName) ;
    writeln('Comando Invalido! Tente novamente.'),
    sleep(1),
    menuMusicas(NickName)).

menuDificuldade(NickName, Musica) :-
    limparTerminal,
    strDificuldade(Str),
    write(Str),
    get_single_char(Char),
    (Char = 49 -> iniciarJogo("1", Musica, NickName);
    Char = 50 -> iniciarJogo("2", Musica, NickName);
    Char = 51 -> menuMusicas(NickName) ;
    writeln('Comando Invalido! Tente novamente.'),
    sleep(1),
    menuDificuldade(NickName, Musica)).

iniciarJogo(Dificuldade, Musica, NickName):-
    pararMusica,
    tocarMusica(Musica),
    getMusicNotes(Musica, Dificuldade, Notas),
    limparTerminal,
    jogo(Notas, NickName),
    tocarMusicaMenu,
    menuInicial(NickName).

menu :-
    limparTerminal,
    tocarMusicaMenu,
    menuBemVindo.
    