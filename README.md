Vim-quickrunner
============

Run code from Vim with default input/output files. Make testing and debugging much quicker!

Useful for competing in a ACM/ICPC-like contest as well as topcoders.

Only support C/CPP. Not tested with Java.


Install
-------

Try [pathogen](https://github.com/tpope/vim-pathogen) or [vundle](https://github.com/gmarik/vundle). Great plugins make your life easier.

Usage
-----

Press \<F9\> for compiling and running current buffer with input file. The input file replace the suffix ('.c' or '.cpp' and so on) of current file with a '.in'. The output are printed to the screen.

\<C-F6\> for compiling only.
\<F6\> for compiling and running.
\<F8\> for compiling and running with input and output file ( with a .out suffix).
