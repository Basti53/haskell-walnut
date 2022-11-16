#!/usr/bin/env stack
{- stack script --resolver lts-17.9
  --package process
-}
import System.IO
import System.Process

javaPath = "C:\\Program Files\\Common Files\\Oracle\\Java\\javapath\\java.exe"
walnutPath = "C:\\Users\\Basti\\Desktop\\Walnut\\bin\\"

main :: IO ()
-- main = readProcess javaPath ["-classpath", walnutPath, "Main.Prover"] "eval this \"Ex x=x\":" >>= putStrLn
main = do
    (Just hin, Just hout, _, ph) <- createProcess (proc "java" ["Main.Prover"]){cwd=Just walnutPath, std_out=CreatePipe, std_in=CreatePipe}
    hPutStrLn hin "eval this \"Ex x=0\":"
    str <- hGetContents hout
    putStrLn str