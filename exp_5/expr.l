%{
#include "y.tab.h"
#include <stdio.h>
#include <stdlib.h>
%}

%%

[0-9]+   { yylval = atoi(yytext); return NUM; }  // Match numbers
[+\-*/()] { return yytext[0]; }  // Return operators and parentheses as tokens
[ \t\n]   { /* Ignore spaces, tabs, and newlines */ }

%%

int yywrap() {
    return 1;  // End of input
}
