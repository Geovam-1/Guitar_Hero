module Game.Jogo where

import System.Console.ANSI
import Control.Concurrent (forkIO, threadDelay, killThread)
import Control.Monad (forever)
import Util
import Data.IORef
import Data.Time.Clock (getCurrentTime, diffUTCTime, UTCTime)
import System.IO (hSetBuffering, BufferMode(NoBuffering), stdin, hFlush, stdout)
import InterfaceTexto.Textos
import Control.Exception (finally)

guitarAltura :: Int
guitarAltura = 7

guitarBase :: [String]
guitarBase =
    [ "|   |   |   |   |   |"
    , "|   |   |   |   |   |"
    , "|   |   |   |   |   |"
    , "|   |   |   |   |   |"
    , "|   |   |   |   |   |"
    , "|   |   |   |   |   |"
    , "|   |   |   |   |   |"
    , "|---|---|---|---|---|"
    , "| A | S | J | K | L |"
    ]

tempoQuedaNota :: Int
tempoQuedaNota = 240000

printTemplateGuitar :: [String] -> Int -> Int -> String -> String -> IO ()
printTemplateGuitar guitar score sequencia mensagemBonus nickName = do
    clearScreen
    setCursorPosition 0 0
    mapM_ colorirEImprimirLinha guitar
    setCursorPosition 9 30
    putStrLn $ "Jogador: " ++ nickName
    setCursorPosition 10 30
    putStrLn $ "Pontuação: " ++ show score
    setCursorPosition 10 50
    putStrLn $ "Sequência Atual: " ++ show sequencia
    setCursorPosition 10 75
    putStrLn mensagemBonus
    setCursorPosition 9 0
    hFlush stdout

cairNota :: Int -> Int -> Char -> [String] -> [String]
cairNota notaColuna notaLinha notaChar guitar =
    let linhaAtualizar = guitar !! notaLinha
        atualizarLinha = take (notaColuna * 4 - 2) linhaAtualizar ++ [notaChar] ++ drop (notaColuna * 4 - 1) linhaAtualizar
    in take notaLinha guitar ++ [atualizarLinha] ++ drop (notaLinha + 1) guitar

moverNotas :: [String] -> [String]
moverNotas guitar = 
    let linhasMovidas = take guitarAltura ("|   |   |   |   |   |" : guitar)
    in linhasMovidas ++ drop guitarAltura guitar

processarTupla :: (Int, Int, Int, Int, Int) -> [String] -> [String]
processarTupla (n1, n2, n3, n4, n5) guitar =
    let guitar1 = if n1 == 1 then cairNota 1 0 'A' guitar else guitar
        guitar2 = if n2 == 1 then cairNota 2 0 'S' guitar1 else guitar1
        guitar3 = if n3 == 1 then cairNota 3 0 'J' guitar2 else guitar2
        guitar4 = if n4 == 1 then cairNota 4 0 'K' guitar3 else guitar3
        guitar5 = if n5 == 1 then cairNota 5 0 'L' guitar4 else guitar4
    in guitar5

bonus :: IORef Int -> IORef Int -> IORef String -> IO ()
bonus scoreRef sequenciaRef bonusRef = do
    sequencia <- readIORef sequenciaRef
    let sequenciaBonus = if sequencia > 0 && sequencia `mod` 10 == 0
                         then 50
                         else 0
    modifyIORef' scoreRef (+ (10 + sequenciaBonus))
    modifyIORef' sequenciaRef (+1)
    let mensagemBonus = if sequencia > 0 && sequencia `mod` 10 == 0
                        then "Bônus! +50 pontos"
                        else ""
    writeIORef bonusRef mensagemBonus

entradaUsuario :: IORef Int -> IORef Int -> IORef [(Int, UTCTime, Int)] -> IORef String -> IO ()
entradaUsuario scoreRef sequenciaRef notasRef bonusRef = forever $ do
    c <- getChar
    currentTime <- getCurrentTime
    notas <- readIORef notasRef
    let col = case c of
                'a' -> 1
                's' -> 2
                'j' -> 3
                'k' -> 4
                'l' -> 5
                _   -> 0
    if col >= 1 && col <= 5
      then do
        let margem = 0.2
            duracaoCair = fromIntegral (guitarAltura * tempoQuedaNota) / 1000000
        let matched = any (\(nCol, startTime, linha) -> nCol == col && linha == guitarAltura && 
                abs (realToFrac (diffUTCTime currentTime startTime) - duracaoCair) < margem) notas
        if matched
          then bonus scoreRef sequenciaRef bonusRef
          else do
            putStrLn "Errou!"
            writeIORef sequenciaRef 0
            writeIORef bonusRef ""
      else return ()

gameLoop :: [(Int, Int, Int, Int, Int)] -> String ->  IO () -> IO ()
gameLoop notaTuplas nickName callback = do
    hSetBuffering stdin NoBuffering
    scoreRef <- newIORef 0
    sequenciaRef <- newIORef 0
    notasRef <- newIORef []
    bonusRef <- newIORef ""

    entradaThreadId <- forkIO $ entradaUsuario scoreRef sequenciaRef notasRef bonusRef

    let loop guitarEstado notas = do
            case notas of
                [] -> do 
                    limparTerminal
                    score <- readIORef scoreRef
                    putStrLn (strFimJogo nickName score)
                    killThread entradaThreadId
                    threadDelay 1500000
                    callback
                (nt:nts) -> do
                    currentTime <- getCurrentTime
                    let atualizaGuitar = processarTupla nt guitarEstado
                    let novasNotas = [(1, currentTime, 0) | (n1, _, _, _, _) <- [nt], n1 == 1] ++
                                   [(2, currentTime, 0) | (_, n2, _, _, _) <- [nt], n2 == 1] ++
                                   [(3, currentTime, 0) | (_, _, n3, _, _) <- [nt], n3 == 1] ++
                                   [(4, currentTime, 0) | (_, _, _, n4, _) <- [nt], n4 == 1] ++
                                   [(5, currentTime, 0) | (_, _, _, _, n5) <- [nt], n5 == 1]
                    modifyIORef' notasRef (++ novasNotas)
                    let movedGuitar = moverNotas atualizaGuitar
                    score <- readIORef scoreRef
                    sequencia <- readIORef sequenciaRef
                    mensagemBonus <- readIORef bonusRef
                    printTemplateGuitar movedGuitar score sequencia mensagemBonus nickName
                    modifyIORef' notasRef (map (\(col, t, linha) -> (col, t, linha + 1)))
                    modifyIORef' notasRef (filter (\(_, _, linha) -> linha <= guitarAltura))
                    threadDelay tempoQuedaNota
                    loop movedGuitar nts

    loop guitarBase notaTuplas `finally` killThread entradaThreadId
    return ()