:- module(musicPlayer, [tocarMusica/1, tocarMusicaMenu/0, pararMusica/0]).

tocarMusica(Musica) :-
    (Musica = "1" -> shell("cvlc --play-and-exit musicas/Even.mp3 > /dev/null 2>&1  &");
    Musica = "2" -> shell("cvlc --play-and-exit musicas/Paint.mp3 > /dev/null 2>&1  &");
    shell("cvlc --play-and-exit musicas/Bulls.mp3 > /dev/null 2>&1  &")).

tocarMusicaMenu :-
    shell("cvlc --loop musicas/Menu.mp3 > /dev/null 2>&1 &").

pararMusica :-
    shell("pkill vlc").