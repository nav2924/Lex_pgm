%{
    #include <stdio.h>
    #include <stdlib.h>
    int yylex();
    void yyerror(const char *s);
%}

%token A B

%%
S : /* empty */
  | S A B
  ;

%%

int main() {
    printf("Enter a string: ");
    yyparse();
    printf("String is valid.\n");
    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
    exit(1);
}
