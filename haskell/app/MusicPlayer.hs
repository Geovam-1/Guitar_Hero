module MusicPlayer where

import System.Process (callCommand)

tocarMusica :: Int -> IO ()
tocarMusica m = do
    if  m == 1 then callCommand "cvlc --play-and-exit haskell/songs/Even.mp3 > /dev/null 2>&1  &"
    else if m == 2 then callCommand "cvlc --play-and-exit haskell/songs/Paint.mp3 > /dev/null 2>&1  &"
    else callCommand "cvlc --play-and-exit haskell/songs/Bulls.mp3 > /dev/null 2>&1  &"
    
tocarMusicaMenu :: IO ()
tocarMusicaMenu = do
    callCommand "cvlc --loop haskell/songs/Menu.mp3 > /dev/null 2>&1 &"
    
pararMusica :: IO ()
pararMusica = callCommand "pkill vlc"
