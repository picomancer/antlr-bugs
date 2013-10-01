
Reproducing https://github.com/antlr/antlr3/issues/128
======================================================

    cd antlr3-issue128
    ln -s /path/to/antlr-3.5-complete-no-st3.jar antlr.jar
    ./build.sh                      # shows correct behavior
    nano bugTreeRewriter.g          # use nano or your favorite text editor to uncomment rewrite=true;
    ./build.sh                      # breaks

The bug reproduces with antlr-3.5-complete-no-st3.jar (sha256sum=89fe660f7bac358310940b9edeaf654f443b890c5fbc4fb75976c754e508c180).  I have not tested earlier or later versions.

