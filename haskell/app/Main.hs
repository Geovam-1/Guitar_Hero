module Main where

import Tutorial.Tutorial
import Util
import InterfaceTexto.Textos
import MusicPlayer
import MusicData
import Data.Char (isSpace, toLower)
import Game.Jogo as Jogo
import System.IO (hSetBuffering, BufferMode(NoBuffering), stdin)

tecla :: IO Char
tecla = do
    hSetBuffering stdin NoBuffering
    c <- getChar
    return c

menuBemVindo :: IO()
menuBemVindo = do
    limparTerminal
    putStr strBemvindo
    comando <- tecla

    case toLower comando of
        '1' -> menuNickName
        '2' -> do
            pararMusica
            encerraPrograma
        _   -> do
            putStr "Comando Inválido! Tente novamente.\n"
            delay
            menuBemVindo

menuNickName :: IO()
menuNickName = do
    limparTerminal
    putStr strNickName
    nickName <- getLine

    if nickName == "1" then do 
        menuBemVindo
    else if all isSpace nickName then do
        putStrLn "Insira um nome valido!\n" 
        delay
        menuNickName
    else menuInicial nickName

menuInicial :: String -> IO ()
menuInicial nickName = do
    limparTerminal
    putStr (strInicial nickName)
    comando <- tecla

    case toLower comando of
        '1' -> menuMusicas nickName
        '2' -> do 
            mostrarTutorial 2
            menuInicial nickName
        '3' -> menuNickName
        _   -> do
            putStr "Comando Inválido! Tente novamente.\n"
            delay
            menuInicial nickName

menuMusicas :: String -> IO ()
menuMusicas nickName = do
    limparTerminal
    putStr strMusicas
    musica <- tecla

    case toLower musica of
        '1' -> menuDificuldade nickName 1
        '2' -> menuDificuldade nickName 2
        '3' -> menuDificuldade nickName 3
        '4' -> menuInicial nickName
        _   -> do
            putStr "Música inválida! Tente novamente.\n"
            delay
            menuMusicas nickName

menuDificuldade :: String -> Int -> IO ()
menuDificuldade nickName m = do
    limparTerminal
    putStr strDificuldade
    dificuldade <- tecla

    case toLower dificuldade of
        '1' -> iniciarJogo m 1 nickName
        '2' -> iniciarJogo m 2 nickName
        '3' -> menuMusicas nickName
        _   -> do
            putStr "Dificuldade inválida! Tente novamente.\n"
            delay
            menuDificuldade nickName m

iniciarJogo :: Int -> Int -> String -> IO ()
iniciarJogo m dificuldade nickName = do
    pararMusica
    tocarMusica m

    Jogo.gameLoop (getMusicNotes m dificuldade) nickName (voltaMenu nickName)

voltaMenu :: String -> IO ()
voltaMenu nickName = do 
    tocarMusicaMenu
    menuInicial nickName

main :: IO ()
main = do
    hSetBuffering stdin NoBuffering
    tocarMusicaMenu
    menuBemVindo
