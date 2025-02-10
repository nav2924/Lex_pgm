%{
#include <stdio.h>
#include <ctype.h>  // for toupper function
%}

CONVERT_WORD   convert[a-zA-Z]*

%%

{CONVERT_WORD}  { 
                    // Convert the matched substring to uppercase
                    for(int i = 0; yytext[i] != '\0'; i++) {
                        yytext[i] = toupper(yytext[i]);
                    }
                    printf("Converted: %s\n", yytext);
                }
.                 { ECHO; }  // Echo any other character

%%

int main() {
    yylex();
    return 0;
}

int yywrap(){
	return 1;
}
