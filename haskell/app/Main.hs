module Main where

import Tutorial.Tutorial
import Util
import InterfaceTexto.Textos
import MusicPlayer
import MusicData
import Data.Char (isSpace)
import Game.Jogo as Jogo

menuBemVindo :: IO()
menuBemVindo = do
    limparTerminal
    putStr strBemvindo
    comando <- readLn :: IO Int

    if comando == 1 then menuNickName
    else if comando == 2 then do
        pararMusica
        encerraPrograma
    else do
        putStr "Comando Inválido! Tente novamente.\n"
        delay
        menuBemVindo

menuNickName :: IO()
menuNickName = do
    limparTerminal
    putStr strNickName
    nickName <- getLine
    if all isSpace nickName then do
        putStrLn "Insira um nome valido \n" 
        delay
        menuNickName
    else menuInicial nickName

menuInicial :: String -> IO ()
menuInicial nickName = do
    limparTerminal
    putStr (strInicial nickName)
    comando <- readLn :: IO Int

    if comando == 1 then menuMusicas nickName
    else if comando == 2 then do 
        mostrarTutorial 2
        menuInicial nickName
    else if comando == 3 then do
        menuNickName
    else do
        putStr "Comando Inválido! Tente novamente.\n"
        delay
        menuInicial nickName

menuMusicas :: String -> IO ()
menuMusicas nickName = do
    limparTerminal
    putStr strMusicas
    musica <- readLn :: IO Int

    if musica >= 1 && musica <= 3 then 
        menuDificuldade nickName musica
    else if musica == 4 then
        menuInicial nickName
    else do
        putStr "Música inválida! Tente novamente.\n"
        delay
        menuMusicas nickName

menuDificuldade :: String -> Int -> IO ()
menuDificuldade nickName m = do
    limparTerminal
    putStr strDificuldade
    dificuldade <- readLn :: IO Int

    if dificuldade == 3 then do
        menuMusicas nickName
    else if dificuldade > 3 then do
        putStr "Dificuldade inválida! Tente novamente.\n"
        delay
        menuDificuldade nickName m
    else do
        pararMusica
    
    tocarMusica m
    Jogo.gameLoop (getMusicNotes m dificuldade) nickName (voltaMenu nickName)

voltaMenu :: String -> IO ()
voltaMenu nickName = do 
    tocarMusicaMenu
    menuInicial nickName

main :: IO ()
main = do
    tocarMusicaMenu
    menuBemVindo

