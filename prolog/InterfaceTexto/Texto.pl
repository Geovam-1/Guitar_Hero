 :- module(interfaceTexto, [strBemvindo/1, strNickName/1, strInicial/2, strMusicas/1, strDificuldade/1, strTutorial/1, strDificuldade/1, strFimDeJogo/3]). 

strBemvindo(Str) :-
    Strs = [
        "  ▄▀    ▄   ▄█    ▄▄▄▄▀ ██   █▄▄▄▄     █ ▄▄  █▄▄▄▄ ████▄ █    ████▄   ▄▀  \n",
        "▄▀       █  ██ ▀▀▀ █    █ █  █  ▄▀     █   █ █  ▄▀ █   █ █    █   █ ▄▀    \n",
        "█ ▀▄  █   █ ██     █    █▄▄█ █▀▀▌      █▀▀▀  █▀▀▌  █   █ █    █   █ █ ▀▄  \n",
        "█   █ █   █ ▐█    █     █  █ █  █      █     █  █  ▀████ ███▄ ▀████ █   █ \n",
        " ███  █▄ ▄█  ▐   ▀         █   █        █      █             ▀       ███  \n",
        "       ▀▀▀                █   ▀          ▀    ▀                           \n",
        "                         ▀                                                \n",
        "                                                                          \n",
        "          Prepare-se para o desafio! Bem-vindo ao Guitar Hero             \n",
        "                                                                          \n",
        "                          1: Add Nickname                                 \n",
        "                          2: Sair                                         \n"
    ],
    atomics_to_string(Strs, "", Str). 

strNickName(Str) :-
    Strs = [
        "  ▄▀    ▄   ▄█    ▄▄▄▄▀ ██   █▄▄▄▄     █ ▄▄  █▄▄▄▄ ████▄ █    ████▄   ▄▀  \n",
        "▄▀       █  ██ ▀▀▀ █    █ █  █  ▄▀     █   █ █  ▄▀ █   █ █    █   █ ▄▀    \n",
        "█ ▀▄  █   █ ██     █    █▄▄█ █▀▀▌      █▀▀▀  █▀▀▌  █   █ █    █   █ █ ▀▄  \n",
        "█   █ █   █ ▐█    █     █  █ █  █      █     █  █  ▀████ ███▄ ▀████ █   █ \n",
        " ███  █▄ ▄█  ▐   ▀         █   █        █      █             ▀       ███  \n",
        "       ▀▀▀                █   ▀          ▀    ▀                           \n",
        "                         ▀                                                \n",
        "                                                                          \n",
        "                          Digite seu NickName:                            \n",
        "                                                                          \n",
        "                               1: Voltar                                  \n"
    ],
    atomics_to_string(Strs, "", Str).

strInicial(NickName, Str) :-
    format(atom(Player), '                              Jogador: ~w                         \n', [NickName]),
    append([
        "  ▄▀    ▄   ▄█    ▄▄▄▄▀ ██   █▄▄▄▄     █ ▄▄  █▄▄▄▄ ████▄ █    ████▄   ▄▀  \n",
        "▄▀       █  ██ ▀▀▀ █    █ █  █  ▄▀     █   █ █  ▄▀ █   █ █    █   █ ▄▀    \n",
        "█ ▀▄  █   █ ██     █    █▄▄█ █▀▀▌      █▀▀▀  █▀▀▌  █   █ █    █   █ █ ▀▄  \n",
        "█   █ █   █ ▐█    █     █  █ █  █      █     █  █  ▀████ ███▄ ▀████ █   █ \n",
        " ███  █▄ ▄█  ▐   ▀         █   █        █      █             ▀       ███  \n",
        "       ▀▀▀                █   ▀          ▀    ▀                           \n",
        "                         ▀                                                \n",
        "                                                                          \n"
    ], 
    [Player, "\n                              1: Jogar                             \n", 
    "                              2: Tutorial                                     \n", 
    "                              3: Voltar                                       \n"], Strs),
    atomics_to_string(Strs, "", Str).


strMusicas(Str) :-
    Strs = [
        "  ▄▀    ▄   ▄█    ▄▄▄▄▀ ██   █▄▄▄▄     █ ▄▄  █▄▄▄▄ ████▄ █    ████▄   ▄▀  \n",
        "▄▀       █  ██ ▀▀▀ █    █ █  █  ▄▀     █   █ █  ▄▀ █   █ █    █   █ ▄▀    \n",
        "█ ▀▄  █   █ ██     █    █▄▄█ █▀▀▌      █▀▀▀  █▀▀▌  █   █ █    █   █ █ ▀▄  \n",
        "█   █ █   █ ▐█    █     █  █ █  █      █     █  █  ▀████ ███▄ ▀████ █   █ \n",
        " ███  █▄ ▄█  ▐   ▀         █   █        █      █             ▀       ███  \n",
        "       ▀▀▀                █   ▀          ▀    ▀                           \n",
        "                         ▀                                                \n",
        "                                                                          \n",
        "                                Músicas:                                  \n",
        "                                                                          \n",
        "                 1: Even Flow - Pearl Jam                                 \n",
        "                 2: Paint it, Black - The Rolling Stones                  \n",
        "                 3: Bulls On Parade - Rage Against The Machine            \n",
        "                 4: Voltar                                                \n"
    ],
    atomics_to_string(Strs, "", Str).

strDificuldade(Str) :-
    Strs = [
        "  ▄▀    ▄   ▄█    ▄▄▄▄▀ ██   █▄▄▄▄     █ ▄▄  █▄▄▄▄ ████▄ █    ████▄   ▄▀  \n",
        "▄▀       █  ██ ▀▀▀ █    █ █  █  ▄▀     █   █ █  ▄▀ █   █ █    █   █ ▄▀    \n",
        "█ ▀▄  █   █ ██     █    █▄▄█ █▀▀▌      █▀▀▀  █▀▀▌  █   █ █    █   █ █ ▀▄  \n",
        "█   █ █   █ ▐█    █     █  █ █  █      █     █  █  ▀████ ███▄ ▀████ █   █ \n",
        " ███  █▄ ▄█  ▐   ▀         █   █        █      █             ▀       ███  \n",
        "       ▀▀▀                █   ▀          ▀    ▀                           \n",
        "                         ▀                                                \n",
        "                                                                          \n",
        "                             Dificuldade:                                 \n",
        "                                                                          \n",
        "                             1: Normal                                    \n",
        "                             2: Difícil                                   \n", 
        "                             3: Voltar                                    \n"],
        atomics_to_string(Strs, "", Str).

strTutorial(Str) :-
    Strs = [
        "  ▄▀    ▄   ▄█    ▄▄▄▄▀ ██   █▄▄▄▄     █ ▄▄  █▄▄▄▄ ████▄ █    ████▄   ▄▀   \n",
        "▄▀       █  ██ ▀▀▀ █    █ █  █  ▄▀     █   █ █  ▄▀ █   █ █    █   █ ▄▀     \n",
        "█ ▀▄  █   █ ██     █    █▄▄█ █▀▀▌      █▀▀▀  █▀▀▌  █   █ █    █   █ █ ▀▄   \n",
        "█   █ █   █ ▐█    █     █  █ █  █      █     █  █  ▀████ ███▄ ▀████ █   █  \n",
        " ███  █▄ ▄█  ▐   ▀         █   █        █      █             ▀       ███   \n",
        "       ▀▀▀                █   ▀          ▀    ▀                            \n",
        "                         ▀                                                 \n",
        "Quando a letra chegar ao final da guitarra, aperte-a para ganhar os pontos.\n",
        "Ao acertar uma sêquencia de 10 notas, rebece um bônus de 50 pontos.        \n",
        "Caso erre uma nota, a sequência de notas será resetada.                    \n",
        "No modo normal as músicas tem menos notas e nenhuma nota | L |.            \n"],
        atomics_to_string(Strs, "", Str).


strFimDeJogo(NickName, Pontuacao, Str) :-
    format(atom(Player), '                              Jogador: ~w                         \n', [NickName]),
    format(atom(P), '                              Pontuação: ~w                         \n', [Pontuacao]),
    append([
        "  ▄▀    ▄   ▄█    ▄▄▄▄▀ ██   █▄▄▄▄     █ ▄▄  █▄▄▄▄ ████▄ █    ████▄   ▄▀  \n",
        "▄▀       █  ██ ▀▀▀ █    █ █  █  ▄▀     █   █ █  ▄▀ █   █ █    █   █ ▄▀    \n",
        "█ ▀▄  █   █ ██     █    █▄▄█ █▀▀▌      █▀▀▀  █▀▀▌  █   █ █    █   █ █ ▀▄  \n",
        "█   █ █   █ ▐█    █     █  █ █  █      █     █  █  ▀████ ███▄ ▀████ █   █ \n",
        " ███  █▄ ▄█  ▐   ▀         █   █        █      █             ▀       ███  \n",
        "       ▀▀▀                █   ▀          ▀    ▀                           \n",
        "                         ▀                                                \n",
        "\nVoltando para o menu...                                                 \n"
        
    ], 
    [Player, P], Strs), atomics_to_string(Strs, "", Str).