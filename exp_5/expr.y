%{
#include <stdio.h>
#include <stdlib.h>

int yylex();    // Lexer function
void yyerror(const char *s);  // Error handling function

%}

%token NUM  // Token for numbers
%left '+' '-'  // Left associative addition and subtraction
%left '*' '/'  // Left associative multiplication and division
%left '(' ')'  // Parentheses

%%

expr    : expr '+' term   { $$ = $1 + $3; }
        | expr '-' term   { $$ = $1 - $3; }
        | term            { $$ = $1; }
        ;

term    : term '*' factor { $$ = $1 * $3; }
        | term '/' factor { $$ = $1 / $3; }
        | factor          { $$ = $1; }
        ;

factor  : '(' expr ')'   { $$ = $2; }
        | NUM            { $$ = $1; }
        ;

%%

int main() {
    printf("Enter an arithmetic expression: ");
    yyparse();  // Start parsing
    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

