module InterfaceTexto.TextoFimJogo where

strFimJogo :: String-> Int -> [Char]
strFimJogo nickName pontuacao =
    "  ▄▀    ▄   ▄█    ▄▄▄▄▀ ██   █▄▄▄▄      ▄  █ ██      ▄▄▄▄▄   █  █▀ ▄███▄   █    █     \n" ++   
    "▄▀       █  ██ ▀▀▀ █    █ █  █  ▄▀     █   █ █ █    █     ▀▄ █▄█   █▀   ▀  █    █     \n" ++  
    "█ ▀▄  █   █ ██     █    █▄▄█ █▀▀▌      ██▀▀█ █▄▄█ ▄  ▀▀▀▀▄   █▀▄   ██▄▄    █    █     \n" ++      
    "█   █ █   █ ▐█    █     █  █ █  █      █   █ █  █  ▀▄▄▄▄▀    █  █  █▄   ▄▀ ███▄ ███▄  \n" ++
    " ███  █▄ ▄█  ▐   ▀         █   █          █     █              █   ▀███▀       ▀    ▀ \n" ++
    "       ▀▀▀                █   ▀          ▀     █              ▀                       \n" ++
    "                         ▀                    ▀                                       \n" ++
    "                                                                                      \n" ++
    "                                  Jogador: " ++ nickName ++ "                         \n" ++
    "                                  Pontuação: " ++ show pontuacao ++ "                 \n" ++
    "                                                                                      \n" ++
    "                                                                                      \n" ++
    "                                                                                      \n"