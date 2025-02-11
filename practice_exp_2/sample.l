%{
    #include <stdio.h>
    int numWords = 0;
    int numChar = 0;
    int numLines = 0;
%}

%%

\n {numLines ++;numChar ++;}
[\t]+ {numChar += yyleng;}
[a-zA-Z0-9]+ {numWords ++;numChar += yyleng;}
. {numChar ++;}

%%

int main(int argc , char **argv){
    FILE *file = fopen((argv[1]), "r");

    yyin = file;
    yylex();
    fclose(file);
    printf("Number of words: %d\n", numWords);
    printf("Number of characters: %d\n", numChar);
    printf("Number of lines: %d\n", numLines);

    return 0;
}

int yywrap(){
    return 1;
}