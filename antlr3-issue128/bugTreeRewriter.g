
tree grammar bugTreeRewriter;

options
{
    ASTLabelType=CommonTree;
    tokenVocab=bug;
    output=AST;
/*  rewrite=true; */
}

prgm : ^(PRGM stmt*) ;

stmt : ^(OP_ASSIGN a=expr b=expr) -> ^(OP_ASSIGN $b $a) ;

expr : ID | INT ;

