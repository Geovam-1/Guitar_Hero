module Tutorial.Tutorial where

import Control.Concurrent (threadDelay)
import Util
import InterfaceTexto.TextoMenu (strTurorial)

tutorialGuitar :: [String]
tutorialGuitar = [
    "| A |   |   |   |   |\n" ++
    "|   |   |   |   |   |\n" ++
    "| A |   |   |   |   |\n" ++
    "|   |   |   | K |   |\n" ++
    "|   |   | J |   |   |\n" ++
    "|   |   |   |   | L |\n" ++
    "|---|---|---|---|---|\n" ++
    "| A | S | J | K | L |",

    "|   |   |   |   |   |\n" ++
    "| A |   |   |   |   |\n" ++
    "|   |   |   |   |   |\n" ++
    "| A |   |   |   |   |\n" ++
    "|   |   |   | K |   |\n" ++
    "|   |   | J |   |   |\n" ++
    "|---|---|---|---|---|\n" ++
    "| A | S | J | K | L |",

    "|   |   |   |   | L |\n" ++
    "|   |   |   |   |   |\n" ++
    "| A |   |   |   |   |\n" ++
    "|   |   |   |   |   |\n" ++
    "| A |   |   |   |   |\n" ++
    "|   |   |   | K |   |\n" ++
    "|---|---|---|---|---|\n" ++
    "| A | S | J | K | L |",

    "|   |   | J |   |   |\n" ++
    "|   |   |   |   | L |\n" ++
    "|   |   |   |   |   |\n" ++
    "| A |   |   |   |   |\n" ++
    "|   |   |   |   |   |\n" ++
    "| A |   |   |   |   |\n" ++
    "|---|---|---|---|---|\n" ++
    "| A | S | J | K | L |",

    "|   |   |   | K |   |\n" ++
    "|   |   | J |   |   |\n" ++
    "|   |   |   |   | L |\n" ++
    "|   |   |   |   |   |\n" ++
    "| A |   |   |   |   |\n" ++
    "|   |   |   |   |   |\n" ++
    "|---|---|---|---|---|\n" ++
    "| A | S | J | K | L |",

    "| A |   |   |   |   |\n" ++
    "|   |   |   | K |   |\n" ++
    "|   |   | J |   |   |\n" ++
    "|   |   |   |   | L |\n" ++
    "|   |   |   |   |   |\n" ++
    "| A |   |   |   |   |\n" ++
    "|---|---|---|---|---|\n" ++
    "| A | S | J | K | L |",

    "|   |   |   |   |   |\n" ++
    "| A |   |   |   |   |\n" ++
    "|   |   |   | K |   |\n" ++
    "|   |   | J |   |   |\n" ++
    "|   |   |   |   | L |\n" ++
    "|   |   |   |   |   |\n" ++
    "|---|---|---|---|---|\n" ++
    "| A | S | J | K | L |"
    ]

mostrarTutorial :: Int -> IO ()
mostrarTutorial n = do
    mapM_ guitarra tutorialGuitar
    if n > 0 
        then mostrarTutorial (n - 1)
        else return ()
  where
    guitarra :: String -> IO ()
    guitarra estado = do
        limparTerminal
        putStrLn strTurorial
        mapM_ colorirEImprimirLinha (lines estado)
        threadDelay 500000
