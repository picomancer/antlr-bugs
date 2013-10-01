#!/bin/sh

set -e
set -x

rm -Rf output
java -jar antlr.jar -o output bug.g
java -jar antlr.jar -o output bugTreeRewriter.g
ln -s ../Main.java output/Main.java
ln -s ../program.txt output/program.txt
cd output
javac -cp ../antlr.jar bugLexer.java bugParser.java bugTreeRewriter.java Main.java
java -cp ../antlr.jar:. Main
