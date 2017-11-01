# txt2rtf
Convert plain text files to RTF [Haskell]

Disclaimer: This README assumes that like me, you have never worked with Haskell before. I put this together after figuring out how to make the package work after a few tries. I do not claim this to be complete, or even oorrect! But it should help you get started with installing and using the package without any problem.

## Installation

1. Decompress the folder containing source code. Typically the name is like `txt2rtf-1.0.1` after decompression.

2. Run the following commands:

    i. `sudo apt-get install cabal-install`
    
    Select Y when prompted.
    
    ii. `cd txt2rtf-1.0.1`
    
    iii. `cabal install`
    
That's it!

## Basic Usage

Run the following commands:

1. `cd txt2rtf-1.0.1/dist/build/txt2rtf`

2. `./txt2rtf /path/to/file/filename` ---converts `filename` to 'filename.rtf'


    
    
