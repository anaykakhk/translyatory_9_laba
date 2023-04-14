%{
#include "main.tab.h"
#include <stdlib.h>

// E ::= T E' 
// E' ::= '|' T E' | e
// T ::= D T'
// T' ::= '&' D T' | e
// D::= H D'
// D'::= '^' H D' | e
// H::= ~F | F
// F ::= (E) | i
%}

%%

[0-9]+      { yylval.number = atoi(yytext); return I; }
"("         { return LPAREN; }
")"         { return RPAREN; }
"|"         { return OR; }
"&"         { return AND; }
"^"         { return XOR; }
"~"         { return NOT; }
[ \t\n]+    {}

%%

