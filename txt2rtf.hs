{-
Copyright (C) 2005 John Goerzen <jgoerzen@complete.org>

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
-}

module Main where

import System.Environment

preamble = intersperse "\n" 
    ["{\\rtf\\ansi\\deff0",
     "{\\fonttbl{\\f0\\fswiss Courier New;}}\n"]
footer = "}\n"

adjline :: String -> String
adjline [] = "\\line"
adjline x:xs =
    case x of
           '\\' -> "\\\\" ++ adjline xs
           '{' -> "\\{" ++ adjline xs
           '}' -> "\\}" ++ adjline xs
           '\f' -> "\\page" ++ adjline xs

adjlines :: [String] -> [String]
adjlines = map adjline

convert :: String -> String
convert x = preamble ++ (unlines . adjlines . lines $ x) ++ footer

convertFile :: String -> IO ()
convertFile fn =
    do i <- readFile fn
       writeFile newfn (convert i)
    where newfn = if isSuffixOf ".txt" fn
                      then take (length fn - 4) fn ++ ".rtf"
                      else fn ++ ".rtf"

printHelp :: IO ()
printHelp =
    do p "Usage:"
       p "txt2rtf without filenames will emit RTF on stdout"
       p "txt2rtf with one or more files will convert those files"
    where p = putStrLn

main = do
       args <- getArgs
       if length args == 0
          then do c <- getContents
                  putStr $ convert c
          else if args == ["--help"]
                  then printHelp
                  else mapM_ convertFile args
