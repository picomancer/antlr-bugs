
grammar bug;

options
{
    output = AST;
}

tokens
{
    PRGM;
}

prgm : stmt* EOF -> ^(PRGM stmt*) ;

stmt : expr OP_ASSIGN expr ';' -> ^(OP_ASSIGN expr expr) ;

expr : ID | INT ;

OP_ASSIGN : '=' ;

ID : ('a'..'z' | 'A'..'Z' | '_')+ ;

INT : ('0'..'9')+ ;

WS : (' ' | '\t' | '\r' | '\n')+ { $channel = HIDDEN; } ;

