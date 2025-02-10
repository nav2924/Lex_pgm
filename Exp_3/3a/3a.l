%{
#include <stdio.h>
%}

%%
"if"|"else"|"while"|"for"    { printf("KEYWORD: %s\n", yytext); }
[a-zA-Z_][a-zA-Z0-9_]*       { printf("IDENTIFIER: %s\n", yytext); }
[0-9]+                       { printf("NUMBER: %s\n", yytext); }
[+\-*/=<>]                     { printf("OPERATOR: %s\n", yytext); }
[{}();]                      { printf("SPECIAL CHARACTER: %s\n", yytext); }
[ \t\n]+                     { /* Ignore whitespaces */ }
.                            { printf("UNKNOWN: %s\n", yytext); }
%%

int main() {
    yylex();
    return 0;
}

int yywrap(){
return 1;
}