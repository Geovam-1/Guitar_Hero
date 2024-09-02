module Util where

import System.Console.ANSI
import System.Process (callCommand)
import System.Exit

colorirEImprimirLinha :: String -> IO ()
colorirEImprimirLinha [] = return ()
colorirEImprimirLinha linha = do
    mapM_ colorChar linha
    putStrLn ""

colorChar :: Char -> IO ()
colorChar char = do
    case char of
        'A' -> setSGR [SetColor Foreground Vivid Green]
        'S' -> setSGR [SetColor Foreground Vivid Red]
        'J' -> setSGR [SetColor Foreground Vivid Yellow]
        'K' -> setSGR [SetColor Foreground Vivid Blue]
        'L' -> setSGR [SetColor Foreground Vivid Magenta]
        _   -> setSGR [Reset]
    putChar char
    setSGR [Reset]

limparTerminal :: IO ()
limparTerminal = callCommand "clear"

encerraPrograma :: IO ()
encerraPrograma = do
    putStrLn "Fechando o jogo..."
    exitSuccess