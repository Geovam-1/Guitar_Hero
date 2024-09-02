module InterfaceTexto.Textos where

strBemvindo :: [Char]
strBemvindo = 
    "  ▄▀    ▄   ▄█    ▄▄▄▄▀ ██   █▄▄▄▄      ▄  █ ██      ▄▄▄▄▄   █  █▀ ▄███▄   █    █     \n" ++   
    "▄▀       █  ██ ▀▀▀ █    █ █  █  ▄▀     █   █ █ █    █     ▀▄ █▄█   █▀   ▀  █    █     \n" ++  
    "█ ▀▄  █   █ ██     █    █▄▄█ █▀▀▌      ██▀▀█ █▄▄█ ▄  ▀▀▀▀▄   █▀▄   ██▄▄    █    █     \n" ++      
    "█   █ █   █ ▐█    █     █  █ █  █      █   █ █  █  ▀▄▄▄▄▀    █  █  █▄   ▄▀ ███▄ ███▄  \n" ++
    " ███  █▄ ▄█  ▐   ▀         █   █          █     █              █   ▀███▀       ▀    ▀ \n" ++
    "       ▀▀▀                █   ▀          ▀     █              ▀                       \n" ++
    "                         ▀                    ▀                                       \n" ++
    "                                                                                      \n" ++
    "                                                                                      \n" ++
    "                  Prepare-se para o desafio! Bem-vindo ao Guitar Hero                 \n" ++
    "                                                                                      \n" ++
    "                                  1: Add Nickname                                     \n" ++
    "                                  2: Sair                                             \n"

strNickName :: [Char]
strNickName = 
    "  ▄▀    ▄   ▄█    ▄▄▄▄▀ ██   █▄▄▄▄      ▄  █ ██      ▄▄▄▄▄   █  █▀ ▄███▄   █    █     \n" ++   
    "▄▀       █  ██ ▀▀▀ █    █ █  █  ▄▀     █   █ █ █    █     ▀▄ █▄█   █▀   ▀  █    █     \n" ++  
    "█ ▀▄  █   █ ██     █    █▄▄█ █▀▀▌      ██▀▀█ █▄▄█ ▄  ▀▀▀▀▄   █▀▄   ██▄▄    █    █     \n" ++      
    "█   █ █   █ ▐█    █     █  █ █  █      █   █ █  █  ▀▄▄▄▄▀    █  █  █▄   ▄▀ ███▄ ███▄  \n" ++
    " ███  █▄ ▄█  ▐   ▀         █   █          █     █              █   ▀███▀       ▀    ▀ \n" ++
    "       ▀▀▀                █   ▀          ▀     █              ▀                       \n" ++
    "                         ▀                    ▀                                       \n" ++
    "                                                                                      \n" ++
    "                                                                                      \n" ++
    "                              Digite seu NickName:                                    \n" ++
    "                                                                                      \n" ++
    "                                  1: Voltar                                           \n"


strInicial :: String -> [Char]
strInicial nickName = 
    "  ▄▀    ▄   ▄█    ▄▄▄▄▀ ██   █▄▄▄▄      ▄  █ ██      ▄▄▄▄▄   █  █▀ ▄███▄   █    █     \n" ++   
    "▄▀       █  ██ ▀▀▀ █    █ █  █  ▄▀     █   █ █ █    █     ▀▄ █▄█   █▀   ▀  █    █     \n" ++  
    "█ ▀▄  █   █ ██     █    █▄▄█ █▀▀▌      ██▀▀█ █▄▄█ ▄  ▀▀▀▀▄   █▀▄   ██▄▄    █    █     \n" ++      
    "█   █ █   █ ▐█    █     █  █ █  █      █   █ █  █  ▀▄▄▄▄▀    █  █  █▄   ▄▀ ███▄ ███▄  \n" ++
    " ███  █▄ ▄█  ▐   ▀         █   █          █     █              █   ▀███▀       ▀    ▀ \n" ++
    "       ▀▀▀                █   ▀          ▀     █              ▀                       \n" ++
    "                         ▀                    ▀                                       \n" ++
    "                                                                                      \n" ++
    "                                  Jogador: " ++ nickName ++ "                         \n" ++
    "                                                                                      \n" ++
    "                                  1: Jogar                                            \n" ++
    "                                  2: Tutorial                                         \n" ++
    "                                  3: Voltar                                           \n"

strMusicas :: [Char]
strMusicas =
    "  ▄▀    ▄   ▄█    ▄▄▄▄▀ ██   █▄▄▄▄      ▄  █ ██      ▄▄▄▄▄   █  █▀ ▄███▄   █    █     \n" ++   
    "▄▀       █  ██ ▀▀▀ █    █ █  █  ▄▀     █   █ █ █    █     ▀▄ █▄█   █▀   ▀  █    █     \n" ++  
    "█ ▀▄  █   █ ██     █    █▄▄█ █▀▀▌      ██▀▀█ █▄▄█ ▄  ▀▀▀▀▄   █▀▄   ██▄▄    █    █     \n" ++      
    "█   █ █   █ ▐█    █     █  █ █  █      █   █ █  █  ▀▄▄▄▄▀    █  █  █▄   ▄▀ ███▄ ███▄  \n" ++
    " ███  █▄ ▄█  ▐   ▀         █   █          █     █              █   ▀███▀       ▀    ▀ \n" ++
    "       ▀▀▀                █   ▀          ▀     █              ▀                       \n" ++
    "                         ▀                    ▀                                       \n" ++
    "                                                                                      \n" ++
    "                                    Músicas:                                          \n" ++
    "                                                                                      \n" ++
    "                    1: Even Flow - Pearl Jam                                          \n" ++
    "                    2: Paint it, Black - The Rolling Stones                           \n" ++
    "                    3: Bulls On Parade - Rage Against The Machine                     \n" ++
    "                    4: Voltar                                                         \n"

strDificuldade :: [Char]
strDificuldade =
    "  ▄▀    ▄   ▄█    ▄▄▄▄▀ ██   █▄▄▄▄      ▄  █ ██      ▄▄▄▄▄   █  █▀ ▄███▄   █    █     \n" ++   
    "▄▀       █  ██ ▀▀▀ █    █ █  █  ▄▀     █   █ █ █    █     ▀▄ █▄█   █▀   ▀  █    █     \n" ++  
    "█ ▀▄  █   █ ██     █    █▄▄█ █▀▀▌      ██▀▀█ █▄▄█ ▄  ▀▀▀▀▄   █▀▄   ██▄▄    █    █     \n" ++      
    "█   █ █   █ ▐█    █     █  █ █  █      █   █ █  █  ▀▄▄▄▄▀    █  █  █▄   ▄▀ ███▄ ███▄  \n" ++
    " ███  █▄ ▄█  ▐   ▀         █   █          █     █              █   ▀███▀       ▀    ▀ \n" ++
    "       ▀▀▀                █   ▀          ▀     █              ▀                       \n" ++
    "                         ▀                    ▀                                       \n" ++
    "                                                                                      \n" ++
    "                                  Dificuldade:                                        \n" ++
    "                                                                                      \n" ++
    "                                  1: Normal                                           \n" ++
    "                                  2: Difícil                                          \n" ++ 
    "                                  3: Voltar                                           \n"

strTurorial :: [Char]
strTurorial =
    "  ▄▀    ▄   ▄█    ▄▄▄▄▀ ██   █▄▄▄▄      ▄  █ ██      ▄▄▄▄▄   █  █▀ ▄███▄   █    █     \n" ++   
    "▄▀       █  ██ ▀▀▀ █    █ █  █  ▄▀     █   █ █ █    █     ▀▄ █▄█   █▀   ▀  █    █     \n" ++  
    "█ ▀▄  █   █ ██     █    █▄▄█ █▀▀▌      ██▀▀█ █▄▄█ ▄  ▀▀▀▀▄   █▀▄   ██▄▄    █    █     \n" ++      
    "█   █ █   █ ▐█    █     █  █ █  █      █   █ █  █  ▀▄▄▄▄▀    █  █  █▄   ▄▀ ███▄ ███▄  \n" ++
    " ███  █▄ ▄█  ▐   ▀         █   █          █     █              █   ▀███▀       ▀    ▀ \n" ++
    "       ▀▀▀                █   ▀          ▀     █              ▀                       \n" ++
    "                         ▀                    ▀                                       \n" ++
    "Quando a letra chegar ao final da guitarra, aperte-a para ganhar os pontos.\nAo acertar uma sêquencia de 10 notas, rebece um bônus de 50 pontos.\nCaso erre uma nota, a sequência de notas será resetada.\nNo modo normal as músicas tem menos notas e nenhuma nota | L |\n"


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

msgFinal :: IO ()
msgFinal = do
    putStrLn "Aperte Ctrl + Z para fechar o jogo."