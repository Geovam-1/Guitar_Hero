 :- module(interface_texto, [strBemvindo/1, strNickName/1, strInicial/2, strMusicas/1, strDificuldade/1, strTutorial/1, strFimJogo/3, msgFinal/0]). 

strBemvindo(Str) :-
    Strs = [
        "  ▄▀    ▄   ▄█    ▄▄▄▄▀ ██   █▄▄▄▄      ▄  █ ██      ▄▄▄▄▄   █  █▀ ▄███▄   █    █     \n",
        "▄▀       █  ██ ▀▀▀ █    █ █  █  ▄▀     █   █ █ █    █     ▀▄ █▄█   █▀   ▀  █    █     \n",
        "█ ▀▄  █   █ ██     █    █▄▄█ █▀▀▌      ██▀▀█ █▄▄█ ▄  ▀▀▀▀▄   █▀▄   ██▄▄    █    █     \n",
        "█   █ █   █ ▐█    █     █  █ █  █      █   █ █  █  ▀▄▄▄▄▀    █  █  █▄   ▄▀ ███▄ ███▄  \n",
        " ███  █▄ ▄█  ▐   ▀         █   █          █     █              █   ▀███▀       ▀    ▀ \n",
        "       ▀▀▀                █   ▀          ▀     █              ▀                       \n",
        "                         ▀                    ▀                                       \n",
        "                                                                                      \n",
        "                  Prepare-se para o desafio! Bem-vindo ao Guitar Hero                 \n",
        "                                                                                      \n",
        "                                  1: Add Nickname                                     \n",
        "                                  2: Sair                                             \n"
    ],
    atomics_to_string(Strs, "", Str). 

strNickName(Str) :-
    Strs = [
        "  ▄▀    ▄   ▄█    ▄▄▄▄▀ ██   █▄▄▄▄      ▄  █ ██      ▄▄▄▄▄   █  █▀ ▄███▄   █    █     \n",
        "▄▀       █  ██ ▀▀▀ █    █ █  █  ▄▀     █   █ █ █    █     ▀▄ █▄█   █▀   ▀  █    █     \n",
        "█ ▀▄  █   █ ██     █    █▄▄█ █▀▀▌      ██▀▀█ █▄▄█ ▄  ▀▀▀▀▄   █▀▄   ██▄▄    █    █     \n",
        "█   █ █   █ ▐█    █     █  █ █  █      █   █ █  █  ▀▄▄▄▄▀    █  █  █▄   ▄▀ ███▄ ███▄  \n",
        " ███  █▄ ▄█  ▐   ▀         █   █          █     █              █   ▀███▀       ▀    ▀ \n",
        "       ▀▀▀                █   ▀          ▀     █              ▀                       \n",
        "                         ▀                    ▀                                       \n",
        "                                                                                      \n",
        "                              Digite seu NickName:                                    \n",
        "                                                                                      \n",
        "                                  1: Voltar                                           \n"
    ],
    atomics_to_string(Strs, "", Str).

strInicial(NickName, Str) :-
    format(atom(Player), '                                  Jogador: ~w                         \n', [NickName]),
    append([
        "  ▄▀    ▄   ▄█    ▄▄▄▄▀ ██   █▄▄▄▄      ▄  █ ██      ▄▄▄▄▄   █  █▀ ▄███▄   █    █     \n",
        "▄▀       █  ██ ▀▀▀ █    █ █  █  ▄▀     █   █ █ █    █     ▀▄ █▄█   █▀   ▀  █    █     \n",
        "█ ▀▄  █   █ ██     █    █▄▄█ █▀▀▌      ██▀▀█ █▄▄█ ▄  ▀▀▀▀▄   █▀▄   ██▄▄    █    █     \n",
        "█   █ █   █ ▐█    █     █  █ █  █      █   █ █  █  ▀▄▄▄▄▀    █  █  █▄   ▄▀ ███▄ ███▄  \n",
        " ███  █▄ ▄█  ▐   ▀         █   █          █     █              █   ▀███▀       ▀    ▀ \n",
        "       ▀▀▀                █   ▀          ▀     █              ▀                       \n",
        "                         ▀                    ▀                                       \n",
        "                                                                                      \n"
    ], [Player, "\n                                  1: Jogar                                            \n", "                                  2: Tutorial                                         \n", "                                  3: Voltar                                           \n"], Strs),
    atomics_to_string(Strs, "", Str).


strMusicas(Str) :-
    Strs = [
        "  ▄▀    ▄   ▄█    ▄▄▄▄▀ ██   █▄▄▄▄      ▄  █ ██      ▄▄▄▄▄   █  █▀ ▄███▄   █    █     \n",
        "▄▀       █  ██ ▀▀▀ █    █ █  █  ▄▀     █   █ █ █    █     ▀▄ █▄█   █▀   ▀  █    █     \n",
        "█ ▀▄  █   █ ██     █    █▄▄█ █▀▀▌      ██▀▀█ █▄▄█ ▄  ▀▀▀▀▄   █▀▄   ██▄▄    █    █     \n",
        "█   █ █   █ ▐█    █     █  █ █  █      █   █ █  █  ▀▄▄▄▄▀    █  █  █▄   ▄▀ ███▄ ███▄  \n",
        " ███  █▄ ▄█  ▐   ▀         █   █          █     █              █   ▀███▀       ▀    ▀ \n",
        "       ▀▀▀                █   ▀          ▀     █              ▀                       \n",
        "                         ▀                    ▀                                       \n",
        "                                                                                      \n",
        "                                    Músicas:                                          \n",
        "                                                                                      \n",
        "                    1: Even Flow - Pearl Jam                                          \n",
        "                    2: Paint it, Black - The Rolling Stones                           \n",
        "                    3: Bulls On Parade - Rage Against The Machine                     \n",
        "                    4: Voltar                                                         \n"
    ],
    atomics_to_string(Strs, "", Str).


msgFinal :-
    write("Aperte Ctrl + Z para fechar o jogo.").

