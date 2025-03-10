%{
#include <stdio.h>
#include <string.h>

#define MAX_CHAR 256  // Define the maximum number of characters

int char_count[MAX_CHAR] = {0};  // Array to store character occurrences
%}

%%

.  { char_count[(unsigned char)yytext[0]]++; }  // Increment the count for each character
\n { return 0; }  // Stop processing on newline

%%

int main() {
    printf("Enter a string: ");
    yylex();  // Start lexical analysis

    printf("\nCharacter Occurrences:\n");
    for (int i = 0; i < MAX_CHAR; i++) {
        if (char_count[i] > 0) {
            printf("'%c' : %d\n", i, char_count[i]);
        }
    }

    return 0;
}

int yywrap() {
    return 1;
}
