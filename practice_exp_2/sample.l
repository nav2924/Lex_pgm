%{
#include<stdio.h>
#include<ctype.h>
%}

%%

[a-zA-Z]+ {
            for(int i=0 ; i<yytext[i] != '\0' ;i++){
                yytext[i] = toupper(yytext[i]);
            }
            printf("Converted text is %s",yytext[i]);
          }
. {ECHO ;}          
%%

int main(){
    yylex();
    return 0;
}

int yywrap(){
    return 1;
}