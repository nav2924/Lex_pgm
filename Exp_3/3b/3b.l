%{
#include <stdio.h>
#include <ctype.h>  
%}

%%

[a-zA-Z]+  { 
               
                for(int i = 0; yytext[i] != '\0'; i++) {
                    yytext[i] = toupper(yytext[i]);
                }
                printf("Converted: %s\n", yytext);
            }

.         { ECHO; }  

%%

int main() {
    yylex();  
    return 0;
}

int yywrap() {
    return 1;  // Return 1 to indicate the end of input
}
