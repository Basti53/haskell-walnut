#!/usr/bin/env stack
{- stack script --resolver lts-17.9
  --package process
-}
import System.Process

main :: IO ()
main = callProcess "java" ["--version"]